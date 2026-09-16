package com.operacaoaprovacao.api.config;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É a classe de configuração da documentação OpenAPI 3.0 (anteriormente conhecida como Swagger).
 * 
 * PARA QUE SERVE?
 * Serve para gerar uma página web interativa e bonita (/swagger-ui.html) onde qualquer desenvolvedor,
 * recrutador ou cliente pode ver todas as rotas da nossa API, testar os endpoints diretamente
 * pelo navegador e saber exatamente quais parâmetros enviar e receber.
 * 
 * POR QUE FOI CRIADO?
 * Documentar APIs manualmente em PDFs ou planilhas fica desatualizado rapidamente. O SpringDoc
 * lê o próprio código Java e gera a documentação automaticamente em tempo de execução.
 * Configuramos aqui o botão "Authorize" para que o usuário possa colar o token JWT e testar
 * endpoints protegidos direto pelo Swagger.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Júnior/Pleno):
 * "Como você documenta uma API RESTful corporativa e qual a importância do padrão OpenAPI?"
 * RESPOSTA:
 * O padrão OpenAPI é o padrão da indústria (agnóstico a linguagem) para descrever contratos REST.
 * Ele permite gerar documentação viva e interativa (Swagger UI), testes de conformidade de contrato
 * e até gerar SDKs de clientes automaticamente para linguagens como Dart/Flutter, TypeScript e Python.
 * =====================================================================================
 */

// Classes do modelo de dados da especificação OpenAPI 3.0.
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {

    // Identificador único do esquema de autenticação JWT usado na documentação
    private static final String SECURITY_SCHEME_NAME = "Bearer Authentication";

    /**
     * @Bean: Registra a configuração customizada do OpenAPI no ecossistema Spring.
     */
    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                // Define as informações gerais do cabeçalho da documentação visual
                .info(new Info()
                        .title("Operação Aprovação API")
                        .description("Plataforma Corporativa e Agente de Treinamento Pessoal para Concursos Públicos.")
                        .version("1.0.0")
                        .contact(new Contact()
                                .name("Equipe Operação Aprovação")
                                .email("contato@operacaoaprovacao.com.br"))
                        .license(new License()
                                .name("Proprietary")
                                .url("https://operacaoaprovacao.com.br")))
                // Adiciona o cadeado de segurança global na interface do Swagger
                .addSecurityItem(new SecurityRequirement().addList(SECURITY_SCHEME_NAME))
                // Configura o componente de segurança para exigir um token HTTP do tipo "bearer" com formato JWT
                .components(new Components()
                        .addSecuritySchemes(SECURITY_SCHEME_NAME, new SecurityScheme()
                                .name(SECURITY_SCHEME_NAME)
                                .type(SecurityScheme.Type.HTTP)
                                .scheme("bearer")
                                .bearerFormat("JWT")
                                .description("Insira o token JWT no formato: Bearer {seu_token}")));
    }
}