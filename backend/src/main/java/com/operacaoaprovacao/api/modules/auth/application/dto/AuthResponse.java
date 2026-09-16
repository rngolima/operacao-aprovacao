package com.operacaoaprovacao.api.modules.auth.application.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO de resposta para operacoes de autenticacao bem-sucedidas com token JWT.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthResponse {

    private String token;

    @Builder.Default
    private String tipo = "Bearer";

    private Long id;
    private String nome;
    private String email;
    private String role;
}