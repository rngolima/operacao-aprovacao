# 📁 Guia Definitivo: Estrutura de Pastas no Java e a Arquitetura do Nosso Projeto

> **Documento de Mentoria & Preparação Técnica**  
> Antes de escrever qualquer linha de código em Java, um engenheiro de software precisa dominar a anatomia dos diretórios. Este guia explica a convenção mundial padrão do Java (Maven) e o desenho arquitetural exato da plataforma **Operação Aprovação**.

---

## 🌍 PARTE 1: A Estrutura Padrão Mundial do Java (Maven Standard Directory Layout)

Se você abrir um projeto Java em Tóquio, em Nova York ou em São Paulo, construído em uma startup ou no Google, **a estrutura raiz é sempre a mesma**. 

Isso é uma convenção rígida criada pelo **Apache Maven** (chamada de *Convention over Configuration* — Convenção sobre Configuração). Você não inventa nomes de pastas na raiz; você segue o padrão para que o compilador e as ferramentas de CI/CD saibam onde encontrar cada coisa.

### A Árvore Raiz Universal:

`	ext
meu-projeto/
├── pom.xml                     <-- Arquivo mestre de configuração (Project Object Model)
├── target/                     <-- Pasta gerada pelo compilador (arquivos .class compilados e JAR final)
└── src/                        <-- Código-fonte do projeto (Source)
    ├── main/                   <-- Tudo que vai para PRODUÇÃO (código que o usuário final usa)
    │   ├── java/               <-- Onde ficam os arquivos com código Java puro (.java)
    │   └── resources/          <-- Arquivos de configuração e recursos (YAML, SQL, imagens, templates)
    └── test/                   <-- Tudo que serve EXCLUSIVAMENTE para TESTES (não vai para produção)
        ├── java/               <-- Classes de testes unitários e de integração (.java)
        └── resources/          <-- Configurações exclusivas para o ambiente de testes
`

---

### O Papel de Cada Diretório Padrão:

