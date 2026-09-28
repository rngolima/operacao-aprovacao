# 🏛️ Manual de Engenharia & Mentoria Técnica — Sprint 5: Frontend Flutter (Mobile & Web)

> **Documento Oficial de Engenharia de Software & Arquitetura Frontend Multiplataforma**  
> Análise profunda dos fundamentos de UI/UX tático, decisões de arquitetura multiplataforma em Flutter 3.47 LTS, estruturado sob os Três Pilares da Engenharia Corporativa: **Arquitetura**, **Escalabilidade & Performance** e **Dimensões Técnicas**, complementado com a **Tradução Prática para o Mundo Real**.  
> Governança baseada nas **Cláusulas 8, 9 e 10 das Regras Absolutas**: Consolidação dos 5 Pilares Fundamentais, aprofundamento rigoroso nos níveis **Júnior** e **Pleno**, mantendo a visão do **Sênior**.

---

## 🗺️ Mapa de Execução da Sprint 5: Frontend Flutter (Mobile & Web)

| Passo | Módulo / Camada | Ícone | Status | Objetivo de Engenharia |
| :--- | :--- | :---: | :---: | :--- |
| **Passo 1** | **Setup Flutter & Design System Tático** | 🎨 | **Concluído** | Instalação do Flutter SDK 3.47, arquitetura Feature-First, Design Tokens (`AppColors`, `AppTypography`, `AppSpacing`, tema Dark Operacional) e componentes atômicos (`TacticalCard`, `CebraspeButton`, `TimerBadge`, `QuestionNavigatorGrid`). |
| **Passo 2** | **Rede, Segurança & Autenticação** | 🔐 | Planejado | Cliente HTTP Dio com interceptor JWT, `flutter_secure_storage`, State Management e telas sóbrias de Login e Cadastro. |
| **Passo 3** | **Banco de Questões & Filtros Dinâmicos** | 📝 | Planejado | Catálogo Cebraspe com árvore de disciplinas da PC-PE, paginação infinita e modo de treino rápido. |
| **Passo 4** | **Cockpit do Simulado Cebraspe (A Joia da Coroa)** | ⏱️ | Planejado | Integração da tela do Cockpit com os endpoints reais da API backend (`POST /simulados/iniciar`, auto-save em tempo real e submissão final). |
| **Passo 5** | **Dashboard, Code Review & Auditoria nos 5 Eixos** | 🏆 | Planejado | Gráficos de telemetria e taxa de acerto por disciplina, Code Review formal (Cláusula 8), Raio-X (Cláusula 10) e sincronização no GitHub. |

---

## 🎨 PASSO 1: Setup do Projeto Flutter & Design System Tático

---

### 🗺️ FASE 1: O MAPA E LOCALIZAÇÃO NO VS CODE

No Passo 1 da Sprint 5, criamos o ecossistema frontend oficial da **Operação Aprovação** utilizando o framework **Flutter 3.47 LTS (Dart 3.13)**.

Para erradicar qualquer risco de o aplicativo parecer um "template amador gerado por inteligência artificial" (gradientes roxos sem contexto, botões gigantes padrão Material 2 ou cards sem ritmo visual), iniciamos o projeto pela criação do **Design System Tático Operacional**. Esse design system é inspirado nas interfaces de alta precisão e estética sóbria da indústria de tecnologia moderna (*Linear, Raycast, Nubank*) e na solenidade visual da **Polícia Civil de Pernambuco (PC-PE)**.

Construímos a fundação de design tokens, componentes atômicos desacoplados e a tela real do **Cockpit Cebraspe**, validando a compilação com zero warnings no `flutter analyze` e passando em 100% dos testes de widget no `flutter test`!

