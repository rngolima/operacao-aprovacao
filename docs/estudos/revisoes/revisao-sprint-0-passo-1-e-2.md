# 📝 Registro de Revisão Técnica — Sprint 0 (Passos 1 e 2)

> **Documento de Formação Técnica & Mentoria**  
> Focado nos Três Pilares da Engenharia de Software: Arquitetura, Escalabilidade e Dimensões Técnicas.

---

## 🐘 PASSO 1: O pom.xml, Maven e Gestão de Dependências

### 1. Arquitetura & Governança de Dependências
- **POM (Project Object Model):** O manifesto declarativo do projeto. Elimina o download manual de binários e estabelece rastreabilidade de bibliotecas auditadas contra vulnerabilidades.
- **<parent> do Spring Boot (spring-boot-starter-parent):** Fornece uma matriz de compatibilidade testada e aprovada pelo time de engenharia do Spring, garantindo que versões de JPA, Security, Hibernate e drivers JDBC funcionem em harmonia sem conflitos de classpath (*Jar Hell*).
- **Java 21 LTS:** Versão corporativa moderna de suporte de longo prazo, permitindo uso de Virtual Threads (Project Loom), Sequenced Collections e Records.

### 2. Dimensões Técnicas: Flyway vs. hibernate.ddl-auto=update
- **Pergunta Técnica de Entrevista:**  
  *"Por que em ambientes de produção sérios é proibido usar hibernate.hbm2ddl.auto=update e o Flyway é a escolha padrão?"*
- **Resposta Técnica Esperada:**  
  O hbm2ddl.auto=update não possui governança de schema, não suporta rollbacks estruturados, cria colunas duplicadas em vez de renomear e pode gerar *table locks* severos em produção. O **Flyway** atua como o versionador do banco de dados (o 'Git das tabelas'), executando scripts SQL (V1, V2, etc.) validados por *checksum* na tabela lyway_schema_history, garantindo **idempotência**, **rastreabilidade** e **reprodutibilidade estrita** em todos os ambientes da esteira CI/CD.

---

## ☕ PASSO 2: OperacaoAprovacaoApplication.java e o Ciclo de Vida do Spring

### 1. Inversão de Controle (IoC) e Bootstrap
- **public static void main:** O ponto de entrada padrão da JVM. Invoca SpringApplication.run(), que sobe o servidor web embutido Apache Tomcat na porta 8080 e inicializa o container de IoC/DI.
- **A Tríade da Anotação @SpringBootApplication:**
  1. @Configuration: Registra a classe como fonte de definições de Beans.
  2. @EnableAutoConfiguration: Analisa as dependências do pom.xml e instancia automaticamente a infraestrutura correspondente (ex: DataSource, EntityManagerFactory).
  3. @ComponentScan: O radar de descoberta automática de componentes.

### 2. Arquitetura de Pacotes: O Funcionamento do @ComponentScan
- **Pergunta Técnica de Entrevista:**  
  *"Se criarmos uma classe anotada com @RestController em um pacote fora da árvore do @SpringBootApplication (ex: em com.outroprojeto), ela será carregada pelo Spring?"*
- **Resposta Técnica Esperada:**  
  **Não.** Por padrão, o @ComponentScan adota a convenção de varredura hierárquica a partir do pacote onde a classe anotada está localizada (com.operacaoaprovacao.api) e seus subpacotes descendentes. Classes fora dessa árvore de pacotes são ignoradas pelo mecanismo de reflexão, a menos que sejam explicitamente mapeadas no parâmetro asePackages da anotação.

### 3. Auditoria Temporal Nativa (@EnableJpaAuditing)
- Habilita a infraestrutura de *listeners* do Spring Data JPA que captura eventos de ciclo de vida das entidades para preenchimento automatizado de carimbos de criação (created_at) e atualização (updated_at).

---

## 📌 Ponto de Retomada:
- **PASSO 3:** O Modelo de Banco BaseEntity.java (@MappedSuperclass, @EntityListeners) e o Envelope de Resposta ApiResponse.java (Response Pattern, Generics <T>, Builder).
- **PASSO 4:** A primeira migração de banco de dados (V1__initial_schema.sql, DDL vs DML, Flyway e modelagem dos concursos).