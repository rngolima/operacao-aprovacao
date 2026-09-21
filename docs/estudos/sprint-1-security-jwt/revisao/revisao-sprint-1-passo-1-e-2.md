# 🔐 Manual de Engenharia & Mentoria Técnica — Sprint 1: Security & Identity

> **Documento Oficial de Engenharia de Software & Preparação Técnica Sênior**  
> Análise profunda dos fundamentos de código, decisões arquiteturais e simulações de entrevistas técnicas, estruturado sob os Três Pilares da Engenharia Corporativa: **Arquitetura**, **Escalabilidade & Performance** e **Dimensões Técnicas**, complementado com a **Tradução Prática para o Mundo Real**.

---

## 🗺️ Mapa de Execução da Sprint 1: Security & Identity

| Passo | Módulo / Componentes | Ícone | Status | Objetivo de Engenharia |
| :--- | :--- | :--- | :--- | :--- |
| **Passo 1** | `Usuario.java`, `Role.java`, `UsuarioRepository.java` | 🧠 | **Concluído** | Domínio de Identidade, interface `UserDetails` do Spring Security e controle de acesso RBAC. |
| **Passo 2** | `JwtService.java` | 🔐 | **Concluído** | Motor Criptográfico: especificação RFC 7519, algoritmo HMAC-SHA256, geração e validação matemática de tokens. |
| **Passo 3** | `JwtAuthenticationFilter.java` & `CustomUserDetailsService` | 🛡️ | Próximo | Interceptação de rede com `OncePerRequestFilter`, ponte com o banco e `SecurityContextHolder`. |
| **Passo 4** | DTOs (`RegisterRequest`, `LoginRequest`, `AuthResponse`) & `AuthService` | ⚙️ | Planejado | Casos de uso de autenticação, hashing seguro de senhas com **BCrypt + Salt** e validações com Bean Validation. |
| **Passo 5** | `AuthController.java`, `GlobalExceptionHandler` & Testes | 🌐 | Planejado | Camada Web REST (endpoints `/register` e `/login`), interceptador global de erros e suíte com `MockMvc`. |

---

## 🧠 PASSO 1: O Domínio de Identidade & Controle de Acesso (RBAC)

### 1. 📂 Localização dos Arquivos no VS Code:
- 👉 `📁 backend/src/main/java/com/operacaoaprovacao/api/modules/auth/domain/model/` ➔ `🧠 Usuario.java`
- 👉 `📁 backend/src/main/java/com/operacaoaprovacao/api/modules/auth/domain/model/` ➔ `☕ Role.java`
- 👉 `📁 backend/src/main/java/com/operacaoaprovacao/api/modules/auth/domain/repository/` ➔ `🗄️ UsuarioRepository.java`

### 2. O que são esses componentes e por que existem?
- 🧠 **`Usuario.java`:** Entidade de domínio central que representa o concurseiro ou administrador no banco relacional (`tb_usuario`). Implementa a interface `UserDetails` para criar uma ponte transparente com o Spring Security.
- ☕ **`Role.java`:** Enum que define os papéis de acesso do sistema (`ROLE_STUDENT` e `ROLE_ADMIN`) segundo a convenção padrão exigida pelo Spring Security para controle RBAC (Role-Based Access Control).
- 🗄️ **`UsuarioRepository.java`:** Interface Spring Data JPA que disponibiliza consultas otimizadas no banco de dados (`findByEmail` e `existsByEmail`) sem necessidade de SQL manual.

### 3. Fundamentos da Linguagem & Anotações

