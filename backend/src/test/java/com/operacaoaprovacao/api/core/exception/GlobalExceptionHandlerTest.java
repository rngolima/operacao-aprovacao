package com.operacaoaprovacao.api.core.exception;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;

import static org.assertj.core.api.Assertions.assertThat;

/**
 * Testes Unitarios para o GlobalExceptionHandler.
 * Demonstra como testar tratamento de erros de forma isolada,
 * sem carregar o contexto pesado do Spring, executando em milissegundos.
 */
class GlobalExceptionHandlerTest {

    private GlobalExceptionHandler exceptionHandler;

    @BeforeEach
    void setUp() {
        exceptionHandler = new GlobalExceptionHandler();
    }

    @Test
    @DisplayName("Deve tratar BusinessException retornando HTTP 400 Bad Request com mensagem personalizada")
    void shouldHandleBusinessException() {
        // Arrange
        BusinessException exception = new BusinessException("E-mail ja cadastrado no sistema.");

        // Act
        ResponseEntity<ApiResponse<Void>> response = exceptionHandler.handleBusinessException(exception);

        // Assert
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.BAD_REQUEST);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().isSuccess()).isFalse();
        assertThat(response.getBody().getMessage()).isEqualTo("E-mail ja cadastrado no sistema.");
    }

    @Test
    @DisplayName("Deve tratar BadCredentialsException retornando HTTP 401 Unauthorized com mensagem segura")
    void shouldHandleBadCredentialsException() {
        // Arrange
        BadCredentialsException exception = new BadCredentialsException("Bad credentials");

        // Act
        ResponseEntity<ApiResponse<Void>> response = exceptionHandler.handleBadCredentialsException(exception);

        // Assert
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.UNAUTHORIZED);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().isSuccess()).isFalse();
        assertThat(response.getBody().getMessage()).isEqualTo("E-mail ou senha invalidos.");
    }

    @Test
    @DisplayName("Deve tratar Exception generica retornando HTTP 500 sem vazar stacktrace ao cliente")
    void shouldHandleGenericException() {
        // Arrange
        RuntimeException exception = new RuntimeException("Falha inesperada no driver de conexao");

        // Act
        ResponseEntity<ApiResponse<Void>> response = exceptionHandler.handleGenericException(exception);

        // Assert
        assertThat(response.getStatusCode()).isEqualTo(HttpStatus.INTERNAL_SERVER_ERROR);
        assertThat(response.getBody()).isNotNull();
        assertThat(response.getBody().isSuccess()).isFalse();
        assertThat(response.getBody().getMessage())
                .isEqualTo("Ocorreu um erro interno no servidor. Tente novamente mais tarde.");
    }
}
