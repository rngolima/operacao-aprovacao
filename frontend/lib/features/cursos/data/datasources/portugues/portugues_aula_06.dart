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
      comentarioDidatico: 'CRAVOU NA B! O verbo "apurar" é transitivo direto (quem apura, apura algo). Em "Apuraram-se todas as circunstâncias do crime", a partícula "se" é apassivadora, logo o verbo deve concordar no plural com o sujeito paciente "todas as circunstâncias do crime". Em C e D os verbos são VTI e devem ficar no singular ("Precisa-se", "Trata-se"). Em A e E os sujeitos pacientes estão no plural e exigiam plural ("Identificaram-se", "Comentaram-se").',
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
      comentarioDidatico: 'CRAVOU NO ERRO! O verbo HAVER com o sentido de existir ou ocorrer é impessoal: não possui sujeito e deve obrigatoriamente permanecer na terceira pessoa do singular ("Havia muitos policiais").',
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
      comentarioDidatico: 'CRAVOU NA C! O adjetivo "anexos" concorda em gênero e número com "os relatórios periciais". Em A, a presença do artigo "a" exige "É proibida a permanência". Em B, "meio" advérbio é invariável ("meio preocupada"). Em D, mulheres dizem "muito obrigadas".',
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
      comentarioDidatico: 'CRAVOU NO ERRO! Em locuções verbais cujo verbo principal é impessoal (como HAVER no sentido de existir), o verbo auxiliar herda a impessoalidade e DEVE ficar no singular: "Pode haver sérias consequências".',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Com expressões partitivas (a maioria de, grande parte de) seguidas de termo no plural, a concordância é facultativa: pode concordar com o núcleo singular "a maioria" (completou) ou com o termo plural "dos novos soldados" (completaram).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O verbo EXISTIR tem sujeito ("várias evidências") e concorda regularmente em número e pessoa ("Existiam várias evidências").',
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
      comentarioDidatico: 'CRAVOU NA C! Quando o sujeito composto vem DEPOIS do verbo (posposto), o verbo pode concordar com o núcleo mais próximo ("Chegou o comandante...") ou ir para o plural concordando com a totalidade dos núcleos ("Chegaram o comandante e seus auxiliares...").',
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
      comentarioDidatico: 'CRAVOU NO ERRO! O verbo FAZER indicando transcurso de tempo é impessoal e não admite plural: o correto é "Faz cinco anos...".',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Com o pronome "quem", admitem-se as duas construções: concordância com o antecedente ("eu ... assumi") ou na 3ª do singular ("quem assumiu"). Diferentemente, com o pronome "que", concorda estritamente com o antecedente ("Fui eu que assumi").',
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
      comentarioDidatico: 'CRAVOU NA C! "Por elas próprias" (concordância com o pronome feminino plural) e "as declarações seguem anexas" (adjetivo concorda com declarações). A locução "em anexo" seria invariável, mas não há a preposição "em" na lacuna de C.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Exemplo: "O soldado Lima ou o soldado Souza será o campeão de tiro". Como apenas um pode ser o campeão (exclusão), o verbo fica no singular. Se houvesse inclusão (ex: "Frio ou chuva não o desanimam"), iria para o plural.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Com o verbo "parecer" seguido de infinitivo, flexiona-se apenas um dos verbos: ou flexiona parecer ("pareciam voar") ou flexiona o infinitivo ("parecia voarem"). Ambas são corretas na norma culta.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Em porcentagens seguidas de especificador ("da tropa"), pode-se concordar com o numeral (20% -> foram destacados) ou com o termo partitivo singular (da tropa -> foi destacada).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A palavra "menos" é sempre invariável ("Havia menos viaturas"). O vocábulo "alerta" como advérbio/adjetivo derivado de comando é invariável ("Os soldados ficaram alerta").',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O padrão culto e a jurisprudência das bancas abonam preferencialmente a forma invariável "haja vista os problemas relatados".',
    ),
  ],
);

