package com.operacaoaprovacao.api.modules.treinamento.domain.model;

import com.operacaoaprovacao.api.modules.questao.domain.model.Questao;
import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;

/**
 * Entidade de Dominio que mapeia a presenca e ordenacao de uma Questao dentro de um Simulado.
 */
@Entity
@Table(name = "tb_item_simulado")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ItemSimulado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "simulado_id", nullable = false)
    private Simulado simulado;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "questao_id", nullable = false)
    private Questao questao;

    @Column(name = "numero_questao", nullable = false)
    private Integer numeroQuestao;

    @Column(nullable = false, precision = 4, scale = 2)
    @Builder.Default
    private BigDecimal peso = BigDecimal.valueOf(1.00);
}
