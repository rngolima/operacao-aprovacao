import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 06: Concordância Verbal e Nominal
final AulaGuiaItem portuguesAula06 = AulaGuiaItem(
  numero: '06',
  titulo: 'Concordância Verbal e Nominal (Casos Gerais e Pegadinhas Especiais)',
  detalhes: '20 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# CONCORDÂNCIA VERBAL E NOMINAL: REGRAS ESTRATÉGICAS

## 1. CONCORDÂNCIA VERBAL COM A PARTÍCULA "SE" (O TEMA MAIS COBRADO)
1. **Verbo Transitivo Direto (VTD) + SE -> PARTÍCULA APASSIVADORA**:
   - O verbo **CONCORDA OBRIGATORIAMENTE** com o sujeito paciente!
   - Singular: *Vende-se casa.* (A casa é vendida).
   - Plural: *Vendem-se casas.* (As casas são vendidas).
   - Na prova da PM-PE / PC-PE:
     - *Apurou-se o crime.* (Certo)
     - *Apuraram-se os crimes.* (Certo - Sujeito paciente no plural exige verbo no plural!).
     - ERRADO: *Apurou-se os crimes.* (Erro clássico em bancas!).
2. **Verbo Transitivo Indireto (VTI), Intransitivo (VI) ou de Ligação (VL) + SE -> ÍNDICE DE INDETERMINAÇÃO**:
   - O verbo **FICA RIGOROSAMENTE NO SINGULAR**!
   - Exemplos:
     - *Precisa-se de soldados experientes.* (VTI + SE = sempre no singular).
     - *Trata-se de ocorrências graves.* (NUNCA diga "Tratam-se").
     - *Vive-se bem em cidades pacificadas.* (VI + SE = singular).

---

## 2. CONCORDÂNCIA COM VERBOS IMPESSOAIS
1. **Verbo HAVER (Existir / Ocorrer / Acontecer)**:
   - HAVER é impessoal -> **SEMPRE na 3ª pessoa do singular**!
   - *Havia muitos manifestantes na avenida.* (NUNCA "Haviam muitos manifestantes").
   - *Pode haver falhas operacionais.* (Em locuções, o verbo auxiliar herda a impessoalidade: *Pode haver*, *Deve haver*).
   - ATENÇÃO: O verbo **EXISTIR** é pessoal e **CONCORDA com o sujeito**:
     - *Existiam muitas testemunhas.* (Certo!).
2. **Verbo FAZER (Tempo Decorrido / Clima)**:
   - *Faz dez anos que sirvo à corporação.* (NUNCA "Fazem dez anos").
   - *Deve fazer dias quentes no sertão.* (Locução impessoal).

---

## 3. EXPRESSÕES PARTITIVAS E NÚMEROS PERCENTUAIS
1. **Expressões Partitivas** (*A maioria de, grande parte de, a metade de* + termo plural):
   - Concordância facultativa: pode concordar com a expressão (singular) ou com o termo plural (atrativa).
   - *A maioria dos policiais compareceu / compareceram.* (Ambos corretos!).
2. **Porcentagens e Frações**:
   - Concorda com o numeral ou com o substantivo posposto:
     - *1% dos eleitores votou / votaram.*
     - *Mais de um policial foi homenageado.* (Expressão "mais de um" leva ao singular, salvo reciprocidade).

---

## 4. CONCORDÂNCIA NOMINAL: CASOS ESPECIAIS
1. **É proibido / É necessário / É bom / É preciso**:
   - SEM artigo: **Invariável no masculino**: *É proibido entrada de civis.*
   - COM artigo ou determinante: **Concorda com o determinante**: *É proibida A entrada de civis.*
2. **Anexo, Incluso, Próprio, Quite, Obrigado**:
   - Concordam em gênero e número com a palavra a que se referem:
     - *Os relatórios seguem anexos.*
     - *As cartas seguem anexas.*
     - *Eles disseram muito obrigado; elas disseram muito obrigadas.*
   - ATENÇÃO: A locução *em anexo* é invariável (*Seguem em anexo os autos*).
3. **Meio e Bastante**:
   - *Meio* com valor de advérbio (um pouco) é invariável: *A cabo estava meio preocupada.*
   - *Meio* numeral fracionário concorda: *Comeu meia maçã.*''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Concordância Verbal e Nominal',
    conceitoCentral: 'Regras de Concordância no Padrão das Bancas Policiais',
    regraDeOuro: 'VTD + SE pluraliza com o sujeito paciente; VTI + SE sempre no singular; Haver no sentido de existir nunca vai ao plural!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Voz Passiva com SE',
        subtitulo: 'Apassivador vs Indeterminação',
        corRamo: Color(0xFF2563EB),
        icone: Icons.rule_folder,
        itens: [
          MapaMentalItem(
            titulo: 'Partícula Apassivadora (VTD + SE)',
            descricao: 'Verbo concorda com o sujeito paciente.',
            mnemonico: 'Vendem-se casas = Casas são vendidas.',
            exemplo: 'Apuraram-se os fatos na corregedoria.',
          ),
          MapaMentalItem(
            titulo: 'Índice de Indeterminação (VTI/VI + SE)',
            descricao: 'Verbo obrigatoriamente no singular na 3ª pessoa.',
            exemplo: 'Precisa-se de mais viaturas blindadas.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Verbos Impessoais',
        subtitulo: 'Haver, Fazer e Locuções',
        corRamo: Color(0xFFDC2626),
        icone: Icons.alarm_off,
        itens: [
          MapaMentalItem(
            titulo: 'Haver = Existir',
            descricao: 'Sempre singular: "Havia provas", "Pode haver recursos".',
            mnemonico: 'Trocou por existir, HAVER congela no singular!',
          ),
          MapaMentalItem(
            titulo: 'Existir (É Pessoal!)',
            descricao: 'Existir concorda: "Existiam muitas testemunhas".',
          ),
          MapaMentalItem(
            titulo: 'Fazer (Tempo / Clima)',
            descricao: 'Sempre singular: "Faz dois meses", "Fazia dias quentes".',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Expressões Partitivas',
        subtitulo: 'Concordância Facultativa',
        corRamo: Color(0xFF059669),
        icone: Icons.pie_chart_outline,
        itens: [
          MapaMentalItem(
            titulo: 'A maioria de / Parte de + Plural',
            descricao: 'Concorda com o núcleo singular ou com o especificador plural.',
            exemplo: 'A maioria dos recrutas desistiu / desistiram.',
          ),
          MapaMentalItem(
            titulo: 'Números Percentuais',
            descricao: 'Concorda com o número ou com o substantivo subsequente.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Concordância Nominal',
        subtitulo: 'Adjetivos, É proibido, Anexo',
        corRamo: Color(0xFFD97706),
        icone: Icons.spellcheck,
        itens: [
          MapaMentalItem(
            titulo: 'É proibido vs É proibida',
            descricao: 'Sem artigo = proibido; Com artigo "A" = proibida.',
            exemplo: 'É proibido entrada vs É proibida a entrada.',
          ),
          MapaMentalItem(
            titulo: 'Anexo e Obrigado',
            descricao: 'Concordam com a pessoa/coisa: fotos anexas; ela disse obrigada.',
          ),
          MapaMentalItem(
            titulo: 'Meio (Advérbio)',
            descricao: 'Invariável: "Ela estava meio cansada".',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 601,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Verbal com SE',
      enunciado: 'Assinale a alternativa em que a concordância verbal com o pronome "se" atende rigorosamente ao padrão culto da língua:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Identificou-se os suspeitos do assalto.',
        'B': 'Apuraram-se todas as circunstâncias do crime.',
        'C': 'Precisam-se de novos equipamentos para a corporação.',
        'D': 'Tratam-se de questões prioritárias para o governo.',
        'E': 'Comentou-se vários detalhes do ocorrido.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Apuraram-se todas as circunstâncias...)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA (VTD+SE vs VTI+SE):
• A) INCORRETA. O verbo "identificar" é Transitivo Direto (VTD). Com VTD + SE, a partícula é apassivadora e o termo seguinte é o SUJEITO PACIENTE ("os suspeitos do assalto", plural). O verbo deve concordar obrigatoriamente no plural: "Identificaram-se os suspeitos" (= Os suspeitos foram identificados).
• B) CORRETA. O verbo "apurar" é VTD. Com partícula apassivadora "se", concorda perfeitamente no plural com o sujeito paciente plural "todas as circunstâncias do crime" ("Apuraram-se todas as circunstâncias" = Todas as circunstâncias do crime foram apuradas).
• C) INCORRETA. O verbo "precisar" é Transitivo Indireto (quem precisa, precisa DE algo - VTI). Com VTI + SE, o "se" é ÍNDICE DE INDETERMINAÇÃO DO SUJEITO (IIS) e o verbo fica OBRIGATORIAMENTE no singular: "Precisa-se de novos equipamentos". A flexão para o plural é erro gravíssimo!
• D) INCORRETA. O verbo "tratar" é Transitivo Indireto (tratar DE algo - VTI). Com IIS, deve ficar no singular: "Trata-se de questões prioritárias".
• E) INCORRETA. "Comentar" é VTD; com sujeito paciente plural ("vários detalhes"), exige plural: "Comentaram-se vários detalhes".''',
    ),
    QuestaoModel(
      id: 602,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância do Verbo Haver',
      enunciado: 'Na frase "Haviam muitos policiais mobilizados na contenção do tumulto", o emprego do verbo "haver" no plural está em perfeita consonância com a norma culta.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 REGRA SUPREMA DO VERBO HAVER IMPESSOAL:
O verbo HAVER, quando empregado com o sentido de:
• "Existir";
• "Acontecer" / "Ocorrer";
• Ou indicando tempo decorrido ("Há dez anos...");
É classificado gramaticalmente como VERBO IMPESSOAL.
• Consequências Sintáticas:
  1. A oração NÃO possui sujeito (Oração Sem Sujeito);
  2. O verbo NÃO pode flexionar para o plural, devendo permanecer OBRIGATORIAMENTE congelado na 3ª pessoa do singular;
  3. O termo plural ("muitos policiais mobilizados") exerce a função de OBJETO DIRETO (quem há, há algo).
• Forma Correta: "Havia muitos policiais mobilizados...".
O uso de "Haviam" no plural é erro clássico que elimina milhares de concorrentes desatentos.''',
    ),
    QuestaoModel(
      id: 603,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Nominal',
      enunciado: 'Assinale a opção em que a concordância nominal está correta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'É proibido a permanência de veículos não autorizados no pátio.',
        'B': 'A perita estava meia preocupada com o resultado do laudo.',
        'C': 'Seguem anexos aos autos os relatórios periciais requisitados.',
        'D': 'Os candidatos disseram muito obrigado e elas disseram muito obrigado.',
        'E': 'Bastantes policiais foram mobilizados, mas eles ficaram bastante cansados (ambos invariáveis).',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 DESTRINCHANDO A CONCORDÂNCIA NOMINAL:
• A) INCORRETA. Expressões do tipo "é bom / é necessário / é proibido":
  - Se o sujeito vier acompanhado de determinante (artigo "a", pronome): CONCORDA OBRIGATORIAMENTE -> "É PROIBIDA A permanência".
  - Se vier sem artigo/determinante: FICA NO MASCULINO INVARIÁVEL -> "É PROIBIDO permanência".
• B) INCORRETA. O vocábulo "meio" modificando adjetivo ("preocupada") atua como ADVÉRBIO DE INTENSIDADE (= um pouco, ligeiramente). Advérbio é classe invariável! Jamais existe "meia preocupada" nem "meia nervosa" na norma culta! O correto é: "A perita estava MEIO preocupada".
• C) CORRETA. O vocábulo "anexo" é adjetivo e concorda em gênero e número com o substantivo a que se refere: "os relatórios periciais seguem ANEXOS aos autos". (Atenção: a locução "em anexo" é invariável, mas a frase usou o adjetivo direto).
• D) INCORRETA. Mulheres e pessoas do gênero feminino dizem "muito OBRIGADA" (e no plural, "muito OBRIGADAS"). Apenas homens dizem "muito obrigado".
• E) INCORRETA. "Bastantes policiais" está no plural porque é pronome indefinido adjetivo (muitos policiais), logo não é invariável como alegou o parêntese.''',
    ),
    QuestaoModel(
      id: 604,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Locução Verbal com Haver',
      enunciado: 'No período "Podem haver sérias consequências caso a perícia não seja concluída a tempo", a forma verbal "Podem haver" está gramaticalmente correta.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 O VÍRUS DA IMPESSOALIDADE EM LOCUÇÕES VERBAIS:
Em locuções verbais (Verbo Auxiliar + Verbo Principal):
• Regra Geral: O verbo auxiliar conjuga e concorda com o sujeito, e o verbo principal fica na forma nominal (infinitivo, gerúndio ou particípio).
• EXCEÇÃO DE OURO (MÉTODO CRAVOU):
  Quando o verbo principal for o verbo HAVER impessoal (no sentido de existir ou ocorrer), ele "CONTAMINA" o verbo auxiliar com a sua impessoalidade!
  - O verbo auxiliar herda compulsoriamente a impessoalidade e DEVE FICAR NO SINGULAR!
  - Errado: "Podem haver consequências", "Devem haver problemas", "Vão haver mudanças".
  - Correto: "PODE HAVER sérias consequências", "DEVE HAVER problemas", "VAI HAVER mudanças".

Portanto, o plural "Podem haver" viola frontalmente a norma culta.''',
    ),
    QuestaoModel(
      id: 605,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância com Expressão Partitiva',
      enunciado: 'Na oração "A maioria dos novos soldados completou o circuito de obstáculos com louvor", a concordância verbal também estaria correta caso o verbo fosse flexionado no plural ("completaram").',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DUPLA CONCORDÂNCIA COM EXPRESSÕES PARTITIVAS:
Quando o sujeito é composto por uma EXPRESSÃO PARTITIVA no singular ("a maioria de", "a maior parte de", "grande número de", "a metade de", "uma porção de") seguida de um adjunto adnominal no PLURAL:
• A concordância verbal é FACULTATIVA, admitindo duas construções legítimas:
  1. Concordância Lógica / Gramatical: O verbo concorda no SINGULAR com o núcleo do sujeito ("A maioria... completou").
  2. Concordância Atrativa / Semântica: O verbo concorda no PLURAL com o termo especificador plural ("...dos novos soldados completaram").
Ambas as frases são 100% corretas perante os gramáticos e a banca organizadora!''',
    ),
    QuestaoModel(
      id: 606,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância do Verbo Existir',
      enunciado: 'Ao contrário do verbo haver, o verbo "existir" é pessoal e flexiona-se obrigatoriamente no plural para concordar com o seu sujeito paciente ou agente, como em "Existiam várias evidências no local".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 HAVER (IMPESSOAL) VS EXISTIR (PESSOAL):
Essa é uma das distinções mais exploradas em concursos policiais no Brasil:
1. Verbo HAVER (= existir):
   • É IMPESSOAL.
   • Não tem sujeito.
   • Fica no SINGULAR: "Havia várias evidências no local." (várias evidências = Objeto Direto).
2. Verbo EXISTIR:
   • É PESSOAL.
   • Possui sujeito próprio!
   • Concorda obrigatoriamente em número e pessoa com o sujeito: "EXISTIAM [Verbo no Plural] várias evidências [Sujeito Plural] no local."
   • E em locução verbal com existir: "PODEM EXISTIR várias evidências" (o auxiliar flexiona normalmente no plural!).

A assertiva sintetizou essa oposição doutrinária com precisão absoluta.''',
    ),
    QuestaoModel(
      id: 607,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância com Sujeito Composto',
      enunciado: 'Assinale a alternativa que apresenta concordância verbal correta para o sujeito composto posposto ao verbo:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Chegou o comandante e seus auxiliares de ordens.',
        'B': 'Chegaram o comandante e seus auxiliares de ordens.',
        'C': 'Ambas as formas "Chegou" e "Chegaram" são aceitas pela norma culta.',
        'D': 'Apenas o verbo no particípio é admitido nessa posição.',
        'E': 'O verbo deveria ficar obrigatoriamente na primeira pessoa do plural.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Ambas as formas são aceitas)

🔍 REGRAS DE CONCORDÂNCIA DO SUJEITO COMPOSTO:
A posição do sujeito composto em relação ao verbo altera as possibilidades de concordância:
1. Sujeito Composto ANTEPOSTO (Antes do verbo):
   • O comandante e seus auxiliares CHEGARAM ao quartel.
   • Regra: Concordância obrigatória no PLURAL (soma dos núcleos: 1 + 1 = 2).
2. Sujeito Composto POSPOSTO (Depois do verbo):
   • Quando o verbo vem antes do sujeito composto, a gramática admite DUAS CONCORDÂNCIAS:
     a) Concordância Atrativa: O verbo concorda exclusivamente com o primeiro núcleo mais próximo ("CHEGOU o comandante [singular] e seus auxiliares").
     b) Concordância Gramatical: O verbo vai para o plural concordando com a totalidade dos núcleos ("CHEGARAM o comandante e seus auxiliares").

