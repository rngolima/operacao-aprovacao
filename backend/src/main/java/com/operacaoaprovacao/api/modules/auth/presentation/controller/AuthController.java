package com.operacaoaprovacao.api.modules.auth.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import com.operacaoaprovacao.api.modules.auth.application.dto.AuthResponse;
import com.operacaoaprovacao.api.modules.auth.application.dto.LoginRequest;
import com.operacaoaprovacao.api.modules.auth.application.dto.RegisterRequest;
import com.operacaoaprovacao.api.modules.auth.application.service.AuthService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller responsavel por endpoints de autenticacao e registro de contas.
 */
@RestController
@RequestMapping("/api/v1/auth")
@Tag(name = "Autenticacao", description = "Endpoints para registro de novos usuarios e login com emissao de JWT")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/register")
    @Operation(summary = "Cadastrar novo usuario", description = "Registra um novo estudante e retorna o token JWT de acesso.")
    public ResponseEntity<ApiResponse<AuthResponse>> register(@Valid @RequestBody RegisterRequest request) {
        AuthResponse response = authService.register(request);
        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.ok("Usuario registrado com sucesso.", response));
    }

    @PostMapping("/login")
    @Operation(summary = "Autenticar usuario", description = "Realiza login com e-mail e senha, retornando o token JWT.")
    public ResponseEntity<ApiResponse<AuthResponse>> login(@Valid @RequestBody LoginRequest request) {
        AuthResponse response = authService.login(request);
        return ResponseEntity.ok(ApiResponse.ok("Login realizado com sucesso.", response));
    }
}