package com.operacaoaprovacao.api.modules.questao.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import com.operacaoaprovacao.api.modules.certame.domain.model.Assunto;
import com.operacaoaprovacao.api.modules.certame.domain.model.Banca;
import com.operacaoaprovacao.api.modules.certame.domain.model.Concurso;
import com.operacaoaprovacao.api.modules.certame.domain.model.Disciplina;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Entidade de Dominio central que representa uma Questao de concurso.
 * Suporta o modelo Cebraspe (Certo/Errado com penalidade) e Multipla Escolha.
 */
@Entity
@Table(name = "tb_questao")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Questao extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "banca_id", nullable = false)
    private Banca banca;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "concurso_id")
    private Concurso concurso;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "disciplina_id", nullable = false)
    private Disciplina disciplina;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "assunto_id", nullable = false)
    private Assunto assunto;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String enunciado;

    @Column(name = "texto_base", columnDefinition = "TEXT")
    private String textoBase;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    @Builder.Default
    private TipoQuestao tipo = TipoQuestao.CERTO_ERRADO;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    @Builder.Default
    private DificuldadeQuestao dificuldade = DificuldadeQuestao.MEDIA;

    @Column(nullable = false)
    private Integer ano;

    @Column(nullable = false)
    @Builder.Default
    private boolean anulada = false;

    @Column(name = "gabarito_oficial", nullable = false, length = 10)
    private String gabaritoOficial;

    @Column(columnDefinition = "TEXT")
    private String justificativa;

    @Column(name = "fundamentacao_legal", columnDefinition = "TEXT")
    private String fundamentacaoLegal;

    @Column(columnDefinition = "TEXT")
    private String jurisprudencia;

    @OneToMany(mappedBy = "questao", cascade = CascadeType.ALL, orphanRemoval = true)
    @Builder.Default
    private List<Alternativa> alternativas = new ArrayList<>();

    public void addAlternativa(Alternativa alternativa) {
        alternativas.add(alternativa);
        alternativa.setQuestao(this);
    }

    public void removeAlternativa(Alternativa alternativa) {
        alternativas.remove(alternativa);
        alternativa.setQuestao(null);
    }

    public boolean isCertoErrado() {
        return TipoQuestao.CERTO_ERRADO.equals(this.tipo);
    }
}
