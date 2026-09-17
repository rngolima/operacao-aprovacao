# 📝 Registro de Revisão & Mentoria — Sprint 0 (Passos 1 e 2)

> **Status:** Pausado em 17/09/2026.  
> **Próximo Ponto de Retomada:** PASSO 3 — O Modelo de Banco BaseEntity e o Padrão de Resposta ApiResponse.

---

## 🐘 PASSO 1: O pom.xml e o Maven (Revisado com Sucesso)

### O que você aprendeu:
- **POM (Project Object Model):** É o manifesto mestre do projeto. Gerencia versões e baixa dependências automaticamente do Maven Central.
- **<parent> do Spring Boot:** O spring-boot-starter-parent traz compatibilidade garantida entre todas as bibliotecas sem que a gente precise adivinhar ou digitar versões.
- **Java 21 LTS:** Versão mais moderna e estável com suporte de longo prazo adotada para o projeto.
- **Por que usamos Flyway e NÃO hibernate.ddl-auto=update:**
  - *Sua resposta na revisão:* O Hibernate nunca deve alterar as tabelas sozinho em produção; esse papel é exclusivo do Flyway para que o histórico de criação e alteração do banco fique registrado e versionado no código (no Git). **(Resposta 100% correta!).**

---

## ☕ PASSO 2: OperacaoAprovacaoApplication.java (Revisado com Sucesso)

### O que você aprendeu:
- **public static void main:** O ponto de partida universal do Java. Ao rodar SpringApplication.run(...), ele sobe o servidor web Apache Tomcat embutido na porta 8080 e inicia o contexto Spring.
- **A tríade do @SpringBootApplication:**
  1. @Configuration: Permite registrar Beans e configurações.
  2. @EnableAutoConfiguration: Olha para o pom.xml e configura automaticamente os drivers e starters.
  3. @ComponentScan: É o **radar** que varre as classes Java com anotações do Spring.
- **@EnableJpaAuditing:** Ativa o preenchimento automático das datas de criação e alteração nas entidades de banco.

### ⚠️ Pegadinha de Entrevista Dominada:
- **Pergunta:** *"Se eu criar uma classe fora do pacote raiz com.operacaoaprovacao.api (ex: em com.meuoutroprojeto), o Spring Boot encontra essa classe?"*
- **Regra de Ouro:** **NÃO!** O radar do @ComponentScan só varre o pacote onde a classe principal está localizada e as pastas que estão **abaixo** dele. Classes em pastas irmãs ou fora da árvore não são encontradas a menos que sejam configuradas manualmente.

---

## 🚀 Ponto de Retomada para o Próximo Encontro:
Quando você voltar, começaremos diretamente por:
- **PASSO 3:** O Modelo de Banco BaseEntity.java (@MappedSuperclass, @EntityListeners, JPA Auditing) e o Envelope de Resposta ApiResponse.java (Response Pattern, Generics <T>, Builder).
- **PASSO 4:** A primeira migração de banco de dados (V1__initial_schema.sql e Flyway).
- **PASSO 5:** O primeiro endpoint (HealthController.java) e o teste automatizado (OperacaoAprovacaoApplicationTests.java).