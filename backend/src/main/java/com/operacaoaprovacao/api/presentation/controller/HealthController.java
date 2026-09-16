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

@RestController
@RequestMapping("/api/v1/health")
@Tag(name = "Health Check", description = "Monitoramento de saúde e integridade da API")
public class HealthController {

    @GetMapping
    @Operation(summary = "Verifica se a API está operacional", description = "Retorna o status, versão e horário do servidor.")
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