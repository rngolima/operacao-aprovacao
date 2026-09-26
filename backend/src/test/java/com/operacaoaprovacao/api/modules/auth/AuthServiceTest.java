package com.operacaoaprovacao.api.modules.auth;

import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.modules.auth.application.dto.AuthResponse;
import com.operacaoaprovacao.api.modules.auth.application.dto.LoginRequest;
import com.operacaoaprovacao.api.modules.auth.application.dto.RegisterRequest;
import com.operacaoaprovacao.api.modules.auth.application.service.AuthService;
import com.operacaoaprovacao.api.modules.auth.application.service.JwtService;
import com.operacaoaprovacao.api.modules.auth.domain.model.Role;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

/**
 * Testes Unitarios corporativos para o AuthService.
 * Utiliza Mockito puro (isolamento total sem subir contexto do Spring),
 * garantindo execucao em poucos milissegundos.
 */
@ExtendWith(MockitoExtension.class)
class AuthServiceTest {

    @Mock
    private UsuarioRepository usuarioRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtService jwtService;

    @Mock
    private AuthenticationManager authenticationManager;

    @InjectMocks
    private AuthService authService;

    @Test
    @DisplayName("Deve registrar um novo estudante com sucesso e retornar token JWT")
    void shouldRegisterNewUserSuccessfully() {
        // Arrange (Preparacao)
        RegisterRequest request = RegisterRequest.builder()
                .nome("Rudson Americo")
                .email("rudson@policiacivil.pe.gov.br")
                .senha("Delta2026!")
                .build();

        Usuario usuarioSalvo = Usuario.builder()
                .id(1L)
                .nome("Rudson Americo")
                .email("rudson@policiacivil.pe.gov.br")
                .senha("senha_hasheada_com_bcrypt")
                .role(Role.ROLE_STUDENT)
                .ativo(true)
                .build();

        when(usuarioRepository.existsByEmail("rudson@policiacivil.pe.gov.br")).thenReturn(false);
        when(passwordEncoder.encode("Delta2026!")).thenReturn("senha_hasheada_com_bcrypt");
        when(usuarioRepository.save(any(Usuario.class))).thenReturn(usuarioSalvo);
        when(jwtService.generateToken(usuarioSalvo)).thenReturn("jwt.token.simulado");

        // Act (Execucao)
        AuthResponse response = authService.register(request);

        // Assert (Verificacao)
        assertThat(response).isNotNull();
        assertThat(response.getToken()).isEqualTo("jwt.token.simulado");
        assertThat(response.getEmail()).isEqualTo("rudson@policiacivil.pe.gov.br");
        assertThat(response.getRole()).isEqualTo("ROLE_STUDENT");
        assertThat(response.getId()).isEqualTo(1L);

        // Verify (Garantir que os mocks foram chamados corretamente)
        verify(usuarioRepository, times(1)).existsByEmail("rudson@policiacivil.pe.gov.br");
        verify(passwordEncoder, times(1)).encode("Delta2026!");
        verify(usuarioRepository, times(1)).save(any(Usuario.class));
        verify(jwtService, times(1)).generateToken(usuarioSalvo);
    }

    @Test
    @DisplayName("Deve lancar BusinessException quando email ja estiver cadastrado no registro")
    void shouldThrowBusinessExceptionWhenEmailAlreadyExists() {
        // Arrange
        RegisterRequest request = RegisterRequest.builder()
                .nome("Candidato Repetido")
                .email("candidato@email.com")
                .senha("senha123")
                .build();

        when(usuarioRepository.existsByEmail("candidato@email.com")).thenReturn(true);

        // Act & Assert
        assertThatThrownBy(() -> authService.register(request))
                .isInstanceOf(BusinessException.class)
                .hasMessage("Ja existe um usuario cadastrado com o e-mail informado.");

        // Garantir que NENHUM salvamento foi tentado
        verify(usuarioRepository, never()).save(any());
        verify(jwtService, never()).generateToken(any());
    }

    @Test
    @DisplayName("Deve autenticar usuario com sucesso no login e retornar token JWT")
    void shouldLoginSuccessfully() {
        // Arrange
        LoginRequest request = LoginRequest.builder()
                .email("rudson@policiacivil.pe.gov.br")
                .senha("Delta2026!")
                .build();

        Usuario usuarioExistente = Usuario.builder()
                .id(1L)
                .nome("Rudson Americo")
                .email("rudson@policiacivil.pe.gov.br")
                .role(Role.ROLE_STUDENT)
                .ativo(true)
                .build();

        when(usuarioRepository.findByEmail("rudson@policiacivil.pe.gov.br")).thenReturn(Optional.of(usuarioExistente));
        when(jwtService.generateToken(usuarioExistente)).thenReturn("jwt.token.login");

        // Act
        AuthResponse response = authService.login(request);

        // Assert
        assertThat(response).isNotNull();
        assertThat(response.getToken()).isEqualTo("jwt.token.login");
        assertThat(response.getEmail()).isEqualTo("rudson@policiacivil.pe.gov.br");

        verify(authenticationManager, times(1)).authenticate(any(UsernamePasswordAuthenticationToken.class));
        verify(usuarioRepository, times(1)).findByEmail("rudson@policiacivil.pe.gov.br");
        verify(jwtService, times(1)).generateToken(usuarioExistente);
    }

    @Test
    @DisplayName("Deve lancar BusinessException quando usuario nao for encontrado no login")
    void shouldThrowBusinessExceptionWhenUserNotFoundOnLogin() {
        // Arrange
        LoginRequest request = LoginRequest.builder()
                .email("fantasma@email.com")
                .senha("senha123")
                .build();

        when(usuarioRepository.findByEmail("fantasma@email.com")).thenReturn(Optional.empty());

        // Act & Assert
        assertThatThrownBy(() -> authService.login(request))
                .isInstanceOf(BusinessException.class)
                .hasMessage("Usuario nao encontrado.");

        verify(jwtService, never()).generateToken(any());
    }
}
