package com.operacaoaprovacao.api.modules.certame.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

/**
 * Entidade de Dominio que representa o Edital de Abertura ou Retificacao de um concurso.
 */
@Entity
@Table(name = "tb_edital")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Edital extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "concurso_id", nullable = false)
    private Concurso concurso;

    @Column(nullable = false, length = 100)
    private String numero;

    @Column(name = "data_publicacao")
    private LocalDate dataPublicacao;

    @Column(name = "link_oficial", length = 500)
    private String linkOficial;

    @Column(name = "total_vagas")
    private Integer totalVagas;

    @Column(name = "total_questoes")
    private Integer totalQuestoes;
}
