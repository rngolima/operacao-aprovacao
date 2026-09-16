package com.operacaoaprovacao.api.modules.auth.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO com dados de entrada para autenticacao (login).
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LoginRequest {

    @NotBlank(message = "O e-mail e obrigatorio.")
    @Email(message = "Formato de e-mail invalido.")
    private String email;

    @NotBlank(message = "A senha e obrigatoria.")
    private String senha;
}