| Recurso / Anotação | Origem | Papel Técnico Corporativo |
| :--- | :--- | :--- |
| **`@Entity` e `@Table`** | Jakarta Persistence | Mapeia a classe para a tabela relacional física `tb_usuario`. |
| **`@Enumerated(EnumType.STRING)`** | Jakarta Persistence | Grava o nome textual do papel (`'ROLE_STUDENT'`) no banco, evitando corrupção de dados se a ordem do enum mudar. |
| **`@Builder.Default`** | Lombok | Garante que valores padrão (como `role = Role.ROLE_STUDENT` e `ativo = true`) sejam preservados no padrão Builder. |
| **`UserDetails`** | Spring Security | Interface contrato que fornece ao Spring Security os métodos padronizados de autenticação (`getUsername()`, `getPassword()`, `getAuthorities()`, `isEnabled()`). |
| **`SimpleGrantedAuthority`** | Spring Security | Encapsula o nome da role como uma autoridade reconhecida pelo container de segurança. |
| **`JpaRepository<Usuario, Long>`** | Spring Data JPA | Fornece operações CRUD completas e suporte a Derived Queries automáticas com segurança de tipos. |

### 4. Código Fonte Comentado

#### 🧠 `Usuario.java`
```java
package com.operacaoaprovacao.api.modules.auth.domain.model;

import com.operacaoaprovacao.api.core.domain.BaseEntity;
import jakarta.persistence.*;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;

@Entity
@Table(name = "tb_usuario")
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Usuario extends BaseEntity implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 150)
    private String nome;

    @Column(nullable = false, unique = true, length = 150)
    private String email;

    @Column(nullable = false, length = 255)
    private String senha;

    @Enumerated(EnumType.STRING) // Garante a gravacao de 'ROLE_STUDENT' como texto
    @Column(nullable = false, length = 50)
    @Builder.Default
    private Role role = Role.ROLE_STUDENT;

    @Column(nullable = false)
    @Builder.Default
    private boolean ativo = true;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(this.role.name()));
    }

    @Override
    public String getPassword() {
        return this.senha;
    }

    @Override
    public String getUsername() {
        return this.email; // O e-mail e o login oficial
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return this.ativo;
    }
}
```

### 5. Análise sob os Três Pilares Corporativos

#### 🏛️ Pilar 1: Arquitetura (DDD & Coesão)
- **Módulo Coeso (`modules/auth`):** Todas as classes de identidade residem em um pacote autocontido. Se for necessário migrar para um servidor OAuth2 externo (como Keycloak), a regra de negócio central permanece isolada.
- **Auditoria Transversal Automática:** Por estender `BaseEntity`, a entidade herda auditoria sem duplicação de código.

#### ⚡ Pilar 2: Escalabilidade & Performance
- **Índice Único no E-mail:** A restrição `unique = true` no PostgreSQL gera um índice B-Tree, permitindo que a autenticação encontre o usuário em tempo logarítmico O(log n).
- **Derived Query `existsByEmail`:** Gera um `SELECT 1` otimizado para validar se um e-mail já existe durante o cadastro, sem instanciar entidades pesadas na memória.

#### 🛡️ Pilar 3: Dimensões Técnicas & Segurança
- **Controle Fino de Acesso:** O método `isEnabled()` consome a coluna booleana `ativo`.
- **Prevenção de Corrupção via `EnumType.STRING`:** Elimina a fragilidade do padrão `EnumType.ORDINAL` que grava índices inteiros no banco de dados.

### 💡 O QUE ISSO SIGNIFICA NA PRÁTICA NO MUNDO REAL?
> 🏢 **Caso 1: O Aluno que Pausou a Assinatura**  
> Se um concurseiro decidir pausar os estudos temporariamente, a administração não apaga a linha dele no banco de dados (o que destruiria o histórico de milhares de questões e simulados resolvidos). Basta alterar a coluna `ativo` para `false`. Automaticamente, o Spring Security bloqueia qualquer tentativa de login via `isEnabled()`, mantendo o histórico de progresso 100% preservado para quando ele reativar o plano.

---

