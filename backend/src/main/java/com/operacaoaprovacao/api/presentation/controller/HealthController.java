package com.operacaoaprovacao.api.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * Controller responsavel por endpoints de verificacao de integridade e saude da API.
 */
@RestController
@RequestMapping("/api/v1/health")
@Tag(name = "Health Check", description = "Monitoramento de saude e integridade da API")
public class HealthController {

    /**
     * Endpoint de verificacao de liveness e prontidao do servico.
     * 
     * @return ResponseEntity com status da aplicacao, versao e timestamp
     */
    @GetMapping
    @Operation(summary = "Verifica se a API esta operacional", description = "Retorna o status, versao e horario do servidor.")
    public ResponseEntity<ApiResponse<Map<String, Object>>> checkHealth() {
        Map<String, Object> status = Map.of(
                "status", "UP",
                "service", "operacao-aprovacao-api",
                "version", "1.0.0-SNAPSHOT",
                "timestamp", LocalDateTime.now().toString()
        );
        return ResponseEntity.ok(ApiResponse.ok("API operacional e pronta para conexoes.", status));
    }
}