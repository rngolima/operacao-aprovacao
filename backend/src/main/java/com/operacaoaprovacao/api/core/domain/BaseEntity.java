package com.operacaoaprovacao.api.core.domain;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É uma superclasse abstrata de modelo (Domain Model) que serve de base para as entidades do banco.
 * 
 * PARA QUE SERVE?
 * Serve para que todas as tabelas do banco de dados (Usuários, Bancas, Concursos, Questões)
 * herdem automaticamente os campos de auditoria temporal: created_at e updated_at.
 * 
 * POR QUE FOI CRIADO?
 * Evita o erro de duplicação de código (princípio DRY - Don't Repeat Yourself). Em vez de
 * digitar os campos de data em 20 classes diferentes, centralizamos aqui uma única vez.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Pleno):
 * "Qual a diferença entre @Entity, @MappedSuperclass e @Inheritance no JPA?"
 * RESPOSTA:
 * Uma classe com @MappedSuperclass NÃO vira uma tabela no banco de dados por si só.
 * Ela serve unicamente para que suas classes filhas (@Entity) herdem seus atributos e mapeamentos de colunas.
 * Já o @Inheritance é usado quando queremos estratégias de herança com tabelas reais (SINGLE_TABLE, JOINED, etc.).
 * =====================================================================================
 */

// Anotações da especificação Jakarta Persistence (JPA), padrão oficial do Java para bancos relacionais.
import jakarta.persistence.Column;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.MappedSuperclass;

// Anotações da biblioteca Lombok que geram automaticamente os métodos get/set em tempo de compilação.
import lombok.Getter;
import lombok.Setter;

// Anotações do Spring Data que identificam campos para receber a data/hora do sistema automaticamente.
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

// Tipo moderno do Java 8+ para representar datas e horas locais sem fuso horário.
import java.time.LocalDateTime;

/**
 * @Getter e @Setter (Lombok): Escreve para nós todos os getCreatedAt(), setCreatedAt(), etc.
 * @MappedSuperclass (JPA): Diz que esta classe transfere seus campos para as subclasses que virarem tabelas.
 * @EntityListeners(AuditingEntityListener.class): Plug do Spring Data que "vigia" os inserts e updates para carimbar o horário.
 */
@Getter
@Setter
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseEntity {

    /**
     * @CreatedDate: Carimba a data e hora do momento exato em que o registro foi inserido no banco (INSERT).
     * @Column: Configura os detalhes da coluna no banco (nome físico, não pode ser nulo e não pode ser alterado após inserido).
     */
    @CreatedDate
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    /**
     * @LastModifiedDate: Atualiza a data e hora sempre que qualquer alteração ocorrer no registro (UPDATE).
     */
    @LastModifiedDate
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}