#### 📂 Abra agora no seu VS Code os arquivos deste passo:
- 👉 `📁 frontend/` ➔ `📄 pubspec.yaml` (Configurações do SDK e dependência `google_fonts: ^6.2.1`)
- 👉 `📁 frontend/lib/core/theme/` ➔ `📄 app_colors.dart` (Design tokens de cores da paleta tática)
- 👉 `📁 frontend/lib/core/theme/` ➔ `📄 app_typography.dart` (Inter para leitura ergonômica e JetBrains Mono para cronômetro)
- 👉 `📁 frontend/lib/core/theme/` ➔ `📄 app_spacing.dart` (Escala estrita de 4/8pt e raios de borda)
- 👉 `📁 frontend/lib/core/theme/` ➔ `📄 app_theme.dart` (ThemeData oficial Dark Operacional)
- 👉 `📁 frontend/lib/core/widgets/` ➔ `📄 tactical_card.dart` (Card base com contorno sutil de 1px)
- 👉 `📁 frontend/lib/core/widgets/` ➔ `📄 timer_badge.dart` (Badge de cronômetro com algarismos monoespaçados)
- 👉 `📁 frontend/lib/core/widgets/` ➔ `📄 cebraspe_button.dart` (Botões táticos `[ CERTO ]`, `[ ERRADO ]` e `[ Deixar em Branco ]` com feedback tátil)
- 👉 `📁 frontend/lib/core/widgets/` ➔ `📄 question_navigator_grid.dart` (Grade inferior de navegação rápida de 1 a 60)
- 👉 `📁 frontend/lib/features/simulado/presentation/screens/` ➔ `📄 simulado_cockpit_screen.dart` (Tela Cockpit do Simulado interativa)
- 👉 `📁 frontend/lib/` ➔ `📄 main.dart` (Entrypoint configurado)
- 👉 `📁 frontend/test/` ➔ `📄 widget_test.dart` (Teste automatizado de renderização da tela)

#### 📊 Diagrama da Arquitetura do Design System:
```mermaid
flowchart TD
    Tokens[Design Tokens Fundamentais] --> Colors[AppColors: Deep Slate #0B0F19 / Navy #1E3A8A / Esmeralda #059669]
    Tokens --> Typography[AppTypography: Inter Leitura / JetBrains Mono Tabular]
    Tokens --> Spacing[AppSpacing: Escala 4/8pt e Raios Sutis]
    Colors --> ThemeData[AppTheme.darkTheme]
    Typography --> ThemeData
    Spacing --> ThemeData
    ThemeData --> Widgets[Componentes Atômicos Desacoplados]
    Widgets --> TacticalCard[TacticalCard]
    Widgets --> TimerBadge[TimerBadge]
    Widgets --> CebraspeBtn[CebraspeButton]
    Widgets --> QuestionGrid[QuestionNavigatorGrid]
    Widgets --> Screen[SimuladoCockpitScreen - Experiencia Cebraspe]
```

---

#### 💡 O QUE ESTE PASSO SIGNIFICA NA PRÁTICA NO MUNDO REAL?

Imagine a experiência de um concurseiro prestando um simulado real da PC-PE:
> O aluno precisa passar **4 horas e 30 minutos** ininterruptas focado na tela do smartphone, tablet ou computador, lendo enunciados extensos de Direito Penal, Processo Penal e Língua Portuguesa.  
> Se o aplicativo tiver fundo branco ofuscante ou fontes inadequadas, em 30 minutos o candidato sofre de dor de cabeça, lacrimejamento e fadiga visual.  
> Se o aplicativo tiver cores berrantes, cards flutuantes sem alinhamento ou números que ficam "dançando" na tela a cada segundo do cronômetro, a concentração do candidato é arruinada.

