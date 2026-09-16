package com.operacaoaprovacao.api;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É a classe principal de inicialização (Bootstrap) do Spring Boot. Todo o ecossistema
 * do backend começa a ser carregado a partir deste arquivo.
 * 
 * PARA QUE SERVE?
 * Serve para iniciar o servidor embutido (Tomcat), escanear todas as classes e anotações
 * do projeto (@RestController, @Service, @Repository, @Configuration) e colocá-las
 * dentro do Container de Inversão de Controle (IoC Container) do Spring.
 * 
 * POR QUE FOI CRIADO?
 * Sem essa classe com o método main(), a JVM não saberia como executar o Spring Boot.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Júnior):
 * "O que a anotação @SpringBootApplication faz por debaixo dos panos?"
 * RESPOSTA:
 * Ela é uma anotação composta que junta três anotações essenciais:
 * 1. @Configuration: Permite registrar novos Beans via métodos @Bean.
 * 2. @EnableAutoConfiguration: Carrega configurações automáticas com base nas bibliotecas presentes no pom.xml.
 * 3. @ComponentScan: Faz uma varredura automática no pacote atual e subpacotes para encontrar e instanciar classes com anotações do Spring.
 * =====================================================================================
 */

// Importa a classe do Spring Boot responsável por inicializar a aplicação a partir do método main.
import org.springframework.boot.SpringApplication;
// Anotação principal que ativa toda a mágica e configuração automática do Spring Boot.
import org.springframework.boot.autoconfigure.SpringBootApplication;
// Anotação que ativa a auditoria automática do Spring Data JPA (preenche data de criação e atualização nas entidades).
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

/**
 * @SpringBootApplication: Ponto de partida da aplicação.
 * @EnableJpaAuditing: Ativa os "listeners" do JPA para preencher automaticamente campos como createdAt e updatedAt.
 */
@SpringBootApplication
@EnableJpaAuditing
public class OperacaoAprovacaoApplication {

    /**
     * Método main padrão do Java. É a primeira linha de código que o computador executa.
     * Chama SpringApplication.run() passando a própria classe e os argumentos de linha de comando.
     */
    public static void main(String[] args) {
        SpringApplication.run(OperacaoAprovacaoApplication.class, args);
    }
}