### 🎯 Simulação de Entrevista Técnica (Passo 1):
> **Pergunta do Tech Lead:**  
> *"Na classe `Usuario`, por que fizemos questão de anotar o atributo `role` com `@Enumerated(EnumType.STRING)` em vez de deixar o padrão do JPA que é `EnumType.ORDINAL`? E por que a interface `UserDetails` foi implementada diretamente na nossa entidade de domínio `Usuario`?"*
> 
> **Resposta Técnica Modelo:**  
> *"Adotamos `EnumType.STRING` porque o padrão `EnumType.ORDINAL` grava no banco de dados apenas o índice posicional numérico do enum (`0`, `1`, etc.). Se novos papéis forem inseridos no futuro em posições intermediárias do código Java, todos os registros antigos do banco sofreriam corrupção imediata de permissões. Já a implementação da interface `UserDetails` funciona como um contrato/ponte para que o Spring Security consiga ler as credenciais e authorities de forma transparente e agnóstica, sem necessidade de conversores adicionais na camada de persistência."*

---

## 🔐 PASSO 2: O Motor Criptográfico (`JwtService.java`)

### 1. 📂 Localização do Arquivo no VS Code:
- 👉 `📁 backend/src/main/java/com/operacaoaprovacao/api/modules/auth/application/service/` ➔ `⚙️ JwtService.java`

### 2. O que é este componente e por que ele existe?
O `JwtService` é a central de inteligência criptográfica da aplicação. Ele é responsável por emitir tokens JWT (JSON Web Tokens) assinados digitalmente após o login bem-sucedido e validar matematicamente as credenciais em cada requisição subsequente.

### 3. Fundamentos da Linguagem & Anotações

| Recurso / Classe | Origem | Papel Técnico Corporativo |
| :--- | :--- | :--- |
| **`@Service`** | Spring Framework | Registra a classe como componente de serviço injetável no ecossistema Spring. |
| **`@Value`** | Spring Framework | Injeta parâmetros do `application.yml` (chave secreta e tempo de expiração) com valores de contingência (*fallback*). |
| **`SecretKey`** | `javax.crypto` | Interface padrão da JCA (Java Cryptography Architecture) para chaves simétricas. |
| **`Keys.hmacShaKeyFor`** | JJWT (`io.jsonwebtoken`) | Cria a chave criptográfica segura a partir dos bytes da chave secreta configurada. |
| **`Jwts.builder()`** | JJWT (`io.jsonwebtoken`) | Construtor fluente para compor o Header, Payload (Claims), data de emissão, validade e assinatura digital. |
| **`Jwts.parser()`** | JJWT (`io.jsonwebtoken`) | Motor de decodificação e conferência que valida a integridade matemática da assinatura do token. |

### 4. Código Fonte Comentado

#### ⚙️ `JwtService.java`
```java
package com.operacaoaprovacao.api.modules.auth.application.service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.function.Function;

@Service
public class JwtService {

    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")
    private String secretKey;

    @Value("${jwt.expiration-hours:24}")
    private long expirationHours;

    public String extractUsername(String token) {
        return extractClaim(token, Claims::getSubject);
    }

    public <T> T extractClaim(String token, Function<Claims, T> claimsResolver) {
        final Claims claims = extractAllClaims(token);
        return claimsResolver.apply(claims);
    }

    public String generateToken(UserDetails userDetails) {
        return generateToken(new HashMap<>(), userDetails);
    }

    public String generateToken(Map<String, Object> extraClaims, UserDetails userDetails) {
        long expirationMillis = expirationHours * 60 * 60 * 1000;
        return Jwts.builder()
                .claims(extraClaims)
                .subject(userDetails.getUsername())
                .issuedAt(new Date(System.currentTimeMillis()))
                .expiration(new Date(System.currentTimeMillis() + expirationMillis))
                .signWith(getSigningKey())
                .compact();
    }

    public boolean isTokenValid(String token, UserDetails userDetails) {
        final String username = extractUsername(token);
        return (username.equals(userDetails.getUsername())) && !isTokenExpired(token);
    }

    private boolean isTokenExpired(String token) {
        return extractExpiration(token).before(new Date());
    }

    private Date extractExpiration(String token) {
        return extractClaim(token, Claims::getExpiration);
    }

    private Claims extractAllClaims(String token) {
        return Jwts.parser()
                .verifyWith(getSigningKey())
                .build()
                .parseSignedClaims(token)
                .getPayload();
    }

    private SecretKey getSigningKey() {
        byte[] keyBytes = secretKey.getBytes(StandardCharsets.UTF_8);
        return Keys.hmacShaKeyFor(keyBytes);
    }
}
```

