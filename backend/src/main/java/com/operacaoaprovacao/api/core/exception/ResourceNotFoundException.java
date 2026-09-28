package com.operacaoaprovacao.api.core.exception;

/**
 * Excecao lancada quando um recurso ou entidade nao e encontrado no banco de dados.
 * Mapeada para HTTP 404 Not Found no GlobalExceptionHandler.
 */
public class ResourceNotFoundException extends BusinessException {

    public ResourceNotFoundException(String message) {
        super(message);
    }
}
