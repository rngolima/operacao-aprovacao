package com.operacaoaprovacao.api.modules.treinamento.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidade de Dominio que representa a configuracao de um Simulado de Prova.
 */
@Entity
@Table(name = "tb_simulado")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Simulado extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String titulo;

    @Column(columnDefinition = "TEXT")
    private String descricao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "concurso_id")
    private Concurso concurso;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    @Builder.Default
    private ModoSimulado modo = ModoSimulado.PROVA_COMPLETA;

    @Column(name = "tempo_limite_minutos", nullable = false)
    @Builder.Default
    private Integer tempoLimiteMinutos = 270; // 4h30min padrao Cebraspe

    @Column(name = "total_questoes", nullable = false)
    @Builder.Default
    private Integer totalQuestoes = 60;

    @OneToMany(mappedBy = "simulado", cascade = CascadeType.ALL, orphanRemoval = true)
    @OrderBy("numeroQuestao ASC")
    @Builder.Default
    private List<ItemSimulado> itens = new ArrayList<>();

    public void addItem(ItemSimulado item) {
        itens.add(item);
        item.setSimulado(this);
    }

    public void removeItem(ItemSimulado item) {
        itens.remove(item);
        item.setSimulado(null);
    }
}
