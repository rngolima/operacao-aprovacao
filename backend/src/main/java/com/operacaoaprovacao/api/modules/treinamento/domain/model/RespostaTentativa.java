package com.operacaoaprovacao.api.modules.treinamento.domain.model;

import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

/**
 * Entidade de Dominio que armazena a marcacao individual de um aluno para uma questao de simulado,
 * incluindo a telemetria de tempo gasto e a pontuacao atribuida.
 */
@Entity
@Table(name = "tb_resposta_tentativa")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class RespostaTentativa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tentativa_id", nullable = false)
    private TentativaSimulado tentativa;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "questao_id", nullable = false)
    private Questao questao;

    @Column(name = "resposta_marcada", length = 10)
    private String respostaMarcada; // "C", "E", "A", "B"... ou null se em branco

    @Column(name = "tempo_gasto_segundos")
    @Builder.Default
    private Integer tempoGastoSegundos = 0; // Telemetria: segundos gastos no item

    private Boolean correta; // true (acerto), false (erro) ou null (em branco)

    @Column(name = "pontos_atribuidos", precision = 4, scale = 2)
    @Builder.Default
    private BigDecimal pontosAtribuidos = BigDecimal.ZERO;

    public boolean isEmBranco() {
        return this.respostaMarcada == null || this.respostaMarcada.trim().isEmpty();
    }
}
