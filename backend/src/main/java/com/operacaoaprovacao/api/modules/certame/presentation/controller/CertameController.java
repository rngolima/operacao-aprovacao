package com.operacaoaprovacao.api.modules.certame.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.BancaResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.ConcursoResponse;
import com.operacaoaprovacao.api.modules.certame.application.dto.DisciplinaTreeResponse;
import com.operacaoaprovacao.api.modules.certame.application.service.CertameService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller REST responsavel pela exposicao de recursos do modulo de Certames.
 * Disponibiliza consultas de bancas organizadoras, concursos publicos e arvore de disciplinas.
 */
@RestController
@RequestMapping("/api/v1/certames")
@RequiredArgsConstructor
@Tag(name = "Certames e Editais", description = "Endpoints para consulta de bancas, concursos e catalogo de disciplinas")
public class CertameController {

    private final CertameService certameService;

    @GetMapping("/bancas")
    @Operation(summary = "Listar todas as bancas organizadoras cadastradas")
    public ResponseEntity<ApiResponse<List<BancaResponse>>> listarBancas() {
        List<BancaResponse> bancas = certameService.listarBancas();
        return ResponseEntity.ok(ApiResponse.success(bancas, "Bancas listadas com sucesso."));
    }

    @GetMapping("/bancas/{id}")
    @Operation(summary = "Buscar banca organizadora por ID")
    public ResponseEntity<ApiResponse<BancaResponse>> buscarBancaPorId(@PathVariable Long id) {
        BancaResponse banca = certameService.buscarBancaPorId(id);
        return ResponseEntity.ok(ApiResponse.success(banca, "Banca localizada com sucesso."));
    }

    @GetMapping("/concursos")
    @Operation(summary = "Listar concursos publicos com filtro opcional por estado (UF)")
    public ResponseEntity<ApiResponse<List<ConcursoResponse>>> listarConcursos(
            @RequestParam(required = false) String estado
    ) {
        List<ConcursoResponse> concursos = (estado != null && !estado.isBlank())
                ? certameService.listarConcursosPorEstado(estado.trim().toUpperCase())
                : certameService.listarConcursos();

        return ResponseEntity.ok(ApiResponse.success(concursos, "Concursos listados com sucesso."));
    }

    @GetMapping("/concursos/{id}")
    @Operation(summary = "Buscar concurso publico por ID")
    public ResponseEntity<ApiResponse<ConcursoResponse>> buscarConcursoPorId(@PathVariable Long id) {
        ConcursoResponse concurso = certameService.buscarConcursoPorId(id);
        return ResponseEntity.ok(ApiResponse.success(concurso, "Concurso localizado com sucesso."));
    }

    @GetMapping("/disciplinas/arvore")
    @Operation(summary = "Obter arvore hierarquica completa de disciplinas e assuntos (Consulta otimizada JOIN FETCH)")
    public ResponseEntity<ApiResponse<List<DisciplinaTreeResponse>>> obterArvoreDisciplinas() {
        List<DisciplinaTreeResponse> arvore = certameService.obterArvoreDisciplinas();
        return ResponseEntity.ok(ApiResponse.success(arvore, "Arvore de disciplinas carregada com sucesso."));
    }

    @GetMapping("/disciplinas/{id}")
    @Operation(summary = "Buscar disciplina e seus assuntos por ID")
    public ResponseEntity<ApiResponse<DisciplinaTreeResponse>> buscarDisciplinaPorId(@PathVariable Long id) {
        DisciplinaTreeResponse disciplina = certameService.buscarDisciplinaPorId(id);
        return ResponseEntity.ok(ApiResponse.success(disciplina, "Disciplina localizada com sucesso."));
    }
}