| Pasta / Arquivo | O que é e qual o seu propósito? |
| :--- | :--- |
| **pom.xml** | O "RG" e o cérebro do projeto. Nele você declara a versão do Java (ex: Java 21), a versão do Spring Boot, e lista todas as bibliotecas externas (dependências) que o projeto precisa baixar da internet. |
| **src/main/java** | A pasta sagrada da lógica. **Nenhum arquivo de configuração ou imagem fica aqui**. Apenas classes, interfaces, enums e records em Java. |
| **src/main/resources** | Tudo o que **não é código Java compilado**, mas que o Java precisa para rodar. Exemplos: pplication.yml (senhas, portas, URLs de banco), scripts SQL de migração (db/migration/) e certificados. |
| **src/test/java** | Onde moram os testes automatizados (JUnit e Mockito). O Maven separa essa pasta porque o que está aqui é compilado apenas durante o build e **nunca é embutido no arquivo final enviado para a nuvem**, mantendo o sistema leve e seguro. |
| **	arget/** | Pasta temporária de saída criada pelo Maven. Quando você roda mvn clean package, o compilador gera aqui dentro os arquivos binários .class e o arquivo .jar executável. **Essa pasta NUNCA deve ir para o Git** (está no .gitignore). |

---

## 📦 PARTE 2: O que são "Pacotes" (Packages) e a Convenção de Domínio Invertido?

Dentro de src/main/java, o Java não permite que arquivos fiquem soltos. Eles são organizados em **Pacotes** (que no sistema operacional são pastas reais dentro de pastas).

### A Convenção de Domínio Invertido:
No mundo inteiro, pacotes Java começam com o endereço de internet da empresa ou projeto escrito de trás para frente:

- Se o site da empresa fosse: operacaoaprovacao.com.br
- O pacote raiz do Java DEVE ser: r.com.operacaoaprovacao.api
- Como nosso projeto usa o padrão internacional .com:  
  👉 **com.operacaoaprovacao.api**

Fisicamente no seu disco rígido, isso cria a hierarquia de pastas:
`	ext
src/main/java/
└── com/
    └── operacaoaprovacao/
        └── api/
            └── [AQUI COMEÇA O NOSSO CÓDIGO REAL]
`

---

## 🏛️ PARTE 3: A Estrutura Exata do Projeto "Operação Aprovação"

Nós não fizemos uma bagunça de arquivos. Aplicamos o padrão de **Monólito Modular (Modular Monolith)** aliado à **Clean Architecture** (Arquitetura Limpa).

Veja como o nosso projeto está estruturado e para que serve cada pasta:

`	ext
operacao-aprovacao/
├── README.md                   <-- Apresentação corporativa com badges e guia de execução
├── docs/                       <-- Documentação técnica para engenheiros e estudos
│   ├── adr/                    <-- Registros Formais de Decisões Arquiteturais (ADRs)
│   │   ├── 001-arquitetura-e-stack-tecnologica.md
│   │   └── 002-autenticacao-jwt-e-rbac.md
│   └── estudos/                <-- Seus guias didáticos para entrevistas e domínio do código
│       ├── 00-estrutura-de-pastas.md (este arquivo)
│       ├── sprint-0-fundamentos.md
│       └── sprint-1-security-jwt.md
└── backend/
    ├── pom.xml
    └── src/
        ├── main/
        │   ├── java/com/operacaoaprovacao/api/
        │   │   │
        │   │   ├── OperacaoAprovacaoApplication.java  <-- Ponto de ignição do Spring Boot
        │   │   │
        │   │   ├── config/             <-- Configurações globais de infraestrutura e frameworks
        │   │   │   ├── SecurityConfig.java            <-- Regras do Spring Security (rotas públicas, CORS, stateless)
        │   │   │   ├── JwtAuthenticationFilter.java   <-- Filtro que intercepta chamadas e valida o token JWT
        │   │   │   └── OpenApiConfig.java             <-- Configuração visual do Swagger UI com botão Authorize
        │   │   │
        │   │   ├── core/               <-- O "chassi" compartilhado por todo o sistema
        │   │   │   ├── domain/         <-- Classes base de banco (BaseEntity com created_at e updated_at)
        │   │   │   ├── dto/            <-- ApiResponse<T> (o envelope padronizado JSON de sucesso e erro)
        │   │   │   └── exception/      <-- GlobalExceptionHandler e exceções de negócio (BusinessException)
        │   │   │
        │   │   ├── modules/            <-- MÓDULOS DE NEGÓCIO (Bounded Contexts do DDD)
        │   │   │   │
        │   │   │   ├── auth/           <-- Módulo de Autenticação e Usuários (Sprint 1)
        │   │   │   │   ├── domain/model/         <-- Entidade Usuario (UserDetails) e enum Role
        │   │   │   │   ├── domain/repository/    <-- Interface UsuarioRepository (Spring Data JPA)
        │   │   │   │   ├── application/dto/      <-- RegisterRequest, LoginRequest, AuthResponse
        │   │   │   │   ├── application/service/  <-- AuthService, JwtService, CustomUserDetailsService
        │   │   │   │   └── presentation/controller/ <-- AuthController (/api/v1/auth/register e /login)
        │   │   │   │
        │   │   │   ├── certame/        <-- Módulo Agnóstico de Concursos (Sprint 2 - próximo passo)
        │   │   │   │   └── (Banca, Concurso, Edital, Disciplina, Assunto)
        │   │   │   │
        │   │   │   ├── questao/        <-- Módulo do Banco de Questões (Sprint 2)
        │   │   │   │   └── (Questao, Alternativa, Justificativa Cebraspe)
        │   │   │   │
        │   │   │   └── treinamento/    <-- Módulo do Agente Inteligente de Estudos (Sprint 3)
        │   │   │       └── (Simulados adaptativos, histórico, proficiência)
        │   │   │
        │   │   └── presentation/controller/
        │   │       └── HealthController.java          <-- Endpoint /api/v1/health de monitoramento
        │   │
        │   └── resources/
        │       ├── application.yml                    <-- Configuração comum (porta 8080, swagger)
        │       ├── application-dev.yml                <-- Perfil dev local (banco H2 em memória)
        │       ├── application-prod.yml               <-- Perfil produção (PostgreSQL no Supabase)
        │       └── db/migration/
        │           └── V1__initial_schema.sql         <-- Script SQL versionado do Flyway
        │
        └── test/java/com/operacaoaprovacao/api/
            ├── OperacaoAprovacaoApplicationTests.java <-- Smoke test e validação do /api/v1/health
            └── modules/auth/
                └── AuthControllerTest.java            <-- Testes de integração de registro e login com MockMvc
`

---

## 🎯 PARTE 4: Por que essa divisão em Camadas? (Clean Architecture explicada)

Dentro de cada módulo (como o modules/auth), você notou três subpastas principais:
1. **domain/ (Domínio):** Onde ficam as entidades puras do negócio (como Usuario e Role) e as interfaces de repositório (UsuarioRepository). Essa camada representa as regras mais sagradas do negócio.
2. **pplication/ (Aplicação):** Onde ficam os Casos de Uso (AuthService, JwtService) e os objetos de transferência de dados (RegisterRequest, LoginRequest). É aqui que fica a inteligência: *"antes de salvar, verifique se o e-mail já existe e criptografe a senha"*.
3. **presentation/ (Apresentação):** Onde moram os Controllers (AuthController). O Controller é "burro": ele apenas recebe a requisição HTTP do Flutter, valida se os campos não vieram em branco (@Valid) e chama o Service.

---

## 💼 PARTE 5: Como Defender essa Estrutura em Entrevistas de Emprego?

### Pergunta 1: "Qual a diferença entre uma arquitetura em camadas tradicional (Layered) e uma arquitetura orientada a módulos (Package by Feature / Modular Monolith)?"
**Como você responde:**
> "Na arquitetura tradicional *Package by Layer*, você cria pastas gigantes na raiz: uma pasta controllers com todos os controllers do sistema, uma pasta services com todos os services, etc. Conforme o sistema cresce, isso gera acoplamento caótico.  
> No nosso projeto adotamos o **Package by Feature (Monólito Modular)**: cada área de negócio (uth, certame, questao, 	reinamento) é um módulo coeso e autocontido. Isso facilita a manutenção, isola o impacto de mudanças e nos permite extrair qualquer módulo para um microsserviço independente no futuro sem dor."

### Pergunta 2: "Por que você isolou a pasta core/ do restante dos módulos?"
**Como você responde:**
> "A pasta core/ funciona como o nosso Kernel compartilhado. Nela colocamos utilitários e contratos transversais a todo o sistema que não pertencem a nenhuma regra de negócio específica, como o envelope padronizado de resposta ApiResponse<T>, a superclasse de auditoria BaseEntity e o interceptador global de erros GlobalExceptionHandler. Isso garante consistência arquitetural sem duplicar código."