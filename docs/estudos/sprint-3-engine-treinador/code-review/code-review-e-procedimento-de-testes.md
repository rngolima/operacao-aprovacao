# 🕵️ Code Review & Procedimento de Homologação — Sprint 3: Engine do Treinador

> **Governança:** Cláusula 8 das Regras Absolutas do Projeto  
> **Módulo:** `treinamento` (Engine de Simulado, Motor Cebraspe e Telemetria)  
> **Status:** 100% Concluído & Homologado  
> **Suíte de Testes:** **77 Testes Automatizados — 100% BUILD SUCCESS**

---

## 📋 1. O que Foi Construído na Sprint 3

1. **Modelagem de Domínio Relacional & Enums:**
   - [`ModoSimulado.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/ModoSimulado.java): `PROVA_COMPLETA`, `POR_DISCIPLINA`, `PERSONALIZADO`.
   - [`StatusTentativa.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/StatusTentativa.java): `EM_ANDAMENTO`, `FINALIZADA`, `CANCELADA`.
   - [`Simulado.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/Simulado.java): Agregado raiz de prova com tempo limite oficial de 270 minutos (4h30min) e lista de itens ordenada (`@OrderBy`).
   - [`ItemSimulado.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/ItemSimulado.java): Entidade associativa rica com número ordinal e peso em `BigDecimal`.
   - [`TentativaSimulado.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/TentativaSimulado.java): Sessão do candidato com cronômetro, telemetria em segundos e nota líquida Cebraspe.
   - [`RespostaTentativa.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/model/RespostaTentativa.java): Registro de resposta com telemetria individual (`tempoGastoSegundos`), marcação e método semântico `isEmBranco()`.

2. **Motor Matemático de Correção Cebraspe:**
   - [`MotorCorrecaoCebraspe.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/service/MotorCorrecaoCebraspe.java):
     - Regra de Ouro: Questão C/E acerto $= +Peso$, erro $= -Peso$ ("1 errada anula 1 certa").
     - Abstenção Estratégica: Itens em branco $= 0.00$ ponto.
     - Bonificação de Anuladas: Questão anulada pela banca concede $+Peso$ a todos os concorrentes.
     - Suporte a múltipla escolha e pesos heterogêneos em `BigDecimal` (`HALF_UP`).
   - [`ResultadoCorrecaoCebraspe.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/domain/service/ResultadoCorrecaoCebraspe.java): Java record imutável com o sumário matemático.

3. **Banco de Dados & Migration Flyway:**
   - [`V3__create_simulados_schema.sql`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/resources/db/migration/V3__create_simulados_schema.sql):
     - Tabelas: `tb_simulado`, `tb_item_simulado`, `tb_tentativa_simulado`, `tb_resposta_tentativa`.
     - Índices de performance: `idx_tentativa_usuario`, `idx_tentativa_simulado`, `idx_resposta_tentativa`.
     - Constraints de unicidade: `uk_item_simulado_posicao` e `uk_resposta_tentativa_questao`.

4. **Camada de Aplicação & Casos de Uso:**
   - [`SimuladoService.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/application/service/SimuladoService.java): Criação manual, busca sem N+1 e algoritmo automático no formato PC-PE (60 itens).
   - [`TentativaService.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/application/service/TentativaService.java): Disparo de cronômetro, auto-save em tempo real, proteção IDOR e submissão com cálculo de tempo total via `Duration`.
   - 9 DTOs imutáveis com Beans Validation.

5. **Camada Web & Segurança:**
   - [`SimuladoController.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/presentation/controller/SimuladoController.java): Rotas REST documentadas com OpenAPI.
   - [`TentativaController.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/modules/treinamento/presentation/controller/TentativaController.java): Rotas de execução de prova com resolução automática de identidade do aluno logado via `@AuthenticationPrincipal`.
   - [`SecurityConfig.java`](file:///c:/Users/Rlima/OneDrive/Documentos/Projeto%20Aprovacao%20Concurso/operacao-aprovacao/backend/src/main/java/com/operacaoaprovacao/api/config/SecurityConfig.java): Permissão de leitura pública para simulados, criação restrita a `ROLE_ADMIN` e proteção de tentativas para alunos autenticados.

---

## 🧪 2. Procedimento de Testes Passo a Passo

### 🚀 Executando a Suíte Completa via Terminal:
No terminal na pasta raiz do backend (`backend/`), execute:
```bash
mvn test
```
**Resultado esperado:**
```text
[INFO] Results:
[INFO] Tests run: 77, Failures: 0, Errors: 0, Skipped: 0
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
```

### 🔬 Testando os Componentes da Sprint 3 Isoladamente:
```bash
# Testes do Motor Cebraspe (9 cenários matemáticos e regras de ouro)
mvn test -Dtest=MotorCorrecaoCebraspeTest

# Testes de Domínio e Entidades JPA (3 cenários)
mvn test -Dtest=SimuladoDomainTest

# Testes dos Serviços de Aplicação (10 cenários com Mockito)
mvn test "-Dtest=SimuladoServiceTest,TentativaServiceTest"

# Testes de Integração Web MockMvc dos Controllers (10 cenários com RBAC)
mvn test "-Dtest=SimuladoControllerTest,TentativaControllerTest"
```

---

## 🌐 3. Homologação Manual via Swagger UI / Postman

1. **Suba o backend:**
   ```bash
   mvn spring-boot:run
   ```
2. **Acesse o Swagger UI:**
   👉 `http://localhost:8080/swagger-ui/index.html`
3. **Autentique-se:** Obtenha o token JWT em `POST /api/v1/auth/login` e clique em `Authorize` (Bearer token).
4. **Fluxo do Aluno:**
   - Chame `GET /api/v1/simulados` para ver as provas disponíveis.
   - Chame `POST /api/v1/tentativas/iniciar?simuladoId=1` para disparar o cronômetro.
   - Chame `PUT /api/v1/tentativas/{id}/respostas` para simular o auto-save com tempo gasto.
   - Chame `POST /api/v1/tentativas/{id}/submeter` para finalizar e receber o boletim Cebraspe instantâneo!
