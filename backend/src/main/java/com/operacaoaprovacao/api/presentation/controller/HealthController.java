package com.operacaoaprovacao.api.presentation.controller;

/**
 * =====================================================================================
 * GUIA DE ESTUDO & PREPARAÇÃO PARA ENTREVISTA:
 * 
 * O QUE É ESTE ARQUIVO?
 * É uma classe Controladora (Controller) da camada de Apresentação (Presentation Layer).
 * 
 * PARA QUE SERVE?
 * Serve como um "Health Check" (verificação de saúde). Ele expõe um ponto de acesso (endpoint)
 * HTTP GET para que ferramentas de monitoramento, balanceadores de carga (Load Balancers)
 * e o time de desenvolvimento saibam se a API está online, responsiva e pronta para uso.
 * 
 * POR QUE FOI CRIADO?
 * Em ambientes corporativos (como AWS, Kubernetes ou Azure), sistemas automatizados precisam
 * consultar a cada poucos segundos se o serviço está "vivo" (Liveness/Readiness probe). Se este
 * endpoint responder 200 OK, significa que o servidor Tomcat está ativo.
 * 
 * PERGUNTA DE ENTREVISTA (Nível Júnior/Pleno):
 * "Como você implementa o padrão Health Check numa API REST e qual a diferença entre
 * @Controller e @RestController no Spring Boot?"
 * RESPOSTA:
 * O Health Check é um endpoint leve (como /health ou Spring Boot Actuator) que retorna o estado
 * do serviço. @RestController é uma anotação composta que combina @Controller e @ResponseBody,
 * indicando que todos os métodos retornam diretamente dados serializados (geralmente JSON), e não
 * páginas HTML renderizadas.
 * =====================================================================================
 */

// ==========================================
// EXPLICAÇÃO DE CADA IMPORTAÇÃO DE BIBLIOTECA:
// ==========================================

// Importa nosso envelope padrão de resposta que criamos para garantir que todas as respostas da API tenham a mesma estrutura JSON.
import com.operacaoaprovacao.api.core.dto.ApiResponse;

// Anotações da biblioteca SpringDoc / OpenAPI (Swagger) usadas para documentar a API visualmente.
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

// Classe do Spring Framework que representa a resposta HTTP completa: status code (200, 404, 500), cabeçalhos e o corpo (body).
import org.springframework.http.ResponseEntity;

// Anotações do Spring Web MVC que mapeiam requisições HTTP da internet para os métodos Java desta classe.
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// Classes utilitárias padrão do Java para manipulação de data/hora atual e criação de mapas (chave-valor).
import java.time.LocalDateTime;
import java.util.Map;

/**
 * @RestController: Avisa ao Spring que esta classe é um Bean gerenciado que responde a requisições REST (retornando JSON).
 * @RequestMapping("/api/v1/health"): Define a rota base deste controller. Todas as requisições que começarem com /api/v1/health virão para cá.
 * @Tag: Usada pelo Swagger UI para categorizar estes endpoints na documentação visual com um título e descrição bonita.
 */
@RestController
@RequestMapping("/api/v1/health")
@Tag(name = "Health Check", description = "Monitoramento de saúde e integridade da API")
public class HealthController {

    /**
     * @GetMapping: Diz que este método responde exclusivamente ao verbo HTTP GET (quando alguém consulta a URL no navegador).
     * @Operation: Usada pelo Swagger para descrever o que o endpoint faz.
     * 
     * Retorno: ResponseEntity<ApiResponse<Map<String, Object>>>
     * Significa que retornamos um objeto HTTP padrão (ResponseEntity), encapsulando nosso envelope (ApiResponse),
     * que por sua vez contém um mapa de informações chave/valor em formato JSON.
     */
    @GetMapping
    @Operation(summary = "Verifica se a API está operacional", description = "Retorna o status, versão e horário do servidor.")
    public ResponseEntity<ApiResponse<Map<String, Object>>> checkHealth() {
        
        // Cria um mapa simples e imutável com os dados de diagnóstico da aplicação
        Map<String, Object> status = Map.of(
                "status", "UP",                                 // Informa que a aplicação está de pé
                "service", "operacao-aprovacao-api",            // Nome oficial do serviço
                "version", "1.0.0-SNAPSHOT",                   // Versão atual do software
                "timestamp", LocalDateTime.now().toString()     // Horário exato da resposta no servidor
        );

        // Retorna HTTP Status 200 (OK) embrulhado no ApiResponse padronizado com uma mensagem amigável
        return ResponseEntity.ok(ApiResponse.ok("API operacional e pronta para conexoes.", status));
    }
}