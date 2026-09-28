package com.operacaoaprovacao.api.modules.certame.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

/**
 * Entidade de Dominio que representa o Concurso Publico (ex: PC-PE 2024).
 */
@Entity
@Table(name = "tb_concurso")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Concurso extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "banca_id", nullable = false)
    private Banca banca;

    @Column(nullable = false, length = 150)
    private String orgao;

    @Column(length = 2)
    private String estado;

    @Column(nullable = false)
    private Integer ano;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 50)
    @Builder.Default
    private StatusConcurso status = StatusConcurso.PREVISTO;
}
