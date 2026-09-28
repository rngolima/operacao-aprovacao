package com.operacaoaprovacao.api.modules.treinamento.presentation.controller;

import com.operacaoaprovacao.api.core.dto.ApiResponse;
import com.operacaoaprovacao.api.core.exception.BusinessException;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import com.operacaoaprovacao.api.modules.auth.domain.repository.UsuarioRepository;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.RegistrarRespostaRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.ResultadoTentativaDetalhadoDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.SubmeterTentativaRequest;
import com.operacaoaprovacao.api.modules.treinamento.application.dto.TentativaResponseDTO;
import com.operacaoaprovacao.api.modules.treinamento.application.service.TentativaService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Controller REST responsavel pela execucao interativa de simulados,
 * auto-save de respostas com telemetria e submissao final ao Motor Cebraspe.
 */
@RestController
@RequestMapping("/api/v1/tentativas")
@RequiredArgsConstructor
@Tag(name = "Tentativas & Execucao de Prova", description = "Endpoints para inicio de cronometro, auto-save em tempo real e submissao oficial Cebraspe")
public class TentativaController {

    private final TentativaService tentativaService;
    private final UsuarioRepository usuarioRepository;

    @PostMapping("/iniciar")
    @Operation(summary = "Iniciar sessao real de simulado com disparo de cronometro regressivo")
    public ResponseEntity<ApiResponse<TentativaResponseDTO>> iniciar(
            @RequestParam Long simuladoId,
            @AuthenticationPrincipal Usuario usuarioLogado,
            Authentication authentication
    ) {
        Long usuarioId = resolverUsuarioId(usuarioLogado, authentication);
        TentativaResponseDTO response = tentativaService.iniciarTentativa(simuladoId, usuarioId);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(ApiResponse.success(response, "Sessao de simulado iniciada. Cronometro disparado!"));
    }

    @PutMapping("/{id}/respostas")
    @Operation(summary = "Auto-save de marcacao de questao com telemetria individual de segundos")
    public ResponseEntity<ApiResponse<TentativaResponseDTO>> registrarResposta(
            @PathVariable Long id,
            @Valid @RequestBody RegistrarRespostaRequest request,
            @AuthenticationPrincipal Usuario usuarioLogado,
            Authentication authentication
    ) {
        Long usuarioId = resolverUsuarioId(usuarioLogado, authentication);
        TentativaResponseDTO response = tentativaService.registrarRespostaItem(id, usuarioId, request);

        return ResponseEntity.ok(ApiResponse.success(response, "Resposta registrada com telemetria em tempo real."));
    }

    @PostMapping("/{id}/submeter")
    @Operation(summary = "Submeter tentativa para correcao oficial Cebraspe (Nota Liquida C - E, bonificacoes e penalidades)")
    public ResponseEntity<ApiResponse<ResultadoTentativaDetalhadoDTO>> submeter(
            @PathVariable Long id,
            @Valid @RequestBody(required = false) SubmeterTentativaRequest request,
            @AuthenticationPrincipal Usuario usuarioLogado,
            Authentication authentication
    ) {
        Long usuarioId = resolverUsuarioId(usuarioLogado, authentication);
        ResultadoTentativaDetalhadoDTO resultado = tentativaService.finalizarESubmeter(id, usuarioId, request);

        return ResponseEntity.ok(ApiResponse.success(resultado, "Simulado submetido e corrigido com sucesso pela banca Cebraspe!"));
    }

    @GetMapping("/{id}/resultado")
    @Operation(summary = "Consultar relatorio analitico completo de desempenho de uma tentativa finalizada")
    public ResponseEntity<ApiResponse<ResultadoTentativaDetalhadoDTO>> buscarResultado(
            @PathVariable Long id,
            @AuthenticationPrincipal Usuario usuarioLogado,
            Authentication authentication
    ) {
        Long usuarioId = resolverUsuarioId(usuarioLogado, authentication);
        ResultadoTentativaDetalhadoDTO resultado = tentativaService.buscarResultadoTentativa(id, usuarioId);

        return ResponseEntity.ok(ApiResponse.success(resultado, "Relatorio de desempenho recuperado com sucesso."));
    }

    @GetMapping("/historico")
    @Operation(summary = "Listar historico cronologico decrescente de simulados realizados pelo candidato autenticado")
    public ResponseEntity<ApiResponse<List<TentativaResponseDTO>>> listarHistorico(
            @AuthenticationPrincipal Usuario usuarioLogado,
            Authentication authentication
    ) {
        Long usuarioId = resolverUsuarioId(usuarioLogado, authentication);
        List<TentativaResponseDTO> historico = tentativaService.listarHistoricoUsuario(usuarioId);

        return ResponseEntity.ok(ApiResponse.success(historico, "Historico de simulados recuperado com sucesso."));
    }

    private Long resolverUsuarioId(Usuario usuarioLogado, Authentication authentication) {
        if (usuarioLogado != null && usuarioLogado.getId() != null) {
            return usuarioLogado.getId();
        }
        if (authentication != null && authentication.getPrincipal() instanceof Usuario u) {
            return u.getId();
        }
        if (authentication != null && authentication.getName() != null) {
            return usuarioRepository.findByEmail(authentication.getName())
                    .map(Usuario::getId)
                    .orElseThrow(() -> new BusinessException("Usuario autenticado nao encontrado no banco de dados."));
        }
        throw new BusinessException("Requisicao nao autorizada ou usuario nao identificado.");
    }
}