### 5. Análise sob os Três Pilares Corporativos

#### 🏛️ Pilar 1: Arquitetura (Single Responsibility Principle)
- **Isolamento de Domínio:** O `JwtService` atua como componente puro de infraestrutura/aplicação, desacoplando completamente a geração de tokens dos Controllers e Filtros de Rede.

#### ⚡ Pilar 2: Escalabilidade & Performance
- **Validação In-Memory (Zero Database I/O):** A verificação de validade de um token é uma operação de cálculo criptográfico que consome apenas ciclos de CPU e memória RAM local, eliminando qualquer consulta ao banco PostgreSQL para autenticar requisições de leitura de simulados.

#### 🛡️ Pilar 3: Dimensões Técnicas & Segurança
- **Entropia Criptográfica de 256 bits:** A chave secreta possui entropia suficiente para atender aos padrões rigorosos do algoritmo HMAC-SHA256, inviabilizando ataques de força bruta.
- **Validade Temporal Rígida:** Os tokens possuem vida útil controlada (24 horas), mitigando riscos de reutilização indevida.

### 💡 O QUE ISSO SIGNIFICA NA PRÁTICA NO MUNDO REAL?
> 🎟️ **Caso 1: O "Crachá do Prédio Corporativo"**  
> O JWT funciona como um crachá plastificado com holograma oficial. O segurança na catraca (o servidor) só precisa bater o olho no holograma (a Assinatura) e na data de validade (Expiração). Ele não precisa ligar para o RH (o Banco de Dados) toda vez que a pessoa entra ou sai. Isso permite que 100.000 pessoas passem pelas catracas ao mesmo tempo sem formar fila.
> 
> 🚨 **Caso 2: A Tentativa de Fraude de Perfil**  
> Se um estudante mal-intencionado alterar seu perfil no token de `ROLE_STUDENT` para `ROLE_ADMIN` no celular, a conta matemática da assinatura digital é quebrada na hora ao chegar no backend. O sistema barra o acesso no mesmo milissegundo, garantindo segurança total sem onerar o banco de dados.

---

### 🎯 Simulação de Entrevista Técnica (Passo 2):
> **Pergunta do Tech Lead:**  
> *"Na nossa arquitetura, por que a validação de um token JWT no `JwtService` é muito mais escalável para suportar milhares de concurseiros simultâneos do que o modelo tradicional de sessão com cookies em banco de dados? E o que aconteceria se um usuário mal-intencionado alterasse o payload do token para tentar virar administrador (`ROLE_ADMIN`)?"*
> 
> **Resposta Técnica Modelo:**  
> *"A validação com JWT escala infinitamente porque é puramente stateless e matemática. No modelo tradicional de cookies, cada requisição exige uma consulta de I/O em banco de dados ou cluster de sessão distribuída para verificar o ID da sessão, criando um funil de garrafa com alta concorrência. Com o JWT, a verificação da assinatura HMAC-SHA256 e da expiração ocorre na memória RAM e registradores da CPU em nanossegundos, sem tocar no banco de dados.  
> E caso um invasor altere o payload do token para forjar a role `ROLE_ADMIN`, a assinatura criptográfica não coincidirá com a chave secreta privada do servidor. O parser do JJWT lançará uma exceção de integridade imediata, rejeitando a requisição sem qualquer risco de vazamento ou consumo indevido de recursos."*
