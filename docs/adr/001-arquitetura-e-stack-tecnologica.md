# ADR 001: Definição da Arquitetura e Stack Tecnológica

## Contexto
O projeto "Operação Aprovação" tem a missão de ser um produto comercial para preparação em concursos públicos (com foco inicial na PC-PE), um portfólio de engenharia de software de alto nível e uma plataforma de formação contínua em desenvolvimento Java corporativo.
A solução necessita de alta escalabilidade, separação clara de responsabilidades, independência de fornecedores externos e garantia de conformidade com padrões de mercado.

## Decisão
Adotamos uma arquitetura de **Monólito Modular (Modular Monolith)** orientado a **Clean Architecture** e princípios de **DDD (Domain-Driven Design)**, com:
1. **Linguagem & Plataforma:** Java 21 (LTS) aproveitando melhorias de sintaxe, performance e Virtual Threads.
2. **Framework Base:** Spring Boot 3.3.x com Spring Data JPA, Spring Security e Validation.
3. **Persistência & Migrações:** PostgreSQL (hospedado no Supabase para produção e H2 para testes/desenvolvimento rápido desacoplado), gerenciado estritamente por versionamento de banco via **Flyway**.
4. **Segurança:** Spring Security 6 com autenticação baseada em tokens JWT (Stateless) e criptografia de senhas com BCrypt.
5. **Documentação de Contrato:** SpringDoc OpenAPI 3.0 / Swagger UI.
6. **Frontend:** Flutter (Mobile e Web), consumindo exclusivamente a API REST.

## Consequências

### Vantagens
- **Agnóstico a Concursos:** A estrutura de dados (Banca, Concurso, Edital, Disciplina, Questão) suporta qualquer certame do país, não apenas PC-PE.
- **Auditoria e Versionamento:** Nenhuma alteração de banco ocorrerá sem script SQL versionado no Flyway (`V1__...`).
- **Segurança Nativa:** Proteção contra OWASP Top 10, sem dependência de estado de sessão no servidor.
- **Portfólio Defensável:** Todas as tecnologias e padrões são referências em processos seletivos para Engenheiros de Software Java.

### Alternativas Consideradas
- *Microserviços distribuídos desde o dia 1:* Descartado devido à complexidade operacional e overhead desnecessário para o estágio atual (MVP/Sprints 0 a 5). O Monólito Modular permite transição fluida caso o produto escale.
- *Node.js / Python no backend:* Descartado para cumprir o objetivo estratégico de formação do desenvolvedor no ecossistema Java corporativo.
