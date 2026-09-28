package com.operacaoaprovacao.api.modules.questao.domain.model;

import jakarta.persistence.*;
import lombok.*;

/**
 * Entidade de Dominio que representa uma alternativa (A, B, C, D ou E)
 * de uma questao de multipla escolha.
 */
@Entity
@Table(name = "tb_alternativa")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Alternativa {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "questao_id", nullable = false)
    private Questao questao;

    @Column(nullable = false, length = 5)
    private String letra;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String texto;

    @Column(nullable = false)
    @Builder.Default
    private boolean correta = false;

    @Column(columnDefinition = "TEXT")
    private String explicacao;
}
