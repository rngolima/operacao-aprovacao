package com.operacaoaprovacao.api.modules.auth.application.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO com dados de entrada para cadastro de novo usuario.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequest {

    @NotBlank(message = "O nome e obrigatorio.")
    @Size(min = 3, max = 150, message = "O nome deve ter entre 3 e 150 caracteres.")
    private String nome;

    @NotBlank(message = "O e-mail e obrigatorio.")
    @Email(message = "Formato de e-mail invalido.")
    private String email;

    @NotBlank(message = "A senha e obrigatoria.")
    @Size(min = 6, max = 50, message = "A senha deve ter no minimo 6 caracteres.")
    private String senha;
}