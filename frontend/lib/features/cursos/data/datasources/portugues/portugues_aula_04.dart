import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 04: Sintaxe da Oração e do Período
final AulaGuiaItem portuguesAula04 = AulaGuiaItem(
  numero: '04',
  titulo: 'Sintaxe da Oração e do Período (Termos Essenciais, Integrantes e Acessórios)',
  detalhes: '20 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# SINTAXE DA ORAÇÃO E DO PERÍODO NO PADRÃO DO EDITAL

## 1. TERMOS ESSENCIAIS DA ORAÇÃO
1. **Sujeito**:
   - Simples: apenas um núcleo (*O policial realizou a abordagem*).
   - Composto: dois ou mais núcleos (*O soldado e o sargento chegaram*).
   - Oculto / Desinencial / Elíptico: identificado pela desinência do verbo (*Concluímos o relatório ontem*).
   - Indeterminado:
     - Verbo na 3ª pessoa do plural sem referência prévia (*Quebraram a viatura na rua*).
     - Verbo Transitivo Indireto (VTI), Verbo Intransitivo (VI) ou de Ligação (VL) + partícula **SE** (*Precisa-se de agentes dedicados*).
   - Oração Sem Sujeito (Verbos Impessoais):
     - Verbo **HAVER** no sentido de existir, ocorrer ou indicando tempo decorrido (*Havia muitas testemunhas no local*). NUNCA pluraliza!
     - Verbo **FAZER** indicando tempo ou clima (*Faz dois anos que ingressei*).
2. **Predicado**:
   - Verbal: núcleo é um verbo nocional de ação (*O perito analisou os vestígios*).
   - Nominal: verbo de ligação + predicativo do sujeito (*O ambiente permaneceu calmo*).
   - Verbo-Nominal: verbo nocional + predicativo (*O soldado retornou exausto da missão*).

---

## 2. TERMOS INTEGRANTES DA ORAÇÃO
1. **Complementos Verbais**:
   - **Objeto Direto (OD)**: completa verbo sem preposição obrigatória (*Apreendeu a arma*).
   - **Objeto Indireto (OI)**: completa verbo com preposição regida (*Obedeceu ao comandante*).
2. **Complemento Nominal (CN)** vs. **Adjunto Adnominal (AA)**:
   - Complemento Nominal: completa substantivo abstrato, adjetivo ou advérbio. Tem sentido **passivo** (recebe a ação) e **sempre tem preposição**!
     - *A leitura do livro* -> O livro foi lido (Passivo = CN).
   - Adjunto Adnominal: ligado a substantivo concreto ou abstrato com sentido **ativo** (pratica a ação) ou posse.
     - *A leitura do aluno* -> O aluno leu (Ativo = AA).
3. **Agente da Passiva**: termo que pratica a ação na voz passiva analítica (*O réu foi condenado pelo magistrado*).

---

## 3. TERMOS ACESSÓRIOS DA ORAÇÃO
1. **Adjunto Adverbial**: indica circunstância (tempo, modo, lugar, causa, instrumento). Se deslocado de grande extensão, vírgula obrigatória.
2. **Aposto**: explica, resume ou especifica um termo substantivo. O aposto explicativo vem isolado por vírgulas, travessões ou parênteses (*Recife, capital de Pernambuco, sediou o evento*).
3. **Vocativo**: termo independente de chamamento ou invocação. **SEMPRE isolado por vírgula!** (*Senhores jurados, ouçam a verdade.*).

---

## 4. ORAÇÕES SUBORDINADAS ADJETIVAS (VÍRGULA E SENTIDO)
- **Explicativa**: vem isolada entre vírgulas. Refere-se à totalidade do conjunto (*Os policiais militares, que são servidores dedicados, merecem valorização* = TODOS os policiais militares).
- **Restritiva**: vem SEM vírgula. Restringe apenas uma parcela do conjunto (*Os policiais militares que participaram da operação receberam elogio* = apenas AQUELES que participaram).
- Pegadinha de Prova: A inserção ou supressão de vírgulas na oração adjetiva **muda o sentido**, mas quase sempre mantém a **correção gramatical**.''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Sintaxe da Oração e Termos',
    conceitoCentral: 'Organização e Funções Sintáticas da Oração',
    regraDeOuro: 'Haver no sentido de existir não tem sujeito e não vai ao plural; Oração adjetiva com vírgula generaliza, sem vírgula restringe!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Sujeito e Verbos Impessoais',
        subtitulo: 'Regras de concordância e impessoalidade',
        corRamo: Color(0xFF2563EB),
        icone: Icons.person_search,
        itens: [
          MapaMentalItem(
            titulo: 'Verbo HAVER (Existir / Ocorrer)',
            descricao: 'Verbo impessoal. Oração sem sujeito. Sempre na 3ª do singular!',
            mnemonico: 'Havia pistas (Certo) vs Haviam pistas (Erro crasso).',
          ),
          MapaMentalItem(
            titulo: 'Sujeito Indeterminado',
            descricao: '3ª do plural sem referente OU VTI / VI + SE (Índice de Indeterminação).',
            exemplo: 'Precisa-se de soldados experientes.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Complemento vs Adjunto',
        subtitulo: 'Diferença tática CRAVOU',
        corRamo: Color(0xFFDC2626),
        icone: Icons.compare_arrows,
        itens: [
          MapaMentalItem(
            titulo: 'Complemento Nominal (Passivo)',
            descricao: 'Completa substantivo abstrato, adjetivo ou advérbio. Sofre a ação.',
            exemplo: 'A construção do quartel (o quartel foi construído = CN).',
          ),
          MapaMentalItem(
            titulo: 'Adjunto Adnominal (Ativo / Posse)',
            descricao: 'Completa substantivo concreto ou abstrato praticando a ação.',
            exemplo: 'A decisão do juiz (o juiz decidiu = AA).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Aposto vs Vocativo',
        subtitulo: 'Pontuação e função oracional',
        corRamo: Color(0xFF059669),
        icone: Icons.chat_bubble_outline,
        itens: [
          MapaMentalItem(
            titulo: 'Aposto Explicativo',
            descricao: 'Explica o nome anterior. Isolado por vírgulas ou travessões.',
            exemplo: 'Duarte Coelho, primeiro donatário, colonizou a região.',
          ),
          MapaMentalItem(
            titulo: 'Vocativo (Chamamento)',
            descricao: 'Invocação direta. Termo independente. Sempre com vírgula!',
            exemplo: 'Atenção, pelotão! Em frente, marche!',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Orações Adjetivas',
        subtitulo: 'Explicativa vs Restritiva',
        corRamo: Color(0xFFD97706),
        icone: Icons.tune,
        itens: [
          MapaMentalItem(
            titulo: 'Explicativa (Com Vírgulas)',
            descricao: 'Generaliza para todo o conjunto. Valor explicativo global.',
            exemplo: 'O Sol, que é uma estrela, ilumina a Terra.',
          ),
          MapaMentalItem(
            titulo: 'Restritiva (Sem Vírgulas)',
            descricao: 'Limita o significado a uma parcela específica.',
            exemplo: 'Os alunos que revisam passam no concurso.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 401,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Sintaxe - Sujeito',
      enunciado: 'Em relação à oração "Havia inúmeras testemunhas oculares no momento do incidente", assinale a afirmativa correta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O sujeito é simples e tem como núcleo "testemunhas".',
        'B': 'O sujeito é indeterminado devido ao verbo haver.',
        'C': 'Trata-se de oração sem sujeito, funcionando "inúmeras testemunhas oculares" como objeto direto.',
        'D': 'O sujeito é composto por "testemunhas oculares" e "incidente".',
        'E': 'O verbo deveria estar flexionado no plural ("Haviam") para concordar com o sujeito.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Oração sem sujeito e objeto direto)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. "Testemunhas" NÃO é sujeito. O verbo "haver" no sentido de "existir", "acontecer" ou "ocorrer" é IMPESSOAL. Não admite sujeito sob nenhuma hipótese na norma culta.
• B) INCORRETA. Não confunda sujeito indeterminado (verbo na 3ª pessoa do plural sem referente prévio, ou VTI/VI + SE) com oração sem sujeito (verbos impessoais como haver, fazer indicando tempo e verbos de fenômenos da natureza).
• C) CORRETA. O verbo "haver", quando empregado com o significado de "existir", é transitivo direto impessoal (VTD). Logo, a oração é classificada como ORAÇÃO SEM SUJEITO (ou de sujeito inexistente). O termo que parece sujeito aos olhos desatentos ("inúmeras testemunhas oculares") exerce a função sintática de OBJETO DIRETO.
• D) INCORRETA. Não há sujeito composto na frase.
• E) INCORRETA. O verbo haver impessoal NÃO flexiona para o plural! A forma "haviam testemunhas" é erro gravíssimo de concordância verbal em concursos. O correto é sempre o singular: "havia testemunhas".

💡 CUIDADO COM A TROCA POR "EXISTIR":
Se a banca trocar "havia" por "existir", o verbo existir É PESSOAL e concorda com o sujeito:
• HAVIA testemunhas (Oração sem sujeito; testemunhas = Objeto Direto).
• EXISTIAM testemunhas (Oração com sujeito; testemunhas = Sujeito).''',
    ),
    QuestaoModel(
      id: 402,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Orações Subordinadas Adjetivas',
      enunciado: 'No período "Os militares que concluíram o curso tático foram promovidos", a oração adjetiva destacada restringe o sentido do substantivo antecedente, indicando que nem todos os militares foram promovidos.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE SEMÂNTICA DAS ORAÇÕES SUBORDINADAS ADJETIVAS:
A presença ou ausência da vírgula altera profundamente o sentido e a lógica do período:
1. ORAÇÃO ADJETIVA RESTRITIVA (SEM VÍRGULAS):
   • "Os militares [que concluíram o curso tático] foram promovidos."
   • Sentido: Delimita, restringe e particulariza o grupo. Apenas uma parcela dos militares (exclusivamente os que concluíram o curso) foi promovida; os demais militares da corporação não foram.
2. ORAÇÃO ADJETIVA EXPLICATIVA (ENTRE VÍRGULAS):
   • "Os militares, [que concluíram o curso tático], foram promovidos."
   • Sentido: Generaliza e atribui uma característica universal a todo o conjunto. Significaria que TODOS os militares concluíram o curso e TODOS foram promovidos.

Como o período original não possui vírgulas, a oração é RESTRITIVA e afirma com certeza que apenas parte dos militares foi promovida.''',
    ),
    QuestaoModel(
      id: 403,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Vocativo vs Aposto',
      enunciado: 'Assinale a alternativa que contém um vocativo corretamente pontuado:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Soldado Silva, apresente o relatório ao coronel!',
        'B': 'Soldado Silva apresentou o relatório ao coronel.',
        'C': 'O soldado Silva, homem íntegro foi promovido ontem.',
        'D': 'Apresente o relatório Soldado Silva ao coronel.',
        'E': 'O coronel chamou o soldado Silva para a reunião.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A

🔍 DESTRINCHANDO AS FUNÇÕES SINTÁTICAS:
• A) CORRETA. VOCATIVO é o termo discursivo que invoca, interpela ou chama diretamente o interlocutor a quem a mensagem se dirige. Sintaticamente, é um termo independente da oração e DEVE ser isolado compulsoriamente por vírgula (no início, meio ou fim da frase). Em "Soldado Silva, apresente...", o emissor está chamando o soldado para dar-lhe uma ordem.
• B) INCORRETA. Aqui "Soldado Silva" é o SUJEITO da oração (quem praticou a ação de apresentar), não vocativo.
• C) INCORRETA. Erro de pontuação. "Homem íntegro" é APOSTO EXPLICATIVO e deveria estar isolado por DUAS vírgulas ("O soldado Silva, homem íntegro, foi promovido...").
• D) INCORRETA. O vocativo no meio da frase ("Soldado Silva") deveria estar isolado entre vírgulas ("Apresente o relatório, Soldado Silva, ao coronel").
• E) INCORRETA. "O soldado Silva" é OBJETO DIRETO da oração principal ("chamou quem?").''',
    ),
    QuestaoModel(
      id: 404,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Complemento Nominal vs Adjunto Adnominal',
      enunciado: 'Na oração "A destruição da prova prejudicou o andamento do inquérito policial", o termo "da prova" desempenha a função sintática de complemento nominal.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 O TESTE DA VOZ ATIVA VS VOZ PASSIVA (MÉTODO CRAVOU):
A distinção entre Adjunto Adnominal e Complemento Nominal ligado a substantivo abstrato com preposição "de" resolve-se pelo sentido ATIVO ou PASSIVO:
1. Analise o termo: "A destruição DA PROVA".
   • O substantivo "destruição" é um substantivo abstrato derivado do verbo "destruir" (indica ação).
   • Pergunta tática: A prova praticou a ação de destruir (ativa) ou sofreu a ação de ser destruída (passiva)?
   • Resposta: A prova SOFREU a destruição ("A prova foi destruída por alguém").
2. Regra de Ouro da Sintaxe:
   • Se o termo preposicionado tem valor PACIENTE (sofre a ação) = COMPLEMENTO NOMINAL!
   • Se o termo preposicionado tem valor AGENTE (pratica a ação) = ADJUNTO ADNOMINAL! (Ex: "A crítica do delegado" -> o delegado criticou = agente = adjunto adnominal).

Portanto, "da prova" é inquestionavelmente Complemento Nominal.''',
    ),
    QuestaoModel(
      id: 405,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Predicação Verbal',
      enunciado: 'Assinale a alternativa que apresenta verbo transitivo direto e indireto (bitransitivo):',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O comandante entregou a medalha de honra ao cabo destacado.',
        'B': 'O suspeito permaneceu calado durante o depoimento.',
        'C': 'Todos os cidadãos aspiram à segurança pública de qualidade.',
        'D': 'A viatura derrapou na pista molhada pela chuva.',
        'E': 'Os novos recrutas obedeceram prontamente ao capitão.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Verbo Bitransitivo / VTDI)

🔍 DESTRINCHANDO A TRANSITIVIDADE DE CADA VERBO:
• A) CORRETA. O verbo "entregar" é TRANSITIVO DIRETO E INDIRETO (VTDI). Quem entrega, entrega algo a alguém:
  - "a medalha de honra" = Objeto Direto (sem preposição obrigatória);
  - "ao cabo destacado" = Objeto Indireto (preposição "a" obrigatória).
