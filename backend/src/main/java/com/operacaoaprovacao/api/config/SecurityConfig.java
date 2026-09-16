package com.operacaoaprovacao.api.config;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É a classe central de configuração de segurança do Spring Security 6.
 * Ela intercepta todas as requisições HTTP que chegam à nossa API antes mesmo de tocarem nos Controllers.
 * 
 * PARA QUE SERVE?
 * Serve para:
 * 1. Definir quais URLs são públicas (livres para qualquer um acessar, como Swagger e Health Check).
 * 2. Definir quais URLs exigem autenticação obrigatória (bloqueando invasores).
 * 3. Configurar a política de sessões como STATELESS (sem guardar estado no servidor, ideal para JWT).
 * 4. Configurar regras de CORS (Cross-Origin Resource Sharing) para que nosso app Flutter possa se comunicar com a API.
 * 5. Definir o algoritmo de criptografia forte de senhas (BCrypt).
 * 
 * POR QUE FOI CRIADO?
 * Sem essa classe, ou a API ficaria 100% desprotegida na internet, ou o Spring Security aplicaria
 * configurações antigas baseadas em sessões de navegador e formulários HTML com cookies,
 * o que quebra a integração com aplicativos mobile e arquiteturas modernas em nuvem.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Pleno/Sênior):
 * "Por que desabilitamos o CSRF (Cross-Site Request Forgery) em uma API REST que usa JWT?"
 * RESPOSTA:
 * O ataque de CSRF explora o fato de o navegador enviar cookies automaticamente em requisições
 * cross-site. Como nossa API é completamente Stateless e não utiliza cookies de sessão (o cliente
 * precisa explicitamente injetar o token JWT no cabeçalho Authorization: Bearer), o ataque de CSRF
 * não se aplica tecnicamente, tornando seguro desabilitar o CSRF e economizando processamento.
 * =====================================================================================
 */

// Anotações que marcam a classe como uma fonte de definições de componentes (Beans) para o Spring.
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

// Anotações para habilitar a segurança web e a segurança em nível de métodos (@PreAuthorize).
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;

// Enum que define a política de criação de sessões (ALWAYS, NEVER, IF_REQUIRED, STATELESS).
import org.springframework.security.config.http.SessionCreationPolicy;

// Classes para criptografia de senhas usando o algoritmo BCrypt com Salt aleatório.
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

// Interface central do Spring Security 6 que representa a cadeia de filtros de segurança (Security Filter Chain).
import org.springframework.security.web.SecurityFilterChain;

// Classes do Spring para configurar o controle de acesso de origens cruzadas (CORS).
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

/**
 * @Configuration: Informa ao Spring que esta classe contém métodos anotados com @Bean.
 * @EnableWebSecurity: Ativa o suporte de segurança web integrado do Spring Security.
 * @EnableMethodSecurity: Permite usar anotações como @PreAuthorize("hasRole('ADMIN')") em cima de métodos específicos no futuro.
 */
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    /**
     * Lista de URLs que qualquer pessoa pode acessar sem precisar estar logada.
     * Inclui o monitoramento de saúde, o console do banco H2 e a documentação do Swagger.
     */
    private static final String[] PUBLIC_MATCHERS = {
            "/api/v1/health/**",
            "/v3/api-docs/**",
            "/swagger-ui/**",
            "/swagger-ui.html",
            "/h2-console/**"
    };

    /**
     * @Bean SecurityFilterChain: É a espinha dorsal da segurança.
     * Toda requisição que chega entra neste pipeline de filtros configurado com a API funcional fluida (Lambdas).
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                // 1. Aplica nossa configuração de CORS para permitir requisições do frontend/mobile
                .cors(cors -> cors.configurationSource(corsConfigurationSource()))
                // 2. Desabilita proteção CSRF porque a autenticação será via token JWT (Stateless)
                .csrf(AbstractHttpConfigurer::disable)
                // 3. Define que o servidor não criará nem guardará sessões HTTP na memória
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                // 4. Define as regras de autorização de rotas
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(PUBLIC_MATCHERS).permitAll()  // Libera as rotas públicas listadas acima
                        .anyRequest().authenticated()                  // Qualquer outra rota do sistema exige login
                )
                // 5. Permite a exibição de frames (necessário para abrir a interface web do console H2 no navegador)
                .headers(headers -> headers.frameOptions(frame -> frame.disable()));

        return http.build();
    }

    /**
     * @Bean PasswordEncoder: Componente singleton que será injetado no serviço de usuários para encriptar senhas.
     * O BCrypt aplica automaticamente um "Salt" aleatório, tornando ataques de dicionário e Rainbow Tables inviáveis.
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * @Bean CorsConfigurationSource: Configura a política de CORS para evitar que navegadores bloqueiem
     * as requisições quando o frontend rodar em uma porta diferente (ex: Flutter em localhost:3000 e API em 8080).
     */
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowedOriginPatterns(List.of("*")); // Permite origens (em produção restringimos ao domínio real)
        config.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"));
        config.setAllowedHeaders(List.of("*"));
        config.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        return source;
    }
}