#### 🛡️ Como a Operação Aprovação Resolve Isso no Mundo Real?
> 1. **Fundo Deep Slate (`#0B0F19`):** Não é um preto chapado amador; é um carvão profundo com matiz azulado que reduz a emissão de luz azul e descansa os olhos durante longas jornadas de estudo.
> 2. **Tipografia com Altura de Linha Ergonômica (`height: 1.6`):** Espaçamento entre linhas calibrado para permitir leitura fluida de artigos de lei e jurisprudência dos Tribunais Superiores.
> 3. **Cronômetro Tabular Monoespaçado:** Todos os algarismos possuem exatamente a mesma largura física na tela. O número `1` ocupa o mesmo espaço que o número `8`, garantindo que o cronômetro não fique tremendo a cada segundo.
> 4. **Botões de Marcação Tática com Feedback Tátil (Haptic Feedback):** O aluno sente uma leve vibração no dedo ao marcar `[ CERTO ]` ou `[ ERRADO ]`, reproduzindo a segurança tátil do canetaço no cartão de respostas da prova real!

---

### 💻 FASE 2: FUNDAMENTOS DA LINGUAGEM & OS 5 PILARES FUNDAMENTAIS

#### 🏛️ PILAR 1: BASE SÓLIDA DE DART & FLUTTER MODERNO (DART 3.13 / FLUTTER 3.47)

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **O que são Design Tokens e por que não usar cores hardcoded?**
   - **O erro clássico do Júnior:** Colocar `Colors.blue` ou `Color(0xFF1E3A8A)` espalhados diretamente nos widgets da tela.
   - Se o cliente ou o designer quiser ajustar o tom do azul da polícia, o desenvolvedor precisa abrir 50 arquivos para alterar um por um!
   - **A solução profissional:** Centralizamos tudo em uma classe abstrata `AppColors`. Se o tema mudar, alteramos em uma única linha e todo o aplicativo reflete a nova identidade instantaneamente.
2. **Fontes Tabulares vs Proporcionais:**
   - Em fontes comuns (proporcionais), a letra `I` é estreita e a letra `W` é larga. Da mesma forma, o número `1` é mais fino que o número `0`.
   - Ao criar um cronômetro regressivo com fonte comum, quando o tempo muda de `03:42:19` para `03:42:18`, a caixa de texto muda de largura e "empurra" os outros elementos da tela!
   - Usando a fonte monoespaçada **JetBrains Mono**, cada caractere possui largura idêntica, proporcionando estabilidade visual absoluta.

##### 🟡 Elevando para o NÍVEL PLENO:
1. **Migração Semântica do Flutter 3.47 (`withValues` vs `withOpacity`):**
   - No Flutter 3.47, o método tradicional `color.withOpacity(0.3)` foi descontinuado devido a perda de precisão de ponto flutuante em formatos sRGB e Wide-Gamut.
   - Adotamos a nova API recomendada pelo time de engenharia da Google: `color.withValues(alpha: 0.3)`, garantindo conformidade estrita e 0 warnings no analisador.
2. **Desacoplamento de Widgets Atômicos:**
   - Componentes como `TacticalCard` e `TimerBadge` não dependem de nenhuma regra de negócio de simulado ou questão. Eles são **widgets puros de apresentação**, reutilizáveis em qualquer módulo do app (Login, Perfil, Ranking, Extrato financeiro).

---

### 🍃 PILAR 2: ARQUITETURA DE WIDGETS & CICLO DE VIDA DO FLUTTER

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **`StatelessWidget` vs `StatefulWidget`:**
   - Widgets que apenas exibem dados sem mudar internamente (como `TacticalCard` e `TimerBadge`) herdam de `StatelessWidget`, economizando memória e ciclos de renderização da GPU.
   - A tela do Cockpit (`SimuladoCockpitScreen`) é um `StatefulWidget` porque gerencia o cronômetro regressivo e a questão ativa que o usuário está respondendo.
2. **Gerenciamento de Recursos com `Timer.periodic` e `dispose()`:**
   - Quando o cronômetro do simulado inicia, um `Timer.periodic(Duration(seconds: 1))` fica rodando em background.
   - Se o usuário sair da tela e não cancelarmos esse timer, ele continuará rodando na memória para sempre (**Memory Leak**).
   - Implementamos a limpeza obrigatória no método `dispose()`: `_timer?.cancel()`, liberando os recursos imediatamente.

##### 🟡 Elevando para o NÍVEL PLENO:
1. **Rebuilds Inteligentes e Árvore de Elementos:**
   - Em vez de chamar `setState()` no app inteiro, o estado foi confinado para atualizar apenas a contagem do tempo e a marcação ativa, evitando que o Flutter redesenhe listas inteiras de itens desnecessariamente.

---

### 🧪 PILAR 4: TESTES DE WIDGET & QA FRONTEND

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **O que é um Widget Test no Flutter (`testWidgets`)?**
   - O Flutter permite testar telas inteiras sem precisar abrir um emulador Android ou celular físico lento.
   - O `WidgetTester` inicializa a árvore de renderização na memória RAM em menos de 2 segundos:
     ```dart
     await tester.pumpWidget(const OperacaoAprovacaoApp());
     await tester.pumpAndSettle();
     ```
   - O método `expect(find.text('[ CERTO ]'), findsOneWidget)` comprova matematicamente que o botão existe na tela e está renderizado para o candidato.

---

### 🏛️ FASE 3: OS TRÊS PILARES DA ENGENHARIA CORPORATIVA

#### 1. Arquitetura Corporativa & Padrões
- **Design System First:** Separação estrita entre Tokens de Design, Componentes Atômicos de UI e Telas de Funcionalidades (*Feature-First*).
- **Sem Template de IA:** Identidade visual proprietária com paleta operacional tática de alto contraste e ergonomia de leitura prolongada.

#### 2. Escalabilidade & Performance Multiplataforma
- **Multiplataforma Nativo:** O mesmo código fonte compila para **Android (APK/AAB), iOS (IPA) e Web (Wasm/HTML)** sem alterar uma única linha de Dart.
- **Renderização a 60/120 FPS:** Uso de `AnimatedContainer` leve para transições de clique sem travamentos na interface.

#### 3. Dimensões Técnicas & Acessibilidade
- **Haptic Feedback:** Integração com os motores de vibração do iOS e Android (`HapticFeedback.lightImpact()`), oferecendo feedback auditivo/tátil discreto.
- **Tipografia Escalonável:** Respeito às diretrizes de leitura para longas sessões de avaliação.

---

### 📊 RÉGUA DE MATURIDADE: DA GAMBIARRA AO SÊNIOR

| Dimensão | 🔴 Nível Estagiário / Júnior Iniciante | 🟡 Nível Pleno Corporativo | 🟢 Nível Sênior / Tech Lead (O que Implementamos) |
| :--- | :--- | :--- | :--- |
| **Estética Visual** | Telas azuis padrão Material com cara de IA genérica e gradientes roxos sem contexto. | Cria uma tela bonita, mas com cores hardcoded espalhadas por todo o código. | Desenvolve um Design System Tático com Design Tokens, tipografia ergonômica e paleta Deep Slate Operacional. |
| **Ergonomia do Cronômetro** | Usa texto comum que fica tremendo e empurrando o layout a cada segundo. | Usa timer sem cancelar no `dispose()`, causando vazamento de memória (Memory Leak). | Emprega tipografia monoespaçada tabular (JetBrains Mono) e cancela o timer rigorosamente no ciclo de vida. |
| **Garantia de Qualidade** | Testa apenas clicando no celular manualmente. | Roda o app e vê se a tela abre sem erros de overflow. | Validação estática com `flutter analyze` (Zero issues) e testes automatizados de widget (`flutter test`). |

---

### 🧪 Placar de Validação
- **Flutter Analyzer:** `Analyzing frontend... No issues found! (ran in 39.2s)`
- **Widget Tests:** `All tests passed! (00:02 +1)`
- **Resultado Geral:** **100% SUCCESS**

---

### 🎯 FASE 5: SIMULAÇÃO DE ENTREVISTA TÉCNICA E FIXAÇÃO

Chegamos à simulação de entrevista técnica do Passo 1 da Sprint 5!

> 🎤 **Pergunta do Tech Lead / Entrevistador:**  
> *"Por que ao desenvolver um aplicativo de provas e simulados de alta duração (como um concurso policial de 4h30min), a adoção de um Design System prévio com tokens de tipografia tabular monoespaçada e ergonomia de contraste é um requisito arquitetural crítico, e não mero capricho estético?"*

### 💡 Resposta Modelo Sênior:
*"Em aplicações de alta concentração e longa duração, o design é uma extensão da performance cognitiva do usuário. O uso de tokens centralizados assegura consistência visual e manutenibilidade. A escolha de uma paleta Dark profunda como Deep Slate (`#0B0F19`) atenua a emissão de luz azul e a fadiga ocular sem gerar o contraste agressivo do preto absoluto. Já o uso de tipografia monoespaçada tabular (como JetBrains Mono) nos cronômetros é indispensável para evitar o efeito de 'layout shift' (trepidação visual a cada segundo), mantendo os algarismos em largura física constante e preservando a estabilidade da interface e o foco absoluto do candidato."*

---
---

# 🛡️ CAPÍTULO 2 — PASSO 2: REDE CORPORATIVA, PERSISTÊNCIA CRIPTOGRAFADA E IDENTIDADE VISUAL OFICIAL

### 🗺️ Visão Panorâmica do Passo 2
No Passo 2 da Sprint 5, estabelecemos a infraestrutura de comunicação remota entre o Flutter e o ecossistema Spring Boot, implementamos a persistência de credenciais JWT com criptografia no hardware do dispositivo e materializamos em código a **Identidade Visual Aprovada da Operação Aprovação** (Coruja Minimalista Geométrica com Capelo e detalhes cirúrgicos de cores) em harmonia com o **Co-Branding Dinâmico da Polícia Civil de Pernambuco (PC-PE)**.

---

### 🌐 PILAR 1: CAMADA DE REDE CORPORATIVA (DIO CLIENT & INTERCEPTORS)

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **Por que NÃO usamos o pacote `http` padrão do Flutter?**
   - O pacote `http` nativo é básico demais para sistemas corporativos: ele não suporta interceptores globais, não cancela requisições pendentes se o usuário trocar de tela e exige configuração manual de headers em cada chamada.
   - O **Dio** é o cliente HTTP padrão da indústria corporativa Flutter: oferece suporte nativo a `Interceptors`, `BaseOptions`, `Timeouts` globais e transformações de payload automáticas.
2. **O que é um Interceptor?**
   - É um "pedágio" ou filtro pelo qual **toda requisição e resposta passam antes de chegar ao destino**.
   - No `AuthInterceptor`, interceptamos a requisição antes do envio (`onRequest`): se a rota for protegida e houver um token JWT salvo, ele injeta automaticamente o cabeçalho:
     ```dart
     options.headers['Authorization'] = 'Bearer $token';
     ```
   - O desenvolvedor que cria uma nova tela ou repositório não precisa se preocupar em lembrar de colocar o token manualmente em nenhum lugar!
3. **Tratamento de 401 Unauthorized:**
   - Se o backend retornar HTTP 401 (token expirado ou revogado), o `onError` do interceptor intercepta a resposta, remove o token do armazenamento seguro e força a interface a retornar para a tela de login com segurança.

##### 🟡 Elevando para o NÍVEL PLENO:
1. **Mapeamento Tipado de Falhas com `ApiException`:**
   - Erros brutos de socket ou exceptions de framework (`DioException`) nunca devem vazar para a camada de apresentação.
   - Criamos a classe `ApiException.fromDioException()`, convertendo `DioExceptionType.connectionTimeout` em mensagens amigáveis ("Tempo limite esgotado...") e mapeando os códigos de status 400, 401, 403, 404, 422 e 500 para mensagens acionáveis em português.