• B) INCORRETA. O verbo "permaneceu" é VERBO DE LIGAÇÃO (VL), ligando o sujeito ao predicativo "calado".
• C) INCORRETA. O verbo "aspirar" no sentido de desejar/almejar é TRANSITIVO INDIRETO (VTI), exigindo preposição "a" ("aspiram à segurança pública").
• D) INCORRETA. O verbo "derrapar" é INTRANSITIVO (VI), pois tem sentido completo. "Na pista molhada" é adjunto adverbial de lugar.
• E) INCORRETA. O verbo "obedecer" é TRANSITIVO INDIRETO (VTI), regendo a preposição "a" ("obedeceram ao capitão").''',
    ),
    QuestaoModel(
      id: 406,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Sujeito Indeterminado',
      enunciado: 'Em "Trabalha-se com afinco no quartel do Derby", o sujeito da oração classifica-se como indeterminado.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 MECANISMO DE INDETERMINAÇÃO DO SUJEITO COM A PARTÍCULA "SE":
1. Transitividade do Verbo:
   • O verbo "trabalhar" é um Verbo Intransitivo (VI). Quem trabalha, trabalha (não exige objeto direto nem indireto).
   • Os termos seguintes são adjuntos adverbiais: "com afinco" (modo) e "no quartel do Derby" (lugar).
2. Regra Gramatical do Índice de Indeterminação do Sujeito (IIS):
   • Quando a partícula "SE" une-se a:
     - Verbo Transitivo Indireto (VTI + SE);
     - Verbo Intransitivo (VI + SE);
     - Verbo de Ligação (VL + SE);
     -> A partícula classifica-se como ÍNDICE DE INDETERMINAÇÃO DO SUJEITO (IIS).
   • O verbo deve ficar OBRIGATORIAMENTE na 3ª pessoa do SINGULAR.
   • Não é possível passar para a voz passiva analítica (não existe "afinco é trabalhado"). O sujeito é formalmente desconhecido e INDETERMINADO!''',
    ),
    QuestaoModel(
      id: 407,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Agente da Passiva',
      enunciado: 'Na frase "O veículo furtado foi localizado pelos militares do batalhão de choque", a expressão "pelos militares do batalhão de choque" exerce a função de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Sujeito paciente.',
        'B': 'Objeto indireto preposicionado.',
        'C': 'Agente da passiva.',
        'D': 'Adjunto adverbial de meio.',
        'E': 'Complemento nominal.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Agente da Passiva)

🔍 ANÁLISE DA VOZ PASSIVA ANALÍTICA:
Estrutura da oração:
• "O veículo furtado" = Sujeito Paciente (sofre a ação verbal de ser localizado);
• "foi localizado" = Locução Verbal Passiva (verbo auxiliar "ser" + particípio do verbo principal);
• "pelos militares do batalhão de choque" = AGENTE DA PASSIVA.

Conceito de Agente da Passiva:
É o termo sintático que, em uma oração estruturada na VOZ PASSIVA, executa concretamente a ação verbal expressa pelo particípio. Vem regido obrigatoriamente pela preposição "por" (ou pela contração "pelo/pela") e, mais raramente, "de".
• Prova Real (Conversão para a Voz Ativa):
  "Os militares do batalhão de choque [Sujeito Agente] localizaram [VTD] o veículo furtado [Objeto Direto]."''',
    ),
    QuestaoModel(
      id: 408,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Predicativo do Sujeito',
      enunciado: 'Em "Os agentes chegaram exaustos ao plantão", o vocábulo "exaustos" funciona sintaticamente como predicativo do sujeito em um predicado verbo-nominal.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DO PREDICADO VERBO-NOMINAL:
Existem 3 tipos fundamentais de predicado na sintaxe da língua portuguesa:
1. Predicado Verbal: Tem como núcleo um verbo significativo (transitivo ou intransitivo), sem predicativo (ex: "Os agentes chegaram ao plantão").
2. Predicado Nominal: Tem como núcleo um nome (predicativo), ligado ao sujeito por um verbo de ligação (ex: "Os agentes estavam exaustos").
3. Predicado Verbo-Nominal: Possui DOIS NÚCLEOS: um núcleo verbal (ação) e um núcleo nominal (estado/qualidade passageira do sujeito ou do objeto).
   • Na oração do item:
     - Núcleo 1 (Verbo de Ação): "chegaram" (VI);
     - Núcleo 2 (Nome que qualifica o sujeito no momento da chegada): "exaustos" (Predicativo do Sujeito).
   • Portanto, o predicado é genuinamente VERBO-NOMINAL e o termo "exaustos" é PREDICATIVO DO SUJEITO.''',
    ),
    QuestaoModel(
      id: 409,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Orações Subordinadas Substantivas',
      enunciado: 'A oração destacada em "É fundamental QUE TODOS CUMPRAM O PROTOCOLO DE SEGURANÇA" classifica-se sintaticamente como subordinada substantiva:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Objetiva direta.',
        'B': 'Subjetiva.',
        'C': 'Completiva nominal.',
        'D': 'Predicativa.',
        'E': 'Apositiva.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Subordinada Substantiva Subjetiva)

🔍 COMO IDENTIFICAR A ORAÇÃO SUBJETIVA EM 3 PASSOS:
1. Aplique a substituição pelo pronome "ISSO":
   • "É fundamental [ISSO]."
2. Coloque a frase na ordem direta (Sujeito + Verbo + Predicativo):
   • "[ISSO] é fundamental."
   • Pergunta ao verbo: O que é fundamental? Resposta: "ISSO" (que todos cumpram o protocolo).
3. Conclusão Sintática:
   • A oração principal ("É fundamental") possui Verbo de Ligação ("é") e Predicativo do Sujeito ("fundamental"), mas NÃO possui sujeito próprio!
   • Quem exerce o papel de SUJEITO da oração principal é toda a oração subordinada.
   • Portanto, trata-se de ORAÇÃO SUBORDINADA SUBSTANTIVA SUBJETIVA (exerce a função de sujeito).

💡 ESTRUTURAS QUE SEMPRE GERAM ORAÇÃO SUBJETIVA:
• Verbo de ligação + adjetivo: É preciso que..., É necessário que..., É fundamental que...
• Verbo na voz passiva analítica ou pronominal: Sabe-se que..., Constatou-se que..., Foi divulgado que...
• Verbos unipessoais: Convém que..., Cumpre que..., Importa que...''',
    ),
    QuestaoModel(
      id: 410,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Aposto Explicativo',
      enunciado: 'Na oração "Recife, a Veneza Brasileira, tem papel histórico na independência nacional", o segmento entre vírgulas funciona sintaticamente como aposto explicativo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 CARACTERÍSTICAS SINTÁTICAS DO APOSTO EXPLICATIVO:
O aposto explicativo cumpre os seguintes requisitos normativos:
1. Natureza Substantiva: É encabeçado por substantivo ou expressão substantivada ("a Veneza Brasileira");
2. Referência ao Antecedente: Esclarece, particulariza, resume ou dá um epíteto a um substantivo anterior ("Recife");
3. Pontuação Obrigatória: Vem OBRIGATORIAMENTE isolado entre vírgulas, travessões ou parênteses;
4. Equivalência e Supressão: Pode ser suprimido da oração sem comprometer a estrutura sintática ("Recife tem papel histórico na independência nacional").

O segmento sob análise cumpre com absoluta perfeição todas essas propriedades doutrinárias.''',
    ),
    QuestaoModel(
      id: 411,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Adjunto Adverbial Deslocado',
      enunciado: 'Em "Com muita rapidez, a viatura alcançou os fugitivos", o termo inicial destacado classifica-se sintaticamente como adjunto adverbial de modo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE SINTÁTICO-SEMÂNTICA:
• O segmento "Com muita rapidez" indica a circunstância de modo (como, de que maneira a ação de alcançar foi perpetrada pela guarnição da viatura = rapidamente).
• Trata-se de uma Locução Adverbial de Modo exercendo a função sintática de ADJUNTO ADVERBIAL DE MODO.
• Posição Sintática e Pontuação: A ordem canônica da oração é Sujeito + Verbo + Complementos + Adjunto Adverbial. Como o adjunto adverbial foi deslocado para o início do período e possui mais de três palavras (longa extensão), o emprego da VÍRGULA é de uso estritamente obrigatório segundo a norma-padrão.''',
    ),
    QuestaoModel(
      id: 412,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Orações Reduzidas',
      enunciado: 'A oração reduzida de gerúndio no trecho "Saindo da delegacia, o escrivão encontrou o advogado" possui valor semântico equivalente a uma oração subordinada adverbial temporal ("Quando saía da delegacia").',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DESENVOLVIMENTO DE ORAÇÕES REDUZIDAS (MÉTODO CRAVOU):
1. Identificação da Oração Reduzida:
   • "Saindo da delegacia..." não possui conjunção subordinativa introdutória e seu verbo está na forma nominal de GERÚNDIO (-ndo). Logo, é uma Oração Reduzida de Gerúndio.
2. Desenvolvimento da Oração:
   • Para desdobrar uma oração reduzida, adiciona-se a conjunção adequada e conjuga-se o verbo no modo finito correspondente:
     - "Quando saía da delegacia..." (Conjunção temporal "quando")
     - "No momento em que saía da delegacia..." (Locução conjuntiva temporal)
   • O valor semântico é inquestionavelmente TEMPORAL, indicando a simultaneidade entre a saída da repartição policial e o encontro com o patrono.''',
    ),
    QuestaoModel(
      id: 413,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Objeto Direto Preposicionado',
      enunciado: 'Assinale a alternativa que contém objeto direto preposicionado:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O cão policial perseguiu a lebre.',
        'B': 'O bom soldado ama a Deus e honra a pátria.',
        'C': 'O guarda necessitou de apoio operacional.',
        'D': 'O motorista colidiu contra o muro de arrimo.',
        'E': 'A comissão respondeu aos questionamentos dos candidatos.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (ama a Deus)

🔍 ANÁLISE MINUCIOSA DO OBJETO DIRETO PREPOSICIONADO:
O Objeto Direto Preposicionado ocorre quando um VERBO TRANSITIVO DIRETO (que gramaticalmente não rege preposição) tem seu complemento antecedido de preposição por razões puramente estilísticas, de ênfase, clareza ou reverência religiosa.
• Análise da alternativa B:
  - O verbo "amar" é VTD (quem ama, ama alguém ou algo);
  - "a Deus": a preposição "a" surge por piedade / reverência à divindade, constituindo o caso mais célebre de OBJETO DIRETO PREPOSICIONADO da língua culta!
• Descarte dos distratores:
  - A) "a lebre" = Objeto Direto simples (o "a" é apenas artigo definido).
  - C) "de apoio operacional" = Objeto Indireto regular regido pelo VTI "necessitar" (quem necessita, necessita DE).
  - D) "contra o muro" = Adjunto Adverbial de Lugar / Objeto Indireto regido pela preposição "contra".
  - E) "aos questionamentos" = Objeto Indireto regido pelo VTI "responder" (responder A algo).''',
    ),
    QuestaoModel(
      id: 414,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Oração Sem Sujeito',
      enunciado: 'Na frase "Fazia noites extremamente frias na serra pernambucana", o verbo "fazer" está no singular porque é impessoal na indicação de fenômeno climático ou tempo decorrido.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 IMPESSOALIDADE DO VERBO FAZER:
O verbo FAZER comporta-se como IMPESSOAL em dois cenários fundamentais em provas de concursos policiais:
1. Quando indica TEMPO DECORRIDO ou transcorrido:
   • Exemplo: "Faz dez anos que ingressei na Polícia Militar" (e NUNCA "fazem dez anos").
2. Quando expressa FENÔMENO CLIMÁTICO ou sensação térmica:
   • Exemplo: "Fazia noites frias em Garanhuns", "Faz dias chuvosos no litoral".
• Consequência Sintática Direta:
  - A oração NÃO tem sujeito (oração sem sujeito);
  - O verbo fica OBRIGATORIAMENTE congelado na 3ª pessoa do singular;
  - O substantivo plural subsequente ("noites extremamente frias") funciona sintaticamente como OBJETO DIRETO.
Portanto, a assertiva é irrepreensível.''',
    ),
    QuestaoModel(
      id: 415,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Sintaxe do Período Composto',
      enunciado: 'Um período composto por coordenação assindética é aquele cujas orações são justapostas e ligadas diretamente sem o uso de conectivos conjuntivos explícitos.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ORAÇÕES COORDENADAS ASSINDÉTICAS VS SINDÉTICAS:
No período composto por coordenação, as orações são sintaticamente independentes (nenhuma exerce função sintática de termo da outra):
1. Orações Coordenadas Assindéticas (sem síndeto):
   • O prefixo "a-" indica negação: "sem síndeto" (sem conjunção coordenativa).
   • As orações sucedem-se ligadas exclusivamente pela pontuação (vírgulas, ponto e vírgula ou dois-pontos).
   • Exemplo célebre de Júlio César: "Vim, vi, venci" (3 orações coordenadas assindéticas).
   • Exemplo policial: "A sirene tocou, os policiais embarcaram, a viatura partiu."
2. Orações Coordenadas Sindéticas (com síndeto):
   • São introduzidas por uma conjunção coordenativa (aditiva, adversativa, alternativa, conclusiva ou explicativa).

A definição do enunciado corresponde exatamente à doutrina sintática tradicional.''',
    ),
  ],
);

