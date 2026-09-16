package com.operacaoaprovacao.api.modules.auth;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.operacaoaprovacao.api.modules.auth.application.dto.LoginRequest;
import com.operacaoaprovacao.api.modules.auth.application.dto.RegisterRequest;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("dev")
class AuthControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("Deve registrar um novo usuario com sucesso e retornar token JWT")
    void shouldRegisterUserSuccessfully() throws Exception {
        RegisterRequest request = RegisterRequest.builder()
                .nome("Candidato Aprovado")
                .email("candidato.aprovado@gmail.com")
                .senha("senhaForte123")
                .build();

        mockMvc.perform(post("/api/v1/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.token").isNotEmpty())
                .andExpect(jsonPath("$.data.email").value("candidato.aprovado@gmail.com"))
                .andExpect(jsonPath("$.data.role").value("ROLE_STUDENT"));
    }

    @Test
    @DisplayName("Deve falhar ao tentar registrar usuario com email duplicado")
    void shouldFailWhenRegisteringDuplicateEmail() throws Exception {
        RegisterRequest request = RegisterRequest.builder()
                .nome("Usuario Duplicado")
                .email("duplicado@gmail.com")
                .senha("senha12345")
                .build();

        // Primeiro registro com sucesso
        mockMvc.perform(post("/api/v1/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated());

        // Segunda tentativa com o mesmo email deve retornar 400
        mockMvc.perform(post("/api/v1/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.success").value(false))
                .andExpect(jsonPath("$.message").value("Ja existe um usuario cadastrado com o e-mail informado."));
    }

    @Test
    @DisplayName("Deve realizar login com credenciais validas e retornar token JWT")
    void shouldLoginSuccessfully() throws Exception {
        RegisterRequest register = RegisterRequest.builder()
                .nome("Usuario Login")
                .email("login.teste@gmail.com")
                .senha("segredo123")
                .build();

        mockMvc.perform(post("/api/v1/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(register)))
                .andExpect(status().isCreated());

        LoginRequest login = LoginRequest.builder()
                .email("login.teste@gmail.com")
                .senha("segredo123")
                .build();

        mockMvc.perform(post("/api/v1/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(login)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.success").value(true))
                .andExpect(jsonPath("$.data.token").isNotEmpty())
                .andExpect(jsonPath("$.data.email").value("login.teste@gmail.com"));
    }

    @Test
    @DisplayName("Deve falhar no login quando a senha estiver incorreta")
    void shouldFailLoginWithIncorrectPassword() throws Exception {
        RegisterRequest register = RegisterRequest.builder()
                .nome("Usuario Senha Errada")
                .email("senha.errada@gmail.com")
                .senha("senhaCorreta123")
                .build();

        mockMvc.perform(post("/api/v1/auth/register")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(register)))
                .andExpect(status().isCreated());

        LoginRequest login = LoginRequest.builder()
                .email("senha.errada@gmail.com")
                .senha("senhaIncorretaErrada")
                .build();

        mockMvc.perform(post("/api/v1/auth/login")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(login)))
                .andExpect(status().isUnauthorized())
                .andExpect(jsonPath("$.success").value(false));
    }
}