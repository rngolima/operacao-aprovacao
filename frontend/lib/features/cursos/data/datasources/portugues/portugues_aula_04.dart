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
      comentarioDidatico: 'CRAVOU NA C! O verbo HAVER com sentido de existir ou ocorrer é impessoal, configurando oração sem sujeito. O termo seguinte não é sujeito, mas sim OBJETO DIRETO (haver algo). Por isso, permanece rigorosamente no singular.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Orações adjetivas restritivas (sem vírgulas) limitam o universo do termo antecedente: somente aquela fração que concluiu o curso obteve a promoção.',
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
      comentarioDidatico: 'CRAVOU NA A! Vocativo é o chamamento direto do interlocutor ("Soldado Silva, ...") e deve vir rigorosamente isolado por vírgula.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Teste da voz passiva: "a prova foi destruída". Como tem valor passivo ligado ao substantivo abstrato "destruição", trata-se legitimamente de COMPLEMENTO NOMINAL.',
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
      comentarioDidatico: 'CRAVOU NA A! Quem entrega, entrega algo (a medalha de honra = Objeto Direto) a alguém (ao cabo destacado = Objeto Indireto). Verbo transitivo direto e indireto (VTDI).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O verbo "trabalhar" é intransitivo (acompanhado de adjunto adverbial de modo "com afinco"). Com verbo intransitivo + SE, a partícula atua como ÍNDICE DE INDETERMINAÇÃO DO SUJEITO.',
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
      comentarioDidatico: 'CRAVOU NA C! Em voz passiva analítica (foi localizado), o termo preposicionado que executa a ação verbal é o AGENTE DA PASSIVA ("pelos militares").',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Temos um verbo intransitivo de ação ("chegaram") e um adjetivo qualificando o sujeito no momento da ação ("exaustos" = predicativo do sujeito). Predicado verbo-nominal.',
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
      comentarioDidatico: 'CRAVOU NA B! Macete CRAVOU: "É fundamental [ISSO]" -> "ISSO é fundamental". A oração subordinada atua como o SUJEITO da oração principal ("É fundamental"). Logo, é Oração Subordinada Substantiva Subjetiva.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O aposto explicativo vem entre vírgulas elucidando ou trazendo um epíteto sobre o substantivo próprio que o antecede.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! "Com muita rapidez" expressa a maneira / o modo pelo qual a ação de alcançar foi realizada pela viatura.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A forma reduzida de gerúndio expressa simultaneidade / tempo correspondente a "no momento em que saía / quando saía".',
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
      comentarioDidatico: 'CRAVOU NA B! O verbo "amar" é transitivo direto (amar alguém). A preposição "a" antes de "Deus" é de natureza estilística / de reverência, constituindo caso clássico de OBJETO DIRETO PREPOSICIONADO.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O verbo FAZER indicando clima ou tempo decorrido é impessoal: não vai para o plural, ainda que o termo seguinte esteja no plural ("noites frias").',
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
      comentarioDidatico: 'CRAVOU NO CERTO! As orações coordenadas assindéticas não possuem síndeto (conjunção), sendo separadas por vírgula ou ponto e vírgula (ex: "Chegou, viu, venceu").',
    ),
  ],
);