---

### 🔐 PILAR 2: PERSISTÊNCIA SEGURA DE CREDENCIAIS (KEYSTORE & KEYCHAIN)

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **Por que NUNCA salvar tokens JWT no `SharedPreferences`?**
   - No Android, o `SharedPreferences` comum salva arquivos XML em texto puro no sistema de arquivos. Qualquer aparelho com root ou backup extraído expõe o token JWT de imediato.
   - O mesmo vale para `NSUserDefaults` no iOS.
2. **Como o `flutter_secure_storage` opera por baixo dos panos:**
   - No **Android**: Utiliza o **Android Keystore**, criptografando os dados sensíveis via AES-GCM com chaves geradas em hardware dedicado.
   - No **iOS**: Utiliza o **Keychain Services**, protegido pelo Secure Enclave da Apple com política `first_unlock`.
   - Na **Web**: Criptografa os dados antes de gravar no storage, prevenindo ataques triviais de XSS.

---

### 🎨 PILAR 3: VETORIZAÇÃO PURA DA IDENTIDADE VISUAL COM `CustomPainter`

##### 🟢 Destrinchando a fundo para o NÍVEL JÚNIOR:
1. **Por que renderizar a Logo e o Distintivo com `CustomPainter` em vez de imagens PNG?**
   - Imagens rasterizadas (PNG/JPG) sofrem com problemas clássicos de apps:
     - Ficam borradas/pixeladas em telas Retina/4K ou ficam pesadas demais aumentando o tamanho do APK;
     - Podem falhar se o arquivo estático não for encontrado ou corromper;
     - Não respondem dinamicamente a mudanças de tema e escala de forma matemática.
   - Ao desenhar via `CustomPainter` (`TacticalOwlLogo` e `PcpeBadge`), as formas geométricas são equações matemáticas renderizadas diretamente na GPU do aparelho via Skia/Impeller, garantindo **nitidez infinita a 120 FPS com peso de apenas alguns kilobytes**.

##### 🟡 Elevando para o NÍVEL PLENO:
1. **Fidelidade Visual das Cores Aprovadas pelo Fundador:**
   - **Capelo de Formatura:** Azul Cobalto Vibrante (`#2563EB`) com o **pingente em Branco Puro** (`#FFFFFF`).
   - **Óculos Táticos:** Laranja Quente Original (`#F97316`).
   - **Olhos:** Branco Puro com pupilas escuras focadas.
   - **Peito / Plumagem:** Branco Puro central com a **pontinha final em Laranja Quente**.
   - **Asas e Contorno:** Azul Marinho Profundo (`#1E3A8A`).

---

### 🏛️ PILAR 4: ARQUITETURA FEATURE-FIRST E DESACOPLAMENTO LIMPO

```text
lib/features/auth/
├── data/
│   ├── datasources/auth_remote_data_source.dart   # Consome o ApiClient
│   ├── models/login_request.dart                  # DTOs com toJson/fromJson
│   ├── models/login_response.dart                 # Espelha o AuthResponse do Spring Boot
│   ├── models/register_request.dart
│   └── repositories/auth_repository_impl.dart     # Implementa o contrato e gerencia o SecureStorage
├── domain/
│   └── repositories/auth_repository.dart          # Interface pura sem dependencias externas
└── presentation/
    ├── controllers/auth_controller.dart           # ChangeNotifier com estados operacionais
    └── screens/
        ├── login_screen.dart                      # Tela oficial com Co-Branding PC-PE
        └── register_screen.dart                   # Tela de cadastro com seletor de cargo
```

- **Independência de Framework:** A interface `AuthRepository` no pacote `domain` não sabe se os dados vêm de HTTP, GraphQL ou gRPC. Se amanhã o backend mudar para gRPC, nenhuma linha do `AuthController` ou da `LoginScreen` precisa ser alterada.

