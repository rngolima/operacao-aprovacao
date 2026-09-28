package com.operacaoaprovacao.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import org.springframework.data.web.config.EnableSpringDataWebSupport;

/**
 * Ponto de entrada e bootstrap da aplicacao Spring Boot.
 */
@SpringBootApplication
@EnableJpaAuditing
@EnableSpringDataWebSupport(pageSerializationMode = EnableSpringDataWebSupport.PageSerializationMode.VIA_DTO)
public class OperacaoAprovacaoApplication {

    public static void main(String[] args) {
        SpringApplication.run(OperacaoAprovacaoApplication.class, args);
    }
}