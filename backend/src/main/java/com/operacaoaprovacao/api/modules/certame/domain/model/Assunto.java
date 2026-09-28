package com.operacaoaprovacao.api.modules.certame.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

/**
 * Entidade de Dominio que representa o Assunto (Topico especifico de uma Disciplina).
 * Ex: Inquerito Policial, Crimes contra o Patrimonio, Concordancia Verbal.
 */
@Entity
@Table(name = "tb_assunto")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Assunto extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "disciplina_id", nullable = false)
    private Disciplina disciplina;

    @Column(nullable = false, length = 200)
    private String nome;
}
