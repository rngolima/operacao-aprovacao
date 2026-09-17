# 📁 Guia Definitivo: Estrutura de Pastas no Java e a Arquitetura do Nosso Projeto

> **Documento de Mentoria & Preparação Técnica (Com Ícones Visuais do VS Code)**  
> Este guia usa a representação visual idêntica ao que você enxerga no seu editor para facilitar o aprendizado e memorização imediata.

---

## 🌍 PARTE 1: A Estrutura Padrão Universal do Java (Maven)

`	ext
📁 meu-projeto/
├── 🐘 pom.xml                     <-- Arquivo mestre de configuração (Project Object Model)
├── 📦 target/                     <-- Pasta de saída do compilador (arquivos binários .class e .jar)
└── 📁 src/                        <-- Código-fonte do projeto (Source)
    ├── 📁 main/                   <-- Tudo que vai para PRODUÇÃO (código que o usuário final usa)
    │   ├── ☕ java/               <-- Onde ficam os arquivos com código Java puro (.java)
    │   └── 🍃 resources/          <-- Arquivos de configuração e recursos (YAML, SQL, propriedades)
    └── 🧪 test/                   <-- Tudo que serve EXCLUSIVAMENTE para TESTES (não vai para produção)
        ├── ☕ java/               <-- Classes de testes unitários e de integração (.java com JUnit)
        └── 🍃 resources/          <-- Configurações exclusivas para o ambiente de testes
`

---

## 📦 PARTE 2: Pacotes e a Convenção de Domínio Invertido

No Java, todo código fica dentro de **Pacotes**, organizados pela regra do domínio da internet ao contrário:

`	ext
📁 src/
└── 📁 main/
    └── ☕ java/
        └── 📁 com/
            └── 📁 operacaoaprovacao/
                └── 📁 api/                <-- Pacote Raiz da Aplicação
                    └── ☕ OperacaoAprovacaoApplication.java
`

---

## 🏛️ PARTE 3: A Estrutura Completa do Nosso Projeto "Operação Aprovação"

Veja exatamente como o seu VS Code está organizado agora, com cada ícone temático:

`	ext
📁 operacao-aprovacao/
├── 📜 README.md                   <-- Apresentação oficial do projeto no GitHub com badges
├── 🚫 .gitignore                  <-- Impede envio de lixo (target/, .idea/) para o repositório
├── 📁 docs/                       <-- Documentação técnica de alto nível
│   ├── 📁 adr/                    <-- Registros Formais de Decisões de Arquitetura
│   │   ├── 📜 001-arquitetura-e-stack-tecnologica.md
│   │   └── 📜 002-autenticacao-jwt-e-rbac.md
│   └── 📁 estudos/                <-- Seus Guias de Estudos e Preparação para Entrevistas
│       ├── 📜 00-estrutura-de-pastas.md
│       ├── 📜 sprint-0-fundamentos.md
│       └── 📜 sprint-1-security-jwt.md
└── 📁 backend/
    ├── 🐘 pom.xml                 <-- Declara Java 21, Spring Boot 3.3, Flyway, PostgreSQL, JWT
    └── 📁 src/
        ├── 📁 main/               <-- Código de Produção
        │   ├── ☕ java/com/operacaoaprovacao/api/
        │   │   │
        │   │   ├── ☕ OperacaoAprovacaoApplication.java  <-- Ponto de ignição do Spring Boot
        │   │   │
        │   │   ├── 🔒 config/             <-- Configurações de Segurança e Frameworks
        │   │   │   ├── 🔒 SecurityConfig.java            <-- Regras do Spring Security (rotas públicas, CORS, stateless)
        │   │   │   ├── 🔒 JwtAuthenticationFilter.java   <-- Filtro que intercepta e valida tokens JWT
        │   │   │   └── 📄 OpenApiConfig.java             <-- Configuração visual do Swagger UI
        │   │   │
        │   │   ├── 🧱 core/               <-- Núcleo transversal compartilhado
        │   │   │   ├── 🧠 domain/
        │   │   │   │   └── ☕ BaseEntity.java             <-- Superclasse com created_at e updated_at automáticos
        │   │   │   ├── ✉️ dto/
        │   │   │   │   └── ☕ ApiResponse.java            <-- Envelope padronizado de resposta REST
        │   │   │   └── 🛡️ exception/
        │   │   │       ├── ☕ BusinessException.java      <-- Exceção para regras de negócio violadas
        │   │   │       └── ☕ GlobalExceptionHandler.java  <-- Intercepta erros e devolve JSON bonito
        │   │   │
        │   │   ├── 🧩 modules/            <-- Módulos de Negócio (Clean Architecture / DDD)
        │   │   │   │
        │   │   │   ├── 🔐 auth/           <-- Módulo de Autenticação e Usuários (Sprint 1)
        │   │   │   │   ├── 🧠 domain/
        │   │   │   │   │   ├── ☕ Usuario.java            <-- Entidade JPA + UserDetails do Spring Security
        │   │   │   │   │   ├── ☕ Role.java               <-- Enum de papéis (ROLE_STUDENT, ROLE_ADMIN)
        │   │   │   │   │   └── 🗄️ UsuarioRepository.java  <-- Consultas JPA (findByEmail, existsByEmail)
        │   │   │   │   ├── ✉️ application/dto/
        │   │   │   │   │   ├── ☕ RegisterRequest.java     <-- Dados de entrada do cadastro (com @Valid)
        │   │   │   │   │   ├── ☕ LoginRequest.java        <-- Dados de entrada do login
        │   │   │   │   │   └── ☕ AuthResponse.java        <-- Resposta com o Token JWT gerado
        │   │   │   │   ├── ⚙️ application/service/
        │   │   │   │   │   ├── ☕ AuthService.java         <-- Caso de uso: cadastra com BCrypt e faz login
        │   │   │   │   │   ├── ☕ JwtService.java          <-- Emite e valida a assinatura do JWT
        │   │   │   │   │   └── ☕ CustomUserDetailsService.java <-- Carrega o usuário do banco pro Spring
        │   │   │   │   └── 🌐 presentation/controller/
        │   │   │   │       └── ☕ AuthController.java      <-- Endpoints /api/v1/auth/register e /login
        │   │   │   │
        │   │   │   ├── 📁 certame/        <-- Módulo de Concursos (Sprint 2: Bancas, Editais, Disciplinas)
        │   │   │   ├── 📁 questao/        <-- Módulo de Questões (Sprint 2: Questões Cebraspe, Alternativas)
        │   │   │   └── 📁 treinamento/    <-- Módulo do Treinador (Sprint 3: Simulados e Desempenho)
        │   │   │
        │   │   └── 🌐 presentation/controller/
        │   │       └── ☕ HealthController.java          <-- Endpoint /api/v1/health de monitoramento
        │   │
        │   └── 🍃 resources/              <-- Arquivos de Configuração e Recursos
        │       ├── 🍃 application.yml                    <-- Configurações gerais da aplicação (porta 8080)
        │       ├── 🍃 application-dev.yml                <-- Perfil dev local (banco H2 em memória)
        │       ├── 🍃 application-prod.yml               <-- Perfil produção (PostgreSQL no Supabase)
        │       └── 🗄️ db/migration/
        │           └── 🗃️ V1__initial_schema.sql         <-- Primeiro script SQL versionado com Flyway
        │
        └── 🧪 test/                       <-- Testes Automatizados (Zero impacto em produção)
            └── ☕ java/com/operacaoaprovacao/api/
                ├── 🧪 OperacaoAprovacaoApplicationTests.java <-- Smoke test e validação do /api/v1/health
                └── 📁 modules/auth/
                    └── 🧪 AuthControllerTest.java            <-- Testes com MockMvc (cadastro, login, erros)
`

---

## 💡 Resumo dos Ícones para Você Bater o Olho e Identificar:

- 📁 **Pasta Comum:** Agrupador de arquivos.
- 🐘 **Elefante (Maven):** Configuração de dependências (pom.xml).
- ☕ **Xícara de Café (Java):** Código-fonte compilável (.java).
- 🍃 **Folha Verde (Spring):** Configurações do framework (pplication.yml).
- 🗄️ / 🗃️ **Banco de Dados (SQL):** Repositórios JPA e migrações do Flyway.
- 🔒 **Cadeado (Segurança):** Classes que protegem a aplicação com Spring Security e JWT.
- ✉️ **Envelope (DTO):** Objetos que transportam dados que entram ou saem da API.
- 🌐 **Globo (Controller):** Portas de entrada da API que recebem requisições da web/mobile.
- 🛡️ **Escudo (Exceptions):** Tratamento global e blindagem contra erros.
- 🧪 **Tubo de Ensaio (Testes):** Classes que testam e garantem que o sistema não quebre.
- 📜 **Pergaminho (Markdown):** Documentação técnica e guias de estudo.