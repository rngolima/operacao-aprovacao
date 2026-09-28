package com.operacaoaprovacao.api.modules.certame.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

/**
 * Entidade de Dominio que representa a Banca Examinadora (Cebraspe, FGV, FCC, etc.).
 */
@Entity
@Table(name = "tb_banca")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Banca extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String nome;

    @Column(nullable = false, unique = true, length = 50)
    private String sigla;

    @Column(name = "site_oficial", length = 255)
    private String siteOficial;
}
