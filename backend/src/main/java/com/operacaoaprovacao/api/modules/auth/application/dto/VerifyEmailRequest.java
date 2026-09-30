package com.operacaoaprovacao.api.modules.auth.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para validação de segurança do e-mail com código OTP de 6 dígitos (LGPD).
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class VerifyEmailRequest {

    @NotBlank(message = "O e-mail é obrigatório.")
    @Email(message = "Formato de e-mail inválido.")
    private String email;

    @NotBlank(message = "O código de segurança é obrigatório.")
    @Pattern(regexp = "^\\d{6}$", message = "O código deve conter exatamente 6 dígitos numéricos.")
    private String codigo;
}
