# ADR 002: Autenticacao Stateless com JWT e RBAC

## Contexto
A plataforma Operação Aprovação exige um mecanismo de autenticação seguro, performático e capaz de atender simultaneamente múltiplos clientes: aplicação mobile/web em Flutter, ferramentas administrativas e eventuais integrações futuras com LLMs/Agentes externos.

## Decisão
Implementamos autenticação baseada em **JSON Web Tokens (JWT)** assinados com o algoritmo criptográfico **HMAC-SHA256 (HS256)** através da biblioteca io.jsonwebtoken (JJWT 0.12.6), complementada por:
1. **Controle de Acesso Baseado em Papéis (RBAC):** Uso de enum Role com ROLE_STUDENT e ROLE_ADMIN integrado diretamente com o GrantedAuthority do Spring Security.
2. **Criptografia de Credenciais:** As senhas nunca são trafegadas ou armazenadas em texto plano; são processadas com o algoritmo BCryptPasswordEncoder com salt randômico nativo.
3. **Filtro de Interceptação Personalizado:** Criação do JwtAuthenticationFilter derivado de OncePerRequestFilter, garantindo que o token seja validado uma única vez por ciclo de vida da requisição HTTP.
4. **Tratamento Global de Erros:** GlobalExceptionHandler padronizando respostas de BadCredentialsException (HTTP 401) e validações de DTO (HTTP 400).

## Consequências

### Vantagens
- **Escalabilidade Horizontal:** Como nenhum estado de sessão é salvo no servidor Tomcat, réplicas adicionais da API podem ser levantadas sem necessidade de replicação de memória ou cache distribuído de sessão.
- **Segurança Reforçada:** Tokens possuem tempo de expiração determinado e validação de assinatura imutável.
- **Interoperabilidade Total:** O app Flutter armazena o token de forma segura (Secure Storage) e o injeta no cabeçalho Authorization: Bearer <token> em todas as chamadas.

### Alternativas Consideradas
- *Sessões HTTP baseadas em Cookies (Stateful):* Rejeitada por introduzir acoplamento de servidor, vulnerabilidades de CSRF no navegador e dificuldades de autenticação em aplicativos mobile nativos.
- *OAuth2 com Authorization Server Externo (ex: Keycloak):* Considerada para fases avançadas corporativas, mas desnecessária para o escopo do MVP, onde o controle direto das contas pelo Spring Security oferece menor overhead operacional.