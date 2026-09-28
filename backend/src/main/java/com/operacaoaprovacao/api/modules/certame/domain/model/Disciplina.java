package com.operacaoaprovacao.api.modules.certame.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidade de Dominio que representa a Disciplina (Materia de concurso).
 * Ex: Lingua Portuguesa, Direito Penal, Direito Processual Penal, etc.
 */
@Entity
@Table(name = "tb_disciplina")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Disciplina extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true, length = 150)
    private String nome;

    @Column(length = 50)
    private String codigo;

    @OneToMany(mappedBy = "disciplina", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<Assunto> assuntos = new ArrayList<>();

    public void addAssunto(Assunto assunto) {
        assuntos.add(assunto);
        assunto.setDisciplina(this);
    }

    public void removeAssunto(Assunto assunto) {
        assuntos.remove(assunto);
        assunto.setDisciplina(null);
    }
}
