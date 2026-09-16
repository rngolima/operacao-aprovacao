package com.operacaoaprovacao.api.core.dto;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É um DTO (Data Transfer Object) genérico que implementa o padrão de "Response Envelope" (Envelope de Resposta).
 * 
 * PARA QUE SERVE?
 * Garante que 100% das respostas da nossa API (sejam de sucesso ou de erro) sigam um formato
 * previsível e padronizado para quem consome (nosso app Flutter ou outros sistemas).
 * 
 * POR QUE FOI CRIADO?
 * Sem um envelope, um endpoint retornaria uma lista crua [{id:1}], outro retornaria apenas {nome:'joao'},
 * e outro retornaria um erro solto. Isso dificulta a vida do desenvolvedor Frontend. Com o ApiResponse,
 * o Flutter sempre sabe que deve olhar se success == true e ler o campo data.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Pleno):
 * "Por que você utiliza Generics (<T>) e o padrão Builder em DTOs de resposta?"
 * RESPOSTA:
 * O Generics (<T>) permite que a mesma classe de envelope transporte qualquer tipo de dado (um UsuarioDTO,
 * uma lista de QuestaoDTO, etc.) mantendo a tipagem estrita em tempo de compilação.
 * O padrão Builder (do Lombok) facilita a criação fluida e legível de instâncias imutáveis.
 * =====================================================================================
 */

// Anotação Jackson para omitir campos nulos do JSON final gerado (economiza banda de internet).
import com.fasterxml.jackson.annotation.JsonInclude;

// Anotações do Lombok para gerar construtores, getters, setters e o padrão de projeto Builder.
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @Data: Gera automaticamente getters, setters, equals(), hashCode() e toString().
 * @Builder: Implementa o Design Pattern "Builder" para instanciar a classe de forma fluida: ApiResponse.builder().success(true).build().
 * @JsonInclude(NON_NULL): Se o campo message ou data for nulo, ele nem aparece no JSON enviado para o cliente.
 * 
 * @param <T>: Tipo genérico do payload de dados que este envelope carrega.
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ApiResponse<T> {

    /**
     * Booleano que indica claramente se a requisição foi bem-sucedida ou falhou.
     */
    @Builder.Default
    private boolean success = true;

    /**
     * Mensagem amigável para exibição ao usuário ou diagnóstico (opcional).
     */
    private String message;

    /**
     * O dado real retornado pela operação (uma entidade, um DTO, uma lista, etc.).
     */
    private T data;

    /**
     * Carimbo de data/hora da geração da resposta no servidor.
     */
    @Builder.Default
    private LocalDateTime timestamp = LocalDateTime.now();

    /**
     * Método estático facilitador (Factory Method) para respostas de sucesso contendo apenas dados.
     */
    public static <T> ApiResponse<T> ok(T data) {
        return ApiResponse.<T>builder()
                .success(true)
                .data(data)
                .timestamp(LocalDateTime.now())
                .build();
    }

    /**
     * Método estático facilitador para respostas de sucesso contendo mensagem e dados.
     */
    public static <T> ApiResponse<T> ok(String message, T data) {
        return ApiResponse.<T>builder()
                .success(true)
                .message(message)
                .data(data)
                .timestamp(LocalDateTime.now())
                .build();
    }

    /**
     * Método estático facilitador para respostas de erro contendo apenas a mensagem explicativa.
     */
    public static <T> ApiResponse<T> error(String message) {
        return ApiResponse.<T>builder()
                .success(false)
                .message(message)
                .timestamp(LocalDateTime.now())
                .build();
    }
}