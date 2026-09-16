# 🔐 Guia de Estudos — Sprint 1: Security & Identity (Autenticação JWT & RBAC)

> **Documento Pessoal de Preparação Técnica para Entrevistas e Domínio do Código**  
> Este documento disseca toda a mecânica de segurança construída na Sprint 1 para você dominar como funciona a autenticação com Spring Security 6 e tokens JWT.

---

## 1. O que é e como funciona o JWT (JSON Web Token)?

O JWT é um padrão aberto (RFC 7519) que define uma maneira compacta e autossuficiente para transmitir informações com segurança entre as partes como um objeto JSON.

### A Estrutura de um Token JWT:
Um token é uma string dividida em 3 partes separadas por pontos (.):
`	ext
AAAAAA.BBBBBB.CCCCCC
(Header).(Payload).(Signature)
`

1. **Header (Cabeçalho):** Informa o algoritmo de assinatura (ex: HS256 = HMAC com SHA-256) e o tipo (JWT).
2. **Payload (Carga Útil):** Contém as **Claims** (afirmações). No nosso sistema, colocamos:
   - sub (Subject): O e-mail do usuário autenticado.
   - iat (Issued At): Momento exato em que o token foi criado.
   - exp (Expiration): Data/hora de expiração (configuramos para 24 horas).
3. **Signature (Assinatura Criptográfica):** É o resultado de calcular:
   `	ext
   HMACSHA256(base64(Header) + "." + base64(Payload), SECRET_KEY)
   `
   *Ponto Crítico de Segurança:* Se qualquer invasor tentar alterar o payload (ex: mudar o e-mail para fingir ser admin), a assinatura não bate com a chave secreta do servidor, e o token é **rejeitado instantaneamente sem precisar consultar o banco de dados!**

---

## 2. O Ciclo de Vida de uma Requisição Segura no Spring Security 6

Quando uma requisição chega em um endpoint protegido (ex: /api/v1/simulados):

`mermaid
sequenceDiagram
    participant App as Flutter / Cliente
    participant Filter as JwtAuthenticationFilter
    participant JwtSvc as JwtService
    participant UDS as CustomUserDetailsService
    participant SecCtx as SecurityContextHolder
    participant Ctrl as Controller REST

    App->>Filter: HTTP Request com Header "Authorization: Bearer <token>"
    Filter->>JwtSvc: extraiUsername(token) e validaAssinatura()
    JwtSvc-->>Filter: Email válido e token não expirado
    Filter->>UDS: loadUserByUsername(email)
    UDS-->>Filter: Objeto Usuario (UserDetails com Role)
    Filter->>SecCtx: Registra UsernamePasswordAuthenticationToken no Contexto
    Filter->>Ctrl: Encaminha requisição autenticada
    Ctrl-->>App: Resposta HTTP 200 com os dados solicitados
`

---

## 3. Raio-X dos Arquivos da Sprint 1

### 3.1 Usuario.java (Entidade + UserDetails)
- **O que faz:** Mapeia a tabela 	b_usuario e implementa a interface UserDetails do Spring Security.
- **Por que implementa UserDetails?**
  O Spring Security não sabe o que é a nossa classe Usuario. Ele só conhece a interface UserDetails. Ao implementá-la, fornecemos diretamente os métodos getUsername() (nosso e-mail), getPassword() (nossa senha encriptada) e getAuthorities() (nossas Roles como ROLE_STUDENT).

### 3.2 JwtService.java
- **O que faz:** Gera a string criptografada do token JWT e faz o parsing reverso para extrair o e-mail e validar se já expirou.
- **Conceito:** Uso de javax.crypto.SecretKey com o algoritmo HMAC-SHA256 gerado a partir de uma chave de 256 bits segura.

### 3.3 JwtAuthenticationFilter.java (Filtro Interceptador)
- **O que faz:** Herda de OncePerRequestFilter. Toda requisição passa por ele antes de chegar no Controller.
- **Fluxo:**
  1. Verifica se existe o cabeçalho Authorization: Bearer .... Se não existir, deixa a requisição passar (o Spring Security vai barrar se o endpoint for privado).
  2. Se existir, extrai o token, valida e insere a identidade no SecurityContextHolder.

### 3.4 AuthService.java e AuthController.java
- **/api/v1/auth/register:** Valida se o e-mail já existe (usuarioRepository.existsByEmail). Se não existir, aplica passwordEncoder.encode(senha) e salva.
- **/api/v1/auth/login:** Delega para o uthenticationManager.authenticate(). Se a senha estiver errada, o Spring lança BadCredentialsException. Se estiver certa, emite o JWT e devolve no AuthResponse.

### 3.5 GlobalExceptionHandler.java
- **O que faz:** Captura exceções antes que elas virem um erro feio (500) com stacktrace exposto.
- Trata BadCredentialsException transformando em HTTP 401 (Unauthorized) com mensagem amigável: *"E-mail ou senha inválidos."*.
- Trata MethodArgumentNotValidException transformando em HTTP 400 (Bad Request) listando os campos inválidos.

---

## 4. Perguntas Reais de Entrevistas Técnicas

### Pergunta 1: "O que é Salt e por que nunca devemos usar MD5 ou SHA-256 puro para salvar senhas?"
**Como responder:**
> "Algoritmos como MD5 ou SHA-256 comum foram projetados para serem rápidos (checksum de arquivos). Hackers usam essa velocidade para testar bilhões de senhas por segundo com Rainbow Tables (tabelas pré-computadas). O BCrypt é uma função de derivação de chave propositalmente lenta (slow by design) que inclui um 'Salt' (sequência aleatória gerada a cada senha). Mesmo que dois usuários tenham a mesma senha '123456', o hash gerado pelo BCrypt será completamente diferente para cada um, inviabilizando ataques de dicionário."

### Pergunta 2: "Qual o papel do SecurityContextHolder no Spring Security?"
**Como responder:**
> "O SecurityContextHolder é o local onde o Spring Security armazena os detalhes da autenticação atual. Por padrão, ele usa uma estratégia baseada em ThreadLocal, o que significa que o usuário autenticado fica acessível para qualquer serviço ou componente daquela mesma thread durante o processamento da requisição HTTP, sem precisar passar o usuário manualmente como parâmetro em todos os métodos."

### Pergunta 3: "Se o token JWT for roubado, o que acontece? Como mitigar esse risco?"
**Como responder:**
> "Em uma arquitetura puramente stateless, quem possuir o token JWT tem acesso até que ele expire. Para mitigar esse risco aplicamos três estratégias: 
> 1. Tráfego estritamente sob HTTPS (TLS) para evitar sniffing na rede;
> 2. Tempo de expiração curto (short-lived access tokens, ex: 15 a 60 minutos) combinado com Refresh Tokens seguros;
> 3. Em casos corporativos de alta criticidade, podemos implementar uma lista de revogação rápida (Token Denylist ou Blocklist) em cache distribuído como Redis."