# 🎯 Operação Aprovação — Plataforma Corporativa & Agente de Estudos

[![Java 21](https://img.shields.io/badge/Java-21%20LTS-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)](https://openjdk.org/)
[![Spring Boot 3.3.3](https://img.shields.io/badge/Spring%20Boot-3.3.3-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-316192?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Flyway](https://img.shields.io/badge/Flyway-Migrations-CC0200?style=for-the-badge&logo=flyway&logoColor=white)](https://flywaydb.org/)
[![OpenAPI](https://img.shields.io/badge/OpenAPI-Swagger-85EA2D?style=for-the-badge&logo=swagger&logoColor=black)](https://swagger.io/)
[![License](https://img.shields.io/badge/License-Proprietary-blue?style=for-the-badge)](LICENSE)

---

## 📌 Sobre o Projeto

O **Operação Aprovação** é uma plataforma corporativa e um **agente pessoal de treinamento** desenvolvido para potencializar a aprovação em concursos públicos de alta concorrência.

O sistema é **completamente agnóstico a certames**: sua engine inteligente é capaz de receber qualquer edital, banca examinadora (Cebraspe, FGV, FCC, etc.) e estrutura de disciplinas, adaptando dinamicamente o plano de estudos, simulados com pesos ponderados e métricas de desempenho. 

O caso de homologação inicial (MVP) é o concurso da **Polícia Civil do Estado de Pernambuco (PC-PE)** com a banca **Cebraspe**.

---

## 🏛️ Arquitetura e Engenharia

A solução foi projetada como um **Monólito Modular (Modular Monolith)** seguindo rigorosamente os princípios de **Clean Architecture**, **Domain-Driven Design (DDD)** e **SOLID**:

`mermaid
graph TD
    Client[Cliente / Mobile Flutter] -->|REST API + JWT| Security[Spring Security 6]
    Security --> Controllers[Presentation Layer / REST Controllers]
    Controllers --> UseCases[Application Layer / Services & DTOs]
    UseCases --> Domain[Domain Layer / Entities & Business Rules]
    Domain --> Repositories[Domain Repositories / Interfaces]
    Repositories --> Infrastructure[Infrastructure Layer / Spring Data JPA]
    Infrastructure --> Flyway[Flyway Migrations]
    Flyway --> Database[(PostgreSQL / Supabase)]
`

### 🧩 Módulos do Sistema (Bounded Contexts)
- **uth**: Gestão de identidade, controle de acesso baseado em papéis (RBAC) e emissão de tokens JWT.
- **certame**: Engine agnóstica de modelagem de Bancas, Concursos, Editais, Disciplinas e Assuntos.
- **questao**: Gestão do banco de questões (Múltipla Escolha e Certo/Errado), com gabaritos comentados e justificativas.
- **	reinamento**: Núcleo do agente inteligente de estudos, gerador de simulados ponderados e métricas de proficiência.

---

## 🛠️ Stack Tecnológica

### Backend (Java Corporativo)
- **Linguagem:** Java 21 (LTS)
- **Framework:** Spring Boot 3.3.3
- **Segurança:** Spring Security 6, JWT (io.jsonwebtoken), BCrypt
- **Persistência:** Spring Data JPA, Hibernate 6
- **Banco de Dados:** PostgreSQL (Produção / Supabase) e H2 (Dev / Testes)
- **Versionamento de Banco:** Flyway
- **Mapeamento & Boilerplate:** MapStruct, Lombok
- **Documentação de API:** SpringDoc OpenAPI 3.0 / Swagger UI
- **Testes:** JUnit 5, Mockito, Spring Boot Test, MockMvc

---

## 🚀 Como Executar o Projeto Localmente

### Pré-requisitos
- **Java 21** instalado e configurado no PATH
- **Apache Maven 3.9+** instalado
- **Git**

### Passo a Passo

1. **Clone o repositório:**
   `ash
   git clone https://github.com/rngolima/operacao-aprovacao.git
   cd operacao-aprovacao/backend
   `

2. **Execute os testes automatizados:**
   `ash
   mvn clean test
   `

3. **Inicie a aplicação:**
   `ash
   mvn spring-boot:run
   `

4. **Acesse a documentação interativa (Swagger):**
   Abra no seu navegador: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)

5. **Verifique a saúde da API:**
   [http://localhost:8080/api/v1/health](http://localhost:8080/api/v1/health)

---

## 📋 Roadmap de Entregas (Sprints)

- [x] **Sprint 0: Foundation** — Setup inicial com Java 21, Spring Boot 3.3, Clean Architecture, Flyway V1, OpenAPI, H2/PostgreSQL e testes unitários.
- [x] **Sprint 1: Security & Identity** — Implementação de autenticação JWT, encriptação BCrypt, RBAC e endpoints de registro/login.
- [ ] **Sprint 2: Core Domain (Certames & Questões)** — Modelagem agnóstica de bancas, concursos e ingestão do banco de questões da PC-PE.
- [ ] **Sprint 3: Engine de Treinamento & Simulados** — Geração dinâmica de simulados com regras Cebraspe e tracking de proficiência.
- [ ] **Sprint 4: Testes Corporativos & QA** — Testcontainers, cobertura massiva de testes e esteira CI/CD.
- [ ] **Sprint 5: Frontend Flutter** — Aplicativo mobile e web integrado à API.

---

## 📄 Decisões de Arquitetura (ADRs)

Todas as escolhas técnicas e padrões de engenharia estão formalmente documentados na pasta docs/adr/:
- [ADR 001: Definição da Arquitetura e Stack Tecnológica](docs/adr/001-arquitetura-e-stack-tecnologica.md)

---

## 👤 Autor & Desenvolvedor

Desenvolvido por **Rodrigo Lima** ([GitHub](https://github.com/rngolima)).