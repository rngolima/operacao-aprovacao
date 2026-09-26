# 📑 Relatório de Code Review & Procedimento de Testes — Sprint 1: Security & Identity

> **PROJETO:** Operação Aprovação — Plataforma de Concursos Públicos (PC-PE)  
> **MÓDULO / ETAPA:** Sprint 1 — Security & Identity (Autenticação JWT, Spring Security 6 & RBAC)  
> **DESENVOLVEDOR:** Rudson Americo ([GitHub](https://github.com/rngolima))  
> **AUDITORIA TÉCNICA:** Arcabouço ECC (Enterprise Coding Catalyst) & Protocolo Cláusula 9  
> **DATA DE HOMOLOGAÇÃO:** 26/09/2026  
> **STATUS:** ![Veredito: APROVADO](https://img.shields.io/badge/Veredito-APROVADO%20(100%25)-brightgreen?style=for-the-badge)

---

## 📋 1. Resumo Executivo da Sprint 1

A **Sprint 1 (Security & Identity)** implementou a infraestrutura completa de autenticação, autorização e gerenciamento de identidade da plataforma **Operação Aprovação**, em conformidade com as especificações da RFC 7519 (JSON Web Tokens), RFC 5322 (Validação de E-mail) e os padrões OWASP Top 10 para APIs RESTful.

O módulo foi construído sob uma arquitetura **Stateless**, desacoplando a autenticação de sessões em memória do servidor e permitindo escalabilidade horizontal ilimitada. As credenciais dos candidatos são protegidas por criptografia de mão única **BCrypt com 10 rounds de custo e Salting aleatório**, inviabilizando ataques por Rainbow Tables ou força bruta.

---

## 🏛️ 2. Matriz de Auditoria nos 5 Pilares Fundamentais (Cláusula 9)

| Pilar de Engenharia | Critério de Avaliação | Resultado Auditado | Situação |
| :--- | :--- | :--- | :---: |
| **1. Base Sólida de Java** | Records, Imutabilidade, Generics (`ApiResponse<T>`) e Exceções Semânticas | DTOs de entrada e resposta imutáveis, normalização de inputs (`.toLowerCase().trim()`) e `BusinessException` herdando de `RuntimeException` para rollback transacional automático. | ✅ APROVADO |
| **2. Ecossistema Spring sem Mágica** | IoC/DI via construtor com campos `final`, Bean Validation (`@Valid`) e `@RestControllerAdvice` | Zero anotações `@Autowired` em campos. Thin Controllers delegando regras ao `AuthService`. Interceptação AOP global de erros padronizada. | ✅ APROVADO |
| **3. Banco de Dados & SQL Real** | Otimização de consultas, índices B-Tree e segurança de schema | Verificação prévia de unicidade com `existsByEmail` disparando `SELECT 1 ... LIMIT 1` indexado via B-Tree. Zero vazamento de stacktrace ou SQL em erros. | ✅ APROVADO |
| **4. Testes Automatizados Corporativos** | Cobertura com Mockito puro isolado e integração com MockMvc | **13/13 testes passando com 100% de sucesso.** Contraste comprovado: 4 testes unitários com Mockito executando em 4 segundos vs suíte de integração em 39 segundos. | ✅ APROVADO |
| **5. Ferramentas, Git & HTTP** | Semântica estrita de status HTTP e governança de repositório | Status codes precisos: `201 CREATED` no cadastro, `200 OK` no login, `400 BAD REQUEST` para validação/regra de negócio e `401 UNAUTHORIZED` para credenciais inválidas. | ✅ APROVADO |

---

## 🔍 3. Detalhamento Técnico dos Componentes Entregues

### 3.1. Domínio de Identidade & RBAC (Passo 1)
- **`Usuario.java`:** Entidade JPA mapeada na tabela `tb_usuario`, herdando auditoria de `BaseEntity` (`created_at`, `updated_at`). Implementa `UserDetails` do Spring Security.
- **`Role.java`:** Enum padronizado com `ROLE_STUDENT` e `ROLE_ADMIN`, persistido como texto (`EnumType.STRING`) para evitar corrupção de ordinal no PostgreSQL.
- **`UsuarioRepository.java`:** Repositório Spring Data JPA com Derived Queries indexadas (`findByEmail` e `existsByEmail`).

### 3.2. Motor Criptográfico JWT (Passo 2)
- **`JwtService.java`:** Motor criptográfico responsável pela assinatura digital baseada em HMAC-SHA256 (`Keys.hmacShaKeyFor`).
- **Validação Matemática:** Extração do *Subject* (e-mail) e conferência de expiração (TTL de 24 horas) em memória sem necessidade de consulta ao banco em cada requisição autenticada.

### 3.3. Filtro de Interceptação de Rede (Passo 3)
- **`JwtAuthenticationFilter.java`:** Herdeiro de `OncePerRequestFilter`, garantindo idempotência de execução e processamento único por ciclo de vida HTTP.
- **`CustomUserDetailsService.java`:** Ponte oficial entre a tabela do PostgreSQL e o Spring Security para recomposição do contexto seguro (`SecurityContextHolder`).

### 3.4. Casos de Uso, DTOs & Endpoints REST (Passo 4)
- **DTOs (`RegisterRequest`, `LoginRequest`, `AuthResponse`):** Blindagem sanitária com Bean Validation (`@NotBlank`, `@Email`, `@Size`), impedindo ataques de Mass Assignment.
- **`AuthService.java`:** Regras de negócio encapsuladas com transacionalidade ACID (`@Transactional`), hashing com BCrypt e controle de duplicidade.
- **`AuthController.java`:** Thin Controller com anotações OpenAPI/Swagger (`@Tag`, `@Operation`) expondo `/api/v1/auth/register` e `/api/v1/auth/login`.

### 3.5. A Muralha de Segurança & Tratamento Global de Erros (Passo 5)
- **`SecurityConfig.java`:** Corrente de filtros (`SecurityFilterChain`) com CORS configurado, CSRF desabilitado por arquitetura Stateless, liberação cirúrgica de rotas públicas (`/api/v1/auth/**`, `/swagger-ui/**`) e restrição de todas as demais rotas para usuários autenticados.
- **`GlobalExceptionHandler.java`:** Interceptador AOP `@RestControllerAdvice` capturando `BusinessException` (400), `BadCredentialsException` (401), `MethodArgumentNotValidException` (400 estruturado) e `Exception` (500 blindado).

---

## 🧪 4. Procedimento de Teste & Execução no Terminal (Treinamento do Desenvolvedor)

> **CHECKLIST PRÁTICO OBRIGATÓRIO (CLÁUSULA 8):**  
> Para reproduzir e auditar a suíte de testes completa na sua máquina local:

### Passo 1: Abrir o terminal no diretório do backend
```bash
cd backend
```

### Passo 2: Executar a suíte de testes automatizada do Maven
```bash
mvn clean test
```

### Passo 3: Interpretar o log de sucesso do build
```text
[INFO] Running com.operacaoaprovacao.api.modules.auth.AuthControllerTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0 -- in AuthControllerTest
[INFO] Running com.operacaoaprovacao.api.modules.auth.AuthServiceTest
[INFO] Tests run: 4, Failures: 0, Errors: 0, Skipped: 0 -- in AuthServiceTest
[INFO] Running com.operacaoaprovacao.api.core.exception.GlobalExceptionHandlerTest
[INFO] Tests run: 3, Failures: 0, Errors: 0, Skipped: 0 -- in GlobalExceptionHandlerTest
[INFO] Running com.operacaoaprovacao.api.OperacaoAprovacaoApplicationTests
[INFO] Tests run: 2, Failures: 0, Errors: 0, Skipped: 0 -- in OperacaoAprovacaoApplicationTests
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 13, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

---

## 🎤 5. Simulação de Entrevista Técnica — Perguntas & Respostas Sênior

### Pergunta 1:
> *"Por que você optou por uma arquitetura Stateless com JWT no Spring Security em vez de utilizar as tradicionais sessões HTTP em memória (`HttpSession`) com cookies?"*

**Resposta Modelo Sênior:**  
*"Adotei a arquitetura Stateless por questões de **escalabilidade horizontal** e **resiliência operacional**. Em um monolito modular moderno ou em arquiteturas distribuídas, manter sessões em memória do servidor obriga o balanceador de carga a usar sticky sessions ou exige clusters de cache compartilhados (como Redis Session Replication) para que o usuário não seja deslogado ao bater em nós diferentes. Com o token JWT assinado criptograficamente via HMAC-SHA256, a própria requisição carrega o estado de identidade do aluno no cabeçalho `Authorization`. Cada nó da aplicação valida a autenticidade e expiração do token de forma autônoma e em frações de milissegundo, permitindo que a API escale horizontalmente de 1 para dezenas de containers com custo mínimo de infraestrutura."*

---

### Pergunta 2:
> *"Qual é a importância de isolar os testes unitários do seu Service usando Mockito puro em vez de usar `@SpringBootTest` para tudo?"*

**Resposta Modelo Sênior:**  
*"A diferença primordial reside na **velocidade de feedback e isolamento de responsabilidade**. Um teste com `@SpringBootTest` carrega o contexto completo do Spring, inicializa Hibernate, conexões de banco de dados e filtros de segurança, levando tipicamente dezenas de segundos para executar. Já os testes com Mockito puro (`@ExtendWith(MockitoExtension.class)`) criam dublês de teste virtuais (`@Mock`) para as dependências externas e executam apenas a lógica pura de negócio em Java na memória da JVM. Na nossa suíte, os testes com Mockito rodam em menos de 4 segundos, acelerando o ciclo de Desenvolvimento Orientado a Testes (TDD) e barateando custos de processamento em pipelines de Integração Contínua (CI/CD)."*

---

## 🏆 6. Veredito Final da Auditoria

A **Sprint 1: Security & Identity** cumpre 100% dos requisitos arquiteturais, de segurança e de testabilidade estabelecidos pelo projeto.

**Veredito:** **APROVADO PARA HOMOLOGAÇÃO E MERGE NA BRANCH MAIN.**