Portanto, tanto a alternativa A quanto a B são válidas, tornando a alternativa C o gabarito irrefutável.''',
    ),
    QuestaoModel(
      id: 608,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância do Verbo Fazer',
      enunciado: 'Em "Fazem cinco anos que a nova sede da delegacia foi inaugurada", a forma verbal "Fazem" está em perfeita harmonia com os preceitos gramaticais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 IMPESSOALIDADE TEMPORAL DO VERBO FAZER:
O verbo FAZER, quando utilizado para expressar a passagem de tempo cronológico decorrido ou tempo decorrente:
• É rigorosamente IMPESSOAL;
• Não tem sujeito sintático;
• Deve ser mantido estritamente na 3ª pessoa do SINGULAR!
• Construção correta: "FAZ cinco anos que a nova sede foi inaugurada." (e JAMAIS "Fazem cinco anos").
• O mesmo se aplica a locuções verbais: "DEVE FAZER cinco anos" (e não "Devem fazer cinco anos").

O item incorre no erro crasso de pluralizar verbo impessoal temporal.''',
    ),
    QuestaoModel(
      id: 609,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância com Pronome Quem e Que',
      enunciado: 'Quando o sujeito é o pronome relativo "QUEM", o verbo pode concordar com o antecedente ou ficar na terceira pessoa do singular, como em "Fui eu quem assumiu a escala" ou "Fui eu quem assumi a escala".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DUELO DE CONCORDÂNCIA: PRONOME "QUE" VS PRONOME "QUEM":
1. Com o Pronome Relativo "QUE":
   • O verbo concorda OBRIGATORIAMENTE com o pronome antecedente!
   • Exemplo: "Fui eu que ASSUMI a responsabilidade." (Eu assumi).
   • Exemplo: "Fomos nós que CONQUISTAMOS a vaga." (Nós conquistamos).
2. Com o Pronome Relativo "QUEM":
   • A gramática normativa autoriza DUAS OPÇÕES de flexão:
     a) O verbo fica na 3ª pessoa do singular, concordando com o próprio pronome "quem": "Fui eu quem ASSUMIU a escala."
     b) O verbo concorda com o pronome antecedente: "Fui eu quem ASSUMI a escala."
