package com.operacaoaprovacao.api.modules.treinamento.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import com.operacaoaprovacao.api.modules.auth.domain.model.Usuario;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * Entidade de Dominio que representa a sessao real de um aluno realizando um simulado.
 * Armazena a telemetria completa e os resultados finais calculados pela banca Cebraspe.
 */
@Entity
@Table(name = "tb_tentativa_simulado")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TentativaSimulado extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id", nullable = false)
    private Usuario usuario;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "simulado_id", nullable = false)
    private Simulado simulado;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    @Builder.Default
    private StatusTentativa status = StatusTentativa.EM_ANDAMENTO;

    @Column(name = "data_inicio", nullable = false)
    @Builder.Default
    private LocalDateTime dataInicio = LocalDateTime.now();

    @Column(name = "data_fim")
    private LocalDateTime dataFim;

    @Column(name = "tempo_total_segundos")
    private Integer tempoTotalSegundos;

    @Column(name = "pontuacao_liquida", precision = 6, scale = 2)
    private BigDecimal pontuacaoLiquida;

    @Column(name = "total_acertos")
    @Builder.Default
    private Integer totalAcertos = 0;

    @Column(name = "total_erros")
    @Builder.Default
    private Integer totalErros = 0;

    @Column(name = "total_em_branco")
    @Builder.Default
    private Integer totalEmBranco = 0;

    @Column(name = "total_anuladas")
    @Builder.Default
    private Integer totalAnuladas = 0;

    @OneToMany(mappedBy = "tentativa", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<RespostaTentativa> respostas = new ArrayList<>();

    public void addResposta(RespostaTentativa resposta) {
        respostas.add(resposta);
        resposta.setTentativa(this);
    }

    public boolean isFinalizada() {
        return StatusTentativa.FINALIZADA.equals(this.status);
    }
}