---

### 📊 RÉGUA DE MATURIDADE: PASSO 2 (REDE, SEGURANÇA E AUTH)

| Dimensão | 🔴 Nível Estagiário / Júnior Iniciante | 🟡 Nível Pleno Corporativo | 🟢 Nível Sênior / Tech Lead (O que Implementamos) |
| :--- | :--- | :--- | :--- |
| **Cliente de Rede** | Faz chamadas com `http.get()` avulsas espalhadas no meio dos widgets. | Cria um service com `http`, mas injeta o token manualmente em cada requisição. | Implementa um `ApiClient` corporativo com `Dio`, timeouts globais e `AuthInterceptor` que injeta o token automaticamente e trata 401. |
| **Armazenamento de JWT** | Salva o token JWT em `SharedPreferences` em texto puro vulnerável a invasões. | Usa `flutter_secure_storage` sem tratamento de exceção ou sincronização de logout. | Encapsula o `SecureStorageService` com suporte a Android Keystore e iOS Keychain, limpando a sessão no 401. |
| **Mapeamento de Erros** | Mostra `SocketException` ou erro em inglês na tela para o usuário. | Trata com `try/catch` genérico exibindo "Erro ao carregar". | Traduz erros HTTP (400, 401, 403, 422, 500) para mensagens em português táticas através de `ApiException`. |
| **Design da Marca** | Coloca uma imagem PNG pixelada no topo ou ícone genérico de IA. | Usa um ícone Material padrão (`Icons.lock`). | Desenvolve a identidade oficial em vetor de precisão com `CustomPainter` (Coruja com pingente branco, óculos laranja e peito branco) e co-branding com PC-PE. |

---

### 🧪 Placar de Validação do Passo 2
- **Flutter Analyzer:** `Analyzing frontend... No issues found! (ran in 34.3s)`
- **Testes Automatizados:** `All tests passed! (00:05 +11)`
  - `api_exception_test.dart`: 4 testes unitários passando.
  - `auth_models_test.dart`: 4 testes unitários de serialização/deserialização passando.
  - `login_screen_test.dart`: 2 testes de widget cobrindo validação e renderização da marca oficial passando.
  - `widget_test.dart`: 1 teste de integração da árvore inicial passando.
- **Resultado Geral:** **100% SUCCESS**

---

### 🎯 FASE 5: SIMULAÇÃO DE ENTREVISTA TÉCNICA (PASSO 2)

> 🎤 **Pergunta do Tech Lead / Entrevistador:**  
> *"Em uma arquitetura Flutter corporativa conectada a um backend Spring Security com JWT, por que o uso de um Interceptor de Rede no Dio e de um armazenamento em Keystore/Keychain é mandatório, e como você lidaria com a expiração do token durante o uso do app?"*

### 💡 Resposta Modelo Sênior:
*"O uso de Interceptors no Dio é mandatório porque centraliza a governança de segurança em um único ponto da arquitetura (Cross-Cutting Concern), eliminando a duplicação de cabeçalhos de autorização e o risco de desenvolvedores esquecerem o token em chamadas futuras. Já a escolha do Keystore (Android) e Keychain (iOS) via FlutterSecureStorage protege o token contra extrações físicas e ataques de sandbox, já que o SharedPreferences tradicional armazena dados em XML plano sem criptografia.*

*Para lidar com a expiração do token, o interceptor implementa o gancho `onError`: ao capturar um status HTTP 401 Unauthorized do Spring Security, ele intercepta a resposta antes que chegue à tela, aciona a limpeza das credenciais no Secure Storage e notifica a camada de autenticação para redirecionar o usuário à tela de login com uma mensagem clara de sessão expirada, garantindo a integridade do estado e uma transição de UI graciosa sem travamentos."*

