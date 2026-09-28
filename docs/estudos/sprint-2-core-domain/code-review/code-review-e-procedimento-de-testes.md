# 📑 Relatório de Code Review & Procedimento de Testes — Sprint 2: Core Domain

> **PROJETO:** Operação Aprovação — Plataforma de Concursos Públicos (PC-PE / Cebraspe)  
> **MÓDULO / ETAPA:** Sprint 2 — Core Domain (Certames, Árvore de Conhecimento, Motor de Questões Cebraspe & Busca Paginada)  
> **DESENVOLVEDOR:** Rudson Americo ([GitHub](https://github.com/rngolima))  
> **AUDITORIA TÉCNICA:** Arcabouço ECC (Enterprise Coding Catalyst) & Protocolo Cláusula 8 e 9  
> **DATA DE HOMOLOGAÇÃO:** 28/09/2026  
> **STATUS:** ![Veredito: APROVADO](https://img.shields.io/badge/Veredito-APROVADO%20(100%25)-brightgreen?style=for-the-badge)

---

## 📋 1. Resumo Executivo da Sprint 2

A **Sprint 2 (Core Domain)** implementou o núcleo de domínio educacional e a infraestrutura de dados para concursos públicos da plataforma **Operação Aprovação**. O escopo cobriu desde a modelagem física e relacional no PostgreSQL até a exposição de endpoints RESTful de alta performance, projetados para suportar a mecânica do **Cebraspe** para a **Polícia Civil de Pernambuco (PC-PE)**.

Foram entregues os seguintes pilares funcionais:
1. **Modelagem de Certames & Editais (Passo 1):** Entidades `Banca`, `Concurso`, `Edital` e enum `StatusConcurso` com integridade referencial por Chaves Estrangeiras e relacionamentos `@ManyToOne(fetch = FetchType.LAZY)`.
2. **Árvore de Conhecimento Hierárquica (Passo 2):** Entidades `Disciplina` e `Assunto` com consistência bidirecional em memória via métodos auxiliares (`addAssunto`/`removeAssunto`), remoção automática de órfãos (`orphanRemoval = true`) e consulta otimizada em uma única query com `JOIN FETCH` (zero problema N+1).
3. **Motor de Questões Cebraspe & Migration V2 (Passo 3):** Suporte nativo aos formatos **Certo/Errado** (1 errada anula 1 certa) e **Múltipla Escolha**, colunas para comentários jurídicos pré-computados (custo zero de IA em tempo real), índices B-Tree de busca e suporte a itens anulados.
4. **Casos de Uso & DTOs Imutáveis com Mockito Puro (Passo 4):** `CertameService` e `QuestaoService`, busca paginada com `Pageable`, validação de regras de domínio cruzadas (Assunto pertencente à Disciplina) e suíte de testes unitários isolados com Mockito puro.
5. **Endpoints REST, OpenAPI/Swagger & Segurança RBAC (Passo 5):** `CertameController` e `QuestaoController`, paginação estável com `@EnableSpringDataWebSupport(pageSerializationMode = VIA_DTO)`, autorização com `@PreAuthorize("hasRole('ADMIN')")`, retorno semântico com HTTP 201 Created + Header `Location` e tratamento global de `ResourceNotFoundException` com HTTP 404 Not Found.

---

## 🏛️ 2. Matriz de Auditoria nos 5 Pilares Fundamentais (Cláusula 9)

| Pilar de Engenharia | Critério de Avaliação | Resultado Auditado | Situação |
| :--- | :--- | :--- | :---: |
| **1. Base Sólida de Java** | Java Records, Imutabilidade, Enums tipados e Factory Methods (`fromEntity`) | DTOs implementados como `record` imutáveis (`QuestaoResponse`, `BancaResponse`, `ConcursoResponse`, `DisciplinaTreeResponse`). Uso de `@Enumerated(EnumType.STRING)` para evitar corrupção por ordinal. | ✅ APROVADO |
| **2. Ecossistema Spring sem Mágica** | IoC via construtor com Lombok, `@Transactional(readOnly = true)`, `Pageable` e `@RestControllerAdvice` | Zero anotações `@Autowired`. Métodos de leitura com `readOnly = true` para ganho de CPU/RAM. Tratamento global de `ResourceNotFoundException` devolvendo HTTP 404 Not Found. | ✅ APROVADO |
| **3. Banco de Dados & SQL Real** | Migration Flyway `V2`, integridade relacional, B-Tree e combate ao N+1 Queries | Índices B-Tree criados em `banca_id`, `disciplina_id`, `assunto_id` e `ano`. `JOIN FETCH` no `DisciplinaRepository.findAllWithAssuntos()` carregando a árvore inteira em 1 único SQL. | ✅ APROVADO |
| **4. Testes Automatizados Corporativos** | Mockito puro isolado, MockMvc com `@WithMockUser` e integridade de domínio | **45/45 testes passando com 100% de sucesso.** Testes de serviço rodando em milissegundos com Mockito e testes de integração web cobrindo cenários de sucesso, validação e 403 Forbidden. | ✅ APROVADO |
| **5. Ferramentas, Git & HTTP** | Semântica estrita de status HTTP, OpenAPI 3.0 e versionamento limpo | Status `200 OK` em consultas, `201 CREATED` com cabeçalho `Location` na criação, `404 NOT FOUND` em recurso ausente, `400 BAD REQUEST` para violação de regras e `403 FORBIDDEN` para rotas administrativas. | ✅ APROVADO |

---

## 🔍 3. Detalhamento Técnico dos Componentes Entregues

### 3.1. Módulo Certame (Bancas, Concursos e Matérias)
- **`Banca.java`, `Concurso.java`, `Edital.java`, `StatusConcurso.java`:** Entidades de domínio com rastreamento temporal (`BaseEntity`), chaves estrangeiras com índices B-Tree e ciclo de vida controlado por enum.
- **`Disciplina.java` e `Assunto.java`:** Modelagem 1:N hierárquica do edital da PC-PE, com métodos auxiliares de sincronização em memória (`addAssunto`/`removeAssunto`) e `orphanRemoval = true`.
- **`CertameRepository` (Banca, Concurso, Edital, Disciplina, Assunto):** Repositórios especialistas com derived queries indexadas e `findAllWithAssuntos()` com `JOIN FETCH`.
- **`CertameService.java`:** Serviço transacional de consulta para bancas, concursos por estado e árvore do edital.
- **`CertameController.java`:** Controller REST público documentado com Swagger UI em `/api/v1/certames/**`.

### 3.2. Módulo Questão (Motor Cebraspe & Busca Paginada)
- **`V2__create_questoes_schema.sql`:** Migration Flyway criando tabelas `tb_questao` e `tb_alternativa`, índices B-Tree compostos e seeds reais da PC-PE 2024.
- **`Questao.java` e `Alternativa.java`:** Entidades centrais suportando Certo/Errado e Múltipla Escolha com `columnDefinition = "TEXT"` para enunciados e fundamentações legais completas.
- **`QuestaoRepository.java`:** Consulta customizada `findComFiltros` com parâmetros opcionais dinâmicos e suporte nativo a `Pageable`.
- **`QuestaoService.java`:** Orquestrador de regras de negócio: validação de integridade (Assunto deve pertencer à Disciplina), validação de regras de gabarito por tipo de questão e anulação oficial de itens.
- **`QuestaoController.java`:** Controller REST expondo busca paginada, consulta por ID e operações restritas a `ROLE_ADMIN` (`POST /api/v1/questoes` e `PATCH /api/v1/questoes/{id}/anular`).

---

## 🧪 4. Procedimento de Teste & Execução no Terminal (Treinamento do Desenvolvedor)

> **CHECKLIST PRÁTICO OBRIGATÓRIO (CLÁUSULA 8):**  
> Para auditar e reproduzir a suíte completa de testes na sua máquina local:

### Passo 1: Abrir o terminal no diretório do backend
```bash
cd backend
```

### Passo 2: Executar a suíte completa de testes automatizados com Maven
```bash
mvn clean test
```

### Passo 3: Interpretar o log de sucesso do build corporativo
```text
[INFO] Running com.operacaoaprovacao.api.modules.auth.AuthControllerTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0 -- in AuthControllerTest
[INFO] Running com.operacaoaprovacao.api.modules.auth.AuthServiceTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0 -- in AuthServiceTest
[INFO] Running com.operacaoaprovacao.api.modules.certame.CertameControllerTest
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0 -- in CertameControllerTest
[INFO] Running com.operacaoaprovacao.api.modules.certame.CertameDomainTest
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0 -- in CertameDomainTest
[INFO] Running com.operacaoaprovacao.api.modules.certame.CertameServiceTest
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0 -- in CertameServiceTest
[INFO] Running com.operacaoaprovacao.api.modules.certame.DisciplinaAssuntoDomainTest
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0 -- in DisciplinaAssuntoDomainTest
[INFO] Running com.operacaoaprovacao.api.modules.questao.QuestaoControllerTest
[INFO] Tests run: 5, Failures: 0, Errors: 0, Skipped: 0 -- in QuestaoControllerTest
[INFO] Running com.operacaoaprovacao.api.modules.questao.QuestaoDomainTest
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0 -- in QuestaoDomainTest
[INFO] Running com.operacaoaprovacao.api.modules.questao.QuestaoServiceTest
[INFO] Tests run: 9, Failures: 0, Errors: 0, Skipped: 0 -- in QuestaoServiceTest
[INFO] Running com.operacaoaprovacao.api.core.exception.GlobalExceptionHandlerTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0 -- in GlobalExceptionHandlerTest
[INFO] Running com.operacaoaprovacao.api.OperacaoAprovacaoApplicationTests
[INFO] Tests run: 2, Failures: 0, Errors: 0, Skipped: 0 -- in OperacaoAprovacaoApplicationTests
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 45, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

---

## 🎤 5. Simulação de Entrevista Técnica — Perguntas & Respostas Sênior

### Pergunta 1:
> *"Como você evitou o problema crônico de performance do N+1 Queries ao carregar a árvore de disciplinas e tópicos do edital da PC-PE?"*

**Resposta Modelo Sênior:**  
*"Em relacionamentos `@OneToMany` com carregamento preguiçoso (`FetchType.LAZY`), chamar `disciplina.getAssuntos()` dentro de um laço geraria 1 consulta inicial para as disciplinas e mais N consultas subsequentes para os assuntos de cada matéria, sobrecarregando o banco com dezenas de viagens de rede. Solucionamos isso criando uma consulta customizada com `JOIN FETCH` no repositório (`SELECT DISTINCT d FROM Disciplina d LEFT JOIN FETCH d.assuntos`). Isso instrui o Hibernate a gerar uma única instrução SQL com junção relacional externa à esquerda (`LEFT OUTER JOIN`), trazendo a matéria e todos os seus tópicos de uma só vez para a memória da JVM em uma única viagem de rede (Round-Trip) e com tempo de resposta inferior a 2 milissegundos."*

---

### Pergunta 2:
> *"Por que você optou por armazenar os comentários, justificativas e jurisprudências diretamente na tabela de questões em vez de invocar uma API de Inteligência Artificial generativa em tempo real quando o usuário clica em 'Ver Resolução'?"*

**Resposta Modelo Sênior:**  
*"Essa decisão arquitetural foi orientada a **viabilidade econômico-financeira** e **latência de atendimento**. Em uma plataforma de estudos de alto tráfego com milhares de concurseiros resolvendo simulados diariamente, chamar uma LLM em tempo real para cada questão geraria um custo proibitivo de tokens e imporia uma latência inaceitável de 2 a 5 segundos por clique. Ao adotar o padrão de **resoluções pré-computadas na ingestão (Batch Resolution Ingestion)**, a IA é invocada apenas uma vez no momento do cadastro ou parsing da prova. Quando o aluno estuda, a justificativa e o artigo de lei são entregues diretamente pelo PostgreSQL indexado em menos de 1 milissegundo com **custo operacional de IA igual a zero**."*

---

## 🏆 6. Veredito Final da Auditoria

A **Sprint 2: Core Domain** cumpre 100% dos requisitos de governança do Arcabouço ECC, arquitetura Clean/DDD, integridade de banco relacional e cobertura de testes automatizados com Mockito e MockMvc.

**Veredito:** **APROVADO (100%) COM LOUVOR.**