Ambas as construções são abonadas pelos maiores filólogos (Bechara, Cunha & Cintra, Celso Pedro Luft).''',
    ),
    QuestaoModel(
      id: 610,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Nominal - Modificadores',
      enunciado: 'Assinale a alternativa que preenche corretamente as lacunas: "As declarações foram prestadas por _____ próprias e seguem _____ aos autos."',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'elas / em anexas.',
        'B': 'elas / anexo.',
        'C': 'elas / anexas.',
        'D': 'eles / anexa.',
        'E': 'elas / em anexos.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (elas / anexas)

🔍 DESTRINCHANDO A CONCORDÂNCIA DOS TERMOS:
1. Primeira lacuna ("por _____ próprias"):
   • O pronome reflexivo de reforço "próprias" está no feminino plural. Portanto, exige o pronome pessoal antecedente de terceira pessoa do plural feminino: "elas" ("por elas próprias").
2. Segunda lacuna ("e seguem _____ aos autos"):
   • O sujeito da oração é "As declarações" (feminino plural).
   • O vocábulo "anexo" atua como adjetivo predicativo e deve concordar em gênero e número com o sujeito que qualifica: declarações ANEXAS.
   • A locução prepositiva "em anexo" é invariável, mas não admite flexão de gênero/número (não existe "em anexas" nem "em anexos").
Portanto, a única combinação gramaticalmente irretocável é: "elas / anexas".''',
    ),
    QuestaoModel(
      id: 611,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Verbal - Núcleos Ligados por OU',
      enunciado: 'Quando dois núcleos do sujeito composto são ligados pela conjunção "OU" com valor de exclusão mútua, o verbo deve ficar no singular.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 O COMPORTAMENTO DO CONECTIVO "OU" NA CONCORDÂNCIA:
A conjunção coordenativa alternativa "OU" pode expressar dois valores lógicos diametralmente opostos:
1. Valor de EXCLUSÃO ou RETIFICAÇÃO (Apenas um elemento pode praticar a ação):
   • O verbo fica OBRIGATORIAMENTE no SINGULAR!
   • Exemplo: "O coronel Rocha ou o coronel Mendes SERÁ [singular] o novo Comandante Geral." (Apenas um oficial pode ocupar o posto de comandante supremo; a vitória de um exclui o outro).
2. Valor de INCLUSÃO / SIMULTANEIDADE (Ambos os elementos podem praticar a ação concomitantemente):
   • O verbo vai OBRIGATORIAMENTE para o PLURAL!
   • Exemplo: "A dedicação ou a persistência LEVAM [plural] o candidato à aprovação." (Ambas as virtudes operam juntas somando forças).

Como o enunciado especificou expressamente o caso de exclusão mútua, o verbo deve ficar no singular.''',
    ),
    QuestaoModel(
      id: 612,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância do Verbo Parecer',
      enunciado: 'Na locução "As viaturas pareciam voar pelo asfalto", a gramática também admite a flexão "As viaturas parecia voarem".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A PECULIAR REGRA DE CONCORDÂNCIA DO VERBO PARECER + INFINITIVO:
Quando o verbo "parecer" é associado a um verbo no infinitivo com sujeito plural, a gramática normativa consagra DUAS CONSTRUÇÕES válidas, com uma regra estrita: FLEXIONA-SE APENAS UM DOS VERBOS!
1. Flexiona-se o verbo "parecer" e mantém-se o infinitivo impessoal (construção mais comum e elegante):
   • "As viaturas PARECIAM voar."
2. Mantém-se o verbo "parecer" invariável no singular (atuando como oração principal unipessoal: parecia que voavam) e flexiona-se o infinitivo pessoal no plural:
   • "As viaturas PARECIA VOAREM."
⚠️ ERRO PROIBIDO: Flexionar os dois verbos simultaneamente ("As viaturas pareciam voarem" é reprovado pela norma padrão!).''',
    ),
    QuestaoModel(
      id: 613,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Verbal com Porcentagem',
      enunciado: 'Em "Cerca de 20% da tropa foi destacada para o reforço no interior", a concordância com o substantivo "tropa" no singular é gramaticalmente aceita.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 CONCORDÂNCIA COM NÚMEROS PERCENTUAIS E ESPECIFICADORES:
Nas orações em que o sujeito é expresso por uma porcentagem acompanhada de termo especificador preposicionado:
• A concordância pode ser feita de duas maneiras:
  1. Com o numeral percentual: "20%" é maior que 1, logo atrai o verbo para o plural: "20% da tropa FORAM DESTACADOS...".
  2. Com o substantivo especificador: "da tropa" é um substantivo coletivo no singular, autorizando a concordância no singular: "20% da tropa FOI DESTACADA...".
• A presença de expressões aproximativas ("cerca de", "perto de", "mais de") não altera essa regra de concordância.
Portanto, a concordância no singular apresentada no enunciado é plenamente aceita e legítima.''',
    ),
    QuestaoModel(
      id: 614,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância Nominal - Menos e Alerta',
      enunciado: 'As palavras "menos" e "alerta" são rigorosamente invariáveis na língua culta, sendo erro crasso escrever "menas" ou "alertas".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 INVARIABILIDADE ABSOLUTA DE "MENOS" E "ALERTA":
1. Palavra "MENOS":
   • Trata-se de advérbio ou pronome indefinido invariável.
   • A palavra "menas" NÃO EXISTE na língua portuguesa culta!
   • Exemplo: "Havia MENOS viaturas nas ruas", "Ela tinha MENOS paciência".
2. Palavra "ALERTA":
   • Na função adverbial ou de predicativo com sentido de "em estado de atenção" (derivado do grito militar italiano all'erta): é INVARIÁVEL!
   • Exemplo: "Os policiais permaneceram ALERTA durante todo o plantão" (e não "alertas").
   • (Atenção: como substantivo, admite plural: "O comandante emitiu vários alertas sonoros").

A assertiva retrata fielmente essas duas pegadinhas tradicionais de bancas organizadoras.''',
    ),
    QuestaoModel(
      id: 615,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Concordância com Haja Vista',
      enunciado: 'A expressão "haja vista" é consagrada como invariável pelos gramáticos contemporâneos, não devendo flexionar-se para "hajam vistas".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A POLÊMICA DE "HAJA VISTA" EM CONCURSOS PÚBLICOS:
A expressão "haja vista" equivale funcionalmente a "por exemplo", "veja-se", "tendo em vista":
• Padrão Dominante nas Bancas Examinadoras (AOCP, Cebraspe, FCC):
  - A expressão é considerada PREFERENCIALMENTE INVARIÁVEL!
  - Escreve-se: "Haja vista os problemas operacionais", "Haja vista as dificuldades encontradas".
  - A palavra "vista" nunca vai para o plural ("vistas" é incorreto).
  - Alguns gramáticos admitem a flexão do verbo haver ("hajam vista os problemas"), mas NENHUM gramático admite "hajam vistas".
• Portanto, a assertiva é 100% verdadeira: a forma "haja vista" é consagrada como invariável e "hajam vistas" é erro inadmissível.''',
    ),
  ],
);

