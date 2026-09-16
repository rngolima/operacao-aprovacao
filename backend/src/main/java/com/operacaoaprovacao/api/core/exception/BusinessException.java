package com.operacaoaprovacao.api.core.exception;

/**
 * Excecao personalizada para representar violacoes de regras de negocio.
 */
public class BusinessException extends RuntimeException {

    public BusinessException(String message) {
        super(message);
    }
}