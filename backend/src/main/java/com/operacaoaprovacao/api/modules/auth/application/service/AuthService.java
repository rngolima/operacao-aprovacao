package com.operacaoaprovacao.api.modules.auth.application.service;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.modules.auth.application.dto.AuthResponse;
import com.operacaoaprovacao.api.modules.auth.application.dto.LoginRequest;
import com.operacaoaprovacao.api.modules.auth.application.dto.RegisterRequest;
import com.operacaoaprovacao.api.modules.auth.domain.model.Role;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.operacaoaprovacao.api.modules.auth.application.dto.VerifyEmailRequest;
import java.util.Random;

/**
 * Caso de Uso responsavel por regras de negocio de registro e login de usuarios.
 */
@Service
@RequiredArgsConstructor
public class AuthService {

    private final UsuarioRepository usuarioRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    @Transactional
    public AuthResponse register(RegisterRequest request) {
        if (usuarioRepository.existsByEmail(request.getEmail())) {
            throw new BusinessException("Ja existe um usuario cadastrado com o e-mail informado.");
        }

        String codigoSeguranca = String.format("%06d", new Random().nextInt(900000) + 100000);

        Usuario usuario = Usuario.builder()
                .nome(request.getNome())
                .email(request.getEmail().toLowerCase().trim())
                .senha(passwordEncoder.encode(request.getSenha()))
                .role(Role.ROLE_STUDENT)
                .ativo(true)
                .emailVerificado(false)
                .codigoVerificacao(codigoSeguranca)
                .consentimentoLgpd(request.isConsentimentoLgpd())
                .build();

        Usuario salvo = usuarioRepository.save(usuario);
        String jwtToken = jwtService.generateToken(salvo);

        return AuthResponse.builder()
                .token(jwtToken)
                .tipo("Bearer")
                .id(salvo.getId())
                .nome(salvo.getNome())
                .email(salvo.getEmail())
                .role(salvo.getRole().name())
                .build();
    }

    @Transactional
    public AuthResponse verifyEmail(VerifyEmailRequest request) {
        Usuario usuario = usuarioRepository.findByEmail(request.getEmail().toLowerCase().trim())
                .orElseThrow(() -> new BusinessException("Usuario nao encontrado."));

        if (usuario.isEmailVerificado()) {
            String jwtToken = jwtService.generateToken(usuario);
            return AuthResponse.builder()
                    .token(jwtToken)
                    .tipo("Bearer")
                    .id(usuario.getId())
                    .nome(usuario.getNome())
                    .email(usuario.getEmail())
                    .role(usuario.getRole().name())
                    .build();
        }

        if (usuario.getCodigoVerificacao() == null || !usuario.getCodigoVerificacao().equals(request.getCodigo().trim())) {
            throw new BusinessException("Codigo de verificacao incorreto ou expirado.");
        }

        usuario.setEmailVerificado(true);
        usuario.setCodigoVerificacao(null);
        Usuario salvo = usuarioRepository.save(usuario);

        String jwtToken = jwtService.generateToken(salvo);
        return AuthResponse.builder()
                .token(jwtToken)
                .tipo("Bearer")
                .id(salvo.getId())
                .nome(salvo.getNome())
                .email(salvo.getEmail())
                .role(salvo.getRole().name())
                .build();
    }

    @Transactional
    public String resendVerificationCode(String email) {
        Usuario usuario = usuarioRepository.findByEmail(email.toLowerCase().trim())
                .orElseThrow(() -> new BusinessException("Usuario nao encontrado."));

        String novoCodigo = String.format("%06d", new Random().nextInt(900000) + 100000);
        usuario.setCodigoVerificacao(novoCodigo);
        usuarioRepository.save(usuario);
        return novoCodigo;
    }

    public AuthResponse login(LoginRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getEmail().toLowerCase().trim(),
                        request.getSenha()
                )
        );

        Usuario usuario = usuarioRepository.findByEmail(request.getEmail().toLowerCase().trim())
                .orElseThrow(() -> new BusinessException("Usuario nao encontrado."));

        String jwtToken = jwtService.generateToken(usuario);

        return AuthResponse.builder()
                .token(jwtToken)
                .tipo("Bearer")
                .id(usuario.getId())
                .nome(usuario.getNome())
                .email(usuario.getEmail())
                .role(usuario.getRole().name())
                .build();
    }
}