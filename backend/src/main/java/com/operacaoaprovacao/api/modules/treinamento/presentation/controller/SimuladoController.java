package com.operacaoaprovacao.api.modules.treinamento.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.CriarSimuladoRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SimuladoResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.SimuladoService;
import com.operacaoaprovacao.api.modules.treinamento.domain.model.ModoSimulado;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;
import java.util.List;

/**
 * Controller REST responsavel pela exposicao dos cadernos de simulados e provas oficiais.
 */
@RestController
@RequestMapping("/api/v1/simulados")
@RequiredArgsConstructor
@Tag(name = "Cadernos de Simulado", description = "Endpoints para consulta, listagem e montagem de cadernos de simulados oficiais")
public class SimuladoController {

    private final SimuladoService simuladoService;

    @GetMapping("/{id}")
    @Operation(summary = "Buscar simulado por ID com itens e questoes ordenadas")
    public ResponseEntity<ApiResponse<SimuladoResponseDTO>> buscarPorId(@PathVariable Long id) {
        SimuladoResponseDTO response = simuladoService.buscarPorId(id);
        return ResponseEntity.ok(ApiResponse.success(response, "Simulado localizado com sucesso."));
    }

    @GetMapping
    @Operation(summary = "Listar cadernos de simulados disponiveis com filtro opcional por modo")
    public ResponseEntity<ApiResponse<List<SimuladoResponseDTO>>> listar(
            @RequestParam(required = false) ModoSimulado modo
    ) {
        List<SimuladoResponseDTO> lista = simuladoService.listarTodos(modo);
        return ResponseEntity.ok(ApiResponse.success(lista, "Simulados listados com sucesso."));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(summary = "Criar novo caderno de simulado com questoes personalizadas (Exclusivo Administrador)")
    public ResponseEntity<ApiResponse<SimuladoResponseDTO>> criar(@Valid @RequestBody CriarSimuladoRequest request) {
        SimuladoResponseDTO novoSimulado = simuladoService.criarSimulado(request);
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(novoSimulado.id())
                .toUri();

        return ResponseEntity.created(location)
                .body(ApiResponse.success(novoSimulado, "Simulado criado com sucesso."));
    }

    @PostMapping("/pc-pe/gerar")
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(summary = "Gerar caderno oficial no formato PC-PE (60 itens Cebraspe e 4h30min de prova)")
    public ResponseEntity<ApiResponse<SimuladoResponseDTO>> gerarPcPe(
            @RequestParam Long concursoId,
            @RequestParam(required = false) String titulo,
            @RequestParam(required = false) String descricao
    ) {
        SimuladoResponseDTO simuladoGerado = simuladoService.gerarSimuladoPcPe(concursoId, titulo, descricao);
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .replacePath("/api/v1/simulados/{id}")
                .buildAndExpand(simuladoGerado.id())
                .toUri();

        return ResponseEntity.created(location)
                .body(ApiResponse.success(simuladoGerado, "Caderno oficial PC-PE gerado com sucesso."));
    }
}
