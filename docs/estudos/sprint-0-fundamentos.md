# 📘 Guia de Estudos — Sprint 0: Foundation (A Base Corporativa)

> **Documento Pessoal de Preparação Técnica para Entrevistas e Domínio do Código**  
> Este documento explica detalhadamente o que foi construído na Sprint 0, por que foi feito dessa forma e como você deve defender cada decisão em uma entrevista de emprego para Desenvolvedor Java / Spring Boot.

---

## 1. O que é o projeto e a sua Arquitetura?

O **Operação Aprovação** foi estruturado no padrão **Monólito Modular (Modular Monolith)** aplicando os princípios da **Clean Architecture** (Arquitetura Limpa) de Robert C. Martin (Uncle Bob).

### Por que Clean Architecture?
Na Clean Architecture, o objetivo principal é a **independência de frameworks e bancos de dados**. As regras de negócio não sabem se o banco é PostgreSQL, Oracle ou MySQL, nem se o frontend é Flutter ou React.

A estrutura de camadas obedece à **Regra da Dependência**:
1. **Domain (Domínio):** O coração da aplicação. Contém entidades e regras que nunca mudam por motivos técnicos.
2. **Application (Aplicação):** Casos de uso (Services e DTOs) que orquestram a lógica do sistema.
3. **Presentation / Infrastructure (Apresentação e Infraestrutura):** Controllers REST, integrações com banco (Spring Data JPA) e configurações de segurança.

---

## 2. Raio-X dos Arquivos da Sprint 0

### 2.1 pom.xml (Maven Project Object Model)
- **O que é:** O arquivo de configuração central do gerenciador de dependências e build (Apache Maven).
- **Principais dependências explicadas:**
  - spring-boot-starter-web: Traz o Spring MVC e o servidor web embutido Apache Tomcat.
  - spring-boot-starter-data-jpa: Traz o Hibernate e a abstração de repositórios para conversar com bancos relacionais.
  - spring-boot-starter-security: Fornece os filtros de segurança, controle de acesso e autenticação.
  - postgresql: O driver JDBC oficial para comunicação com bancos PostgreSQL (Supabase).
  - lyway-core: Gerencia migrações versionadas do schema do banco.
  - springdoc-openapi-starter-webmvc-ui: Gera automaticamente a documentação Swagger interativa em /swagger-ui.html.
  - lombok: Reduz código repetitivo (getters, setters, builders) gerando-os em tempo de compilação.
  - mapstruct: Biblioteca ultra rápida para converter Entidades em DTOs e vice-versa sem reflexão custosa.

### 2.2 OperacaoAprovacaoApplication.java
- **O que é:** O ponto de entrada da aplicação (main).
- **Anotações:**
  - @SpringBootApplication: Combina @Configuration, @EnableAutoConfiguration e @ComponentScan. Faz o Spring varrer e instanciar todos os componentes da aplicação.
  - @EnableJpaAuditing: Habilita o preenchimento automático das datas de criação e alteração nas entidades.

### 2.3 BaseEntity.java
- **O que é:** Superclasse abstrata com @MappedSuperclass.
- **Por que criamos:** Para que todas as entidades do banco herdem os campos created_at e updated_at.
- **Anotações:**
  - @CreatedDate: O Spring Data carimba a hora do INSERT.
  - @LastModifiedDate: O Spring Data carimba a hora de cada UPDATE.
  - @EntityListeners(AuditingEntityListener.class): O ouvinte que intercepta o ciclo de vida do Hibernate.

### 2.4 ApiResponse.java (Response Envelope Pattern)
- **O que é:** Um DTO genérico com success, message, data e 	imestamp.
- **Por que criamos:** Em APIs corporativas de alto nível, nunca se devolve dados soltos. O envelope padroniza todas as respostas, facilitando o tratamento de erros e parsing no Flutter.
- **Conceito:** Uso de Generics (<T>) para suportar qualquer tipo de dado de retorno mantendo type safety.

### 2.5 SecurityConfig.java
- **O que é:** A configuração de segurança do Spring Security 6.
- **Decisões arquiteturais fundamentais:**
  - SessionCreationPolicy.STATELESS: O servidor não guarda sessão em memória; cada requisição carrega seu próprio token JWT.
  - csrf.disable(): Desabilitado porque APIs REST stateless que usam tokens em cabeçalhos HTTP não são vulneráveis ao ataque clássico de CSRF baseado em cookies de navegador.
  - BCryptPasswordEncoder: Algoritmo seguro e lento por design (com salt aleatório) para garantir que senhas nunca sejam armazenadas em texto plano.

### 2.6 HealthController.java
- **O que é:** Endpoint HTTP GET em /api/v1/health.
- **Por que criamos:** Implementa o padrão de Liveness/Readiness Probe exigido por orquestradores de nuvem (como Kubernetes ou AWS ECS) para verificar se a API está de pé.

### 2.7 V1__initial_schema.sql (Flyway Migration)
- **O que é:** O primeiro script SQL versionado.
- **Por que usamos Flyway:** Em produção, o Hibernate nunca deve alterar tabelas sozinho (ddl-auto=update é perigoso). O Flyway garante que o histórico de criação do banco esteja registrado no código e seja reproduzível em qualquer ambiente.

---

## 3. Perguntas Reais de Entrevistas Técnicas

### Pergunta 1: "Qual a diferença entre Injeção de Dependências e Inversão de Controle (IoC)?"
**Como responder:**
> "A Inversão de Controle (IoC) é o princípio de design em que o controle do fluxo da aplicação é transferido para um container ou framework, em vez de o desenvolvedor instanciar manualmente objetos com 
ew. A Injeção de Dependências (DI) é a implementação concreta desse princípio: o Spring instancia os Beans e os injeta automaticamente nos componentes que precisam deles (via construtor ou @Autowired), garantindo baixo acoplamento e permitindo que usemos Mocks nos testes unitários."

### Pergunta 2: "Por que você escolheu uma arquitetura Stateless com JWT em vez de sessões com Cookies?"
**Como responder:**
> "A arquitetura Stateless não armazena estado de sessão no servidor. Isso permite que a aplicação escale horizontalmente adicionando novos nós ou pods atrás de um Load Balancer sem precisar de sessões compartilhadas (como Redis Session). Além disso, o token JWT trafega facilmente em qualquer cliente, seja um aplicativo mobile em Flutter, um frontend web ou integrações via API de terceiros."

### Pergunta 3: "O que é o Flyway e por que não usar hibernate.hbm2ddl.auto=update em produção?"
**Como responder:**
> "O hbm2ddl.auto=update não tem rastreabilidade histórica, não suporta reversão estruturada de mudanças e pode causar bloqueios de tabela (table locks) ou comportamento imprevisível em produção. O Flyway atua como um 'Git para o banco de dados', executando scripts SQL ordenados e imutáveis (V1, V2, etc.) validados por checksum na tabela lyway_schema_history, garantindo que Dev, Staging e Produção tenham rigorosamente o mesmo estado."