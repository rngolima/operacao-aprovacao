package com.operacaoaprovacao.api.modules.questao.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import com.operacaoaprovacao.api.modules.questao.application.dto.CriarQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.FiltroQuestaoRequest;
import com.operacaoaprovacao.api.modules.questao.application.dto.QuestaoResponse;
import com.operacaoaprovacao.api.modules.questao.application.service.QuestaoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.net.URI;

/**
 * Controller REST responsavel pela exposicao de recursos do Motor de Questoes.
 * Suporta consultas paginadas de alta performance com filtros combinados, criacao e anulacao oficial.
 */
@RestController
@RequestMapping("/api/v1/questoes")
@RequiredArgsConstructor
@Tag(name = "Motor de Questoes", description = "Endpoints para consulta paginada, filtros e gestao de questoes de concursos")
public class QuestaoController {

    private final QuestaoService questaoService;

    @GetMapping("/{id}")
    @Operation(summary = "Buscar questao por ID com alternativas e fundamentacao juridica")
    public ResponseEntity<ApiResponse<QuestaoResponse>> buscarPorId(@PathVariable Long id) {
        QuestaoResponse response = questaoService.buscarPorId(id);
        return ResponseEntity.ok(ApiResponse.success(response, "Questao localizada com sucesso."));
    }

    @GetMapping
    @Operation(summary = "Listar questoes com filtros dinamicos e paginacao indexada")
    public ResponseEntity<ApiResponse<Page<QuestaoResponse>>> listarQuestoes(
            FiltroQuestaoRequest filtro,
            @PageableDefault(size = 10, sort = "id", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        Page<QuestaoResponse> pagina = questaoService.listarComFiltros(filtro, pageable);
        return ResponseEntity.ok(ApiResponse.success(pagina, "Questoes listadas com sucesso."));
    }

    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(summary = "Cadastrar nova questao com alternativas e fundamentacao (Exclusivo Administrador)")
    public ResponseEntity<ApiResponse<QuestaoResponse>> criarQuestao(@Valid @RequestBody CriarQuestaoRequest request) {
        QuestaoResponse novaQuestao = questaoService.criarQuestao(request);
        URI location = ServletUriComponentsBuilder.fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(novaQuestao.id())
                .toUri();

        return ResponseEntity.created(location)
                .body(ApiResponse.success(novaQuestao, "Questao cadastrada com sucesso no banco de dados."));
    }

    @PatchMapping("/{id}/anular")
    @PreAuthorize("hasRole('ADMIN')")
    @Operation(summary = "Anular questao oficialmente apos julgamento de recursos da banca (Exclusivo Administrador)")
    public ResponseEntity<ApiResponse<QuestaoResponse>> anularQuestao(@PathVariable Long id) {
        QuestaoResponse questaoAnulada = questaoService.anularQuestao(id);
        return ResponseEntity.ok(ApiResponse.success(questaoAnulada, "Questao anulada oficialmente com sucesso."));
    }
}
