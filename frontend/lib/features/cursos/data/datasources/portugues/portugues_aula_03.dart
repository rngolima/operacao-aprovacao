import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 03: Classes de Palavras e Morfossintaxe
final AulaGuiaItem portuguesAula03 = AulaGuiaItem(
  numero: '03',
  titulo: 'Classes de Palavras e Morfossintaxe (Substantivo, Adjetivo, Pronomes, Verbos e Conjunções)',
  detalhes: '20 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# CLASSES DE PALAVRAS E MORFOSSINTAXE ESTRATÉGICA

## 1. O SISTEMA DAS 10 CLASSES DE PALAVRAS
- **Classes Variáveis (6)**: Substantivo, Artigo, Adjetivo, Numeral, Pronome, Verbo.
- **Classes Invariáveis (4)**: Advérbio, Preposição, Conjunção, Interjeição.

---

## 2. CONJUNÇÕES: O TÓPICO MAIS COBRADO EM CONCURSOS
1. **Conjunções Coordenativas (Mnemônico CA-AD-AL-EX-CON)**:
   - **C**onclusivas: portanto, logo, por conseguinte, pois (posposto ao verbo).
   - **Ad**versativas: mas, porém, contudo, todavia, entretanto, no entanto.
   - **Al**ternativas: ou... ou, ora... ora, quer... quer.
   - **Ex**plicativas: porque, que, pois (anteposto ao verbo), porquanto.
   - **Ad**itivas: e, nem, não só... mas também.
2. **Conjunções Subordinativas Adverbiais (Mnemônico 6C + FTP)**:
   - **Causais**: porque, já que, visto que, como (no início da frase), uma vez que.
   - **Comparativas**: como, tal qual, mais... do que.
   - **Concessivas (CAMPEÃS DE PROVA)**: embora, ainda que, mesmo que, conquanto, a despeito de, posto que, se bem que. *(Indicam quebra de expectativa sem anular o fato principal).*
   - **Condicionais**: se, caso, desde que, contanto que.
   - **Conformativas**: conforme, segundo, consoante, como.
   - **Consecutivas**: tão... que, tanto... que, de sorte que.
   - **Finais**: a fim de que, para que.
   - **Temporais**: quando, enquanto, assim que, logo que.
   - **Proporcionais**: à proporção que, à medida que.

---

## 3. PRONOMES RELATIVOS E VALOR MORFOSSINTÁTICO
- **Pronome Relativo QUE**:
  - Introduz oração subordinada adjetiva.
  - Teste CRAVOU: Substitua por "o qual / a qual". Se couber, É PRONOME RELATIVO.
  - Se for precedido por verbo cognoscente e puder ser substituído por "ISSO", É **CONJUNÇÃO INTEGRANTE** (introduz oração subordinada substantiva).
- **Pronome Cujo / Cuja**:
  - Estabelece relação de posse entre dois substantivos (*O policial cuja arma foi apreendida...*).
  - NUNCA admite artigo após si (ERRADO: *cujo o*, *cuja a*).

---

## 4. COLOCAÇÃO PRONOMINAL (PRÓCLISE, MESÓCLISE E ÊNCLISE)
1. **Próclise Obrigatória (Palavras Atrativas)**:
   - Palavras negativas (*não, nunca, jamais*).
   - Pronomes relativos (*que, quem, cujo*).
   - Pronomes indefinidos e demonstrativos (*alguém, tudo, isso*).
   - Advérbios curtos sem pausa de vírgula (*aqui, sempre, talvez*).
   - Orações optativas, interrogativas e exclamativas.
2. **Mesóclise**:
   - Verbos no Futuro do Presente ou Futuro do Pretérito, desde que NÃO haja palavra atrativa (*Apresentar-se-á ao batalhão*).
3. **Ênclise**:
   - Início de oração (*Apresente-se imediatamente!*). NUNCA inicie oração com pronome oblíquo na norma culta.''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Morfossintaxe e Classes de Palavras',
    conceitoCentral: 'Classificação e Função Sintática no Padrão das Bancas',
    regraDeOuro: 'Conjunção estabelece o nexo semântico; conectivo concessivo quebra expectativa sem anular a oração principal!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Conjunções Coordenadas',
        subtitulo: 'Mnemônico CA-AD-AL-EX-CON',
        corRamo: Color(0xFF2563EB),
        icone: Icons.alt_route,
        itens: [
          MapaMentalItem(
            titulo: 'Adversativas (Oposição)',
            descricao: 'mas, porém, contudo, todavia, entretanto, no entanto.',
            exemplo: 'Estudou bastante, porém não fez simulados.',
          ),
          MapaMentalItem(
            titulo: 'Conclusivas (Dedução)',
            descricao: 'logo, portanto, por conseguinte, desse modo.',
            exemplo: 'Cumpriu a escala, logo terá folga amanhã.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Conjunções Subordinadas',
        subtitulo: 'Mnemônico 6C + FTP',
        corRamo: Color(0xFFDC2626),
        icone: Icons.account_tree,
        itens: [
          MapaMentalItem(
            titulo: 'Concessivas (Quebra Suave)',
            descricao: 'embora, conquanto, ainda que, a despeito de.',
            mnemonico: 'Oposição que não impede o evento principal',
            exemplo: 'Embora chovesse, os policiais patrulharam.',
          ),
          MapaMentalItem(
            titulo: 'Causais (Motivo Real)',
            descricao: 'porque, visto que, já que, como (início da frase).',
            exemplo: 'Como estava frio, vestiu o casaco tático.',
          ),
          MapaMentalItem(
            titulo: 'Finais (Objetivo)',
            descricao: 'a fim de que, para que.',
            exemplo: 'Treinou muito a fim de alcançar a nota de corte.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Pronomes e o Teste do QUE',
        subtitulo: 'Distingue Pronome Relativo de Conjunção Integrante',
        corRamo: Color(0xFF059669),
        icone: Icons.psychology,
        itens: [
          MapaMentalItem(
            titulo: 'Pronome Relativo',
            descricao: 'Substituível por "o qual / a qual". Inicia oração adjetiva.',
            exemplo: 'O soldado que (o qual) treinou foi aprovado.',
          ),
          MapaMentalItem(
            titulo: 'Conjunção Integrante',
            descricao: 'Toda a oração pode ser trocada pela palavra "ISSO". Inicia oração substantiva.',
            exemplo: 'O delegado informou que (ISSO) as buscas continuam.',
          ),
          MapaMentalItem(
            titulo: 'O Pronome "Cujo"',
            descricao: 'Posse entre dois nomes. Proibido artigo após "cujo".',
            mnemonico: 'NUNCA escreva "cujo o" ou "cuja a"!',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Colocação Pronominal',
        subtitulo: 'Próclise, Mesóclise e Ênclise',
        corRamo: Color(0xFFD97706),
        icone: Icons.swap_horiz,
        itens: [
          MapaMentalItem(
            titulo: 'Próclise (Palavra Atrativa)',
            descricao: 'Negações, pronomes relativos, indefinidos e advérbios atraem o pronome.',
            exemplo: 'Não ME deixe aqui; Quem TE falou isso?',
          ),
          MapaMentalItem(
            titulo: 'Início de Frase',
            descricao: 'Proibido próclise em início de período. Use ênclise!',
            mnemonico: '"Dê-me a arma" (Certo) vs "Me dê a arma" (Errado na norma culta).',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 301,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções',
      enunciado: 'No período: "Conquanto o policiamento ostensivo tenha sido reforçado nas ruas, os índices de roubo persistiram elevados", o conectivo "Conquanto" estabelece relação semântica de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Conclusão.',
        'B': 'Causa imediata.',
        'C': 'Concessão.',
        'D': 'Finalidade.',
        'E': 'Proporcionalidade.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! "Conquanto" é conjunção subordinativa concessiva (equivale a "embora", "ainda que", "a despeito de"), introduzindo uma oposição ou quebra de expectativa sem invalidar a oração principal.',
    ),
    QuestaoModel(
      id: 302,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Classes de Palavras - Pronome Relativo',
      enunciado: 'Em: "As estratégias QUE o batalhão adotou foram exitosas", o vocábulo destacado classifica-se morfologicamente como pronome relativo e exerce a função sintática de objeto direto.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O "que" retoma "as estratégias" ("as quais o batalhão adotou"). O batalhão adotou O QUÊ? As estratégias (objeto direto do verbo adotar). Análise morfossintática irretocável.',
    ),
    QuestaoModel(
      id: 303,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pronome Cujo',
      enunciado: 'Assinale a alternativa em que o pronome "cujo" foi empregado de acordo com a norma-padrão da língua portuguesa:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial cujo o armamento foi periciado já retornou às funções.',
        'B': 'A operação cujos objetivos foram cumpridos recebeu elogio formal.',
        'C': 'O cidadão cujo a casa foi invadida prestou depoimento.',
        'D': 'Os alunos cujos os cadernos sumiram reclamaram com a coordenação.',
        'E': 'O suspeito cujo onde estava escondido foi capturado.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! O pronome relativo "cujo" e suas variações nunca admitem artigo imediatamente após si ("cujo o", "cuja a" constituem erro gravíssimo). Em B, concordou corretamente com "objetivos" (cujos objetivos).',
    ),
    QuestaoModel(
      id: 304,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunção Integrante vs Pronome Relativo',
      enunciado: 'Na oração "O comandante confirmou que os novos soldados seriam designados para o interior", a palavra "que" classifica-se como pronome relativo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! Aplique o Teste CRAVOU: "O comandante confirmou [ISSO]". Como a oração pode ser substituída por "ISSO", o termo "que" é uma CONJUNÇÃO INTEGRANTE, introduzindo uma Oração Subordinada Substantiva Objetiva Direta.',
    ),
    QuestaoModel(
      id: 305,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Colocação Pronominal',
      enunciado: 'Assinale a alternativa que atende rigorosamente às regras de colocação pronominal:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Me diga a verdade sobre o ocorrido!',
        'B': 'Jamais enganar-te-ei com promessas vazias.',
        'C': 'Não se afaste da linha de tiro durante a instrução.',
        'D': 'Os militares apresentaram-se quando chamaram-nos.',
        'E': 'Tudo falou-me a respeito da sua coragem.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! A palavra negativa "Não" é atrativa obrigatória da próclise ("Não se afaste"). Em A, é proibido iniciar período com pronome oblíquo na norma culta. Em B, a palavra "Jamais" exige próclise ("Jamais te enganarei"). Em E, "Tudo" é pronome indefinido atrativo ("Tudo me falou").',
    ),
    QuestaoModel(
      id: 306,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Coordenativas',
      enunciado: 'No período "O suspeito tentou fugir pelos fundos, todavia foi prontamente contido pela guarnição militar", o conectivo "todavia" pode ser substituído, sem alteração do sentido original, por:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'porquanto.',
        'B': 'dessarte.',
        'C': 'contudo.',
        'D': 'conquanto.',
        'E': 'conseguinte.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! "Todavia" e "contudo" são conjunções coordenativas adversativas equivalentes (mas, porém, contudo, todavia, entretanto, no entanto). "Porquanto" é explicativo/causal; "dessarte" é conclusivo; "conquanto" é concessivo subordinativo.',
    ),
    QuestaoModel(
      id: 307,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Adjetivo e Substantivo',
      enunciado: 'Na expressão "homem pobre" e "pobre homem", a inversão da ordem dos vocábulos altera a classe gramatical das palavras mantendo rigorosamente inalterado o sentido semântico.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! A classe gramatical não muda (substantivo e adjetivo), mas o valor semântico muda drasticamente: "homem pobre" = sem recursos financeiros (sentido denotativo objetivo); "pobre homem" = coitado, digno de pena (sentido conotativo subjetivo).',
    ),
    QuestaoModel(
      id: 308,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Subordinativas',
      enunciado: 'A locução conjuntiva "à medida que" expressa ideia de proporção, enquanto a expressão "na medida em que" expressa ideia de causa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Distinção clássica: "À medida que" = proporcional (ex: À medida que treinava, ficava mais rápido). "Na medida em que" = causal / explicativo (ex: Não foi promovido na medida em que cometeu falta). Expressões como "à medida em que" são anomalias gramaticais que devem ser evitadas.',
    ),
    QuestaoModel(
      id: 309,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Advérbios',
      enunciado: 'O vocábulo "bastante" comporta-se como advérbio invariável quando modifica adjetivos, verbos ou outros advérbios, mas flexiona-se como pronome indefinido adjetivo quando modifica substantivos plurais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Como advérbio de intensidade, é invariável: "Eles estavam BASTANTE cansados". Como pronome indefinido ligado a substantivo, pluraliza: "Havia BASTANTES policiais no local" (troque por "muitos").',
    ),
    QuestaoModel(
      id: 310,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tempos e Modos Verbais',
      enunciado: 'Na frase: "Se os candidatos estudassem o edital com rigor, obteriam melhores notas na prova", a forma verbal "estudassem" está conjugada no:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Pretérito imperfeito do subjuntivo.',
        'B': 'Futuro do pretérito do indicativo.',
        'C': 'Pretérito mais-que-perfeito do subjuntivo.',
        'D': 'Presente do subjuntivo.',
        'E': 'Pretérito perfeito do indicativo.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: 'CRAVOU NA A! A terminação "-sse" (estudassem, fizessem, comprassem) é a desinência típica do pretérito imperfeito do subjuntivo, expressando hipótese ou condição correlacionada ao futuro do pretérito ("obteriam").',
    ),
    QuestaoModel(
      id: 311,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Morfossintaxe do SE',
      enunciado: 'Em "Constatou-se a irregularidade nos livros contábeis", a partícula "se" atua como índice de indeterminação do sujeito.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! O verbo "constatar" é transitivo direto (quem constata, constata algo). Com verbo transitivo direto (VTD) + SE, a partícula é PRONOME APASSIVADOR (partícula apassivadora), e o termo "a irregularidade" é o SUJEITO PACIENTE ("A irregularidade foi constatada").',
    ),
    QuestaoModel(
      id: 312,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Preposições e Valores Semânticos',
      enunciado: 'Em "O policial defendeu a comunidade COM bravura", a preposição "com" introduz circunstância de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Companhia.',
        'B': 'Instrumento.',
        'C': 'Modo.',
        'D': 'Causa.',
        'E': 'Conformidade.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! "Com bravura" indica o modo como a ação foi executada (bravamente). Não é companhia ("com amigos") nem instrumento ("com arma de fogo").',
    ),
    QuestaoModel(
      id: 313,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pronomes Demonstrativos',
      enunciado: 'O pronome "este" (e suas variações) é empregado para fazer referência a algo que ainda será dito no texto (catáfora), enquanto "esse" refere-se a algo imediatamente mencionado antes (anáfora).',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Uso textual do pronome demonstrativo: ESTE antecipa informação ("O dever é este: honrar a farda"); ESSE retoma termo já citado ("Honrar a farda: esse é o nosso dever").',
    ),
    QuestaoModel(
      id: 314,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Coordenativas',
      enunciado: 'A conjunção "pois", quando colocada depois do verbo da oração (posposta), possui valor estritamente conclusivo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Regra do "POIS": se estiver antes do verbo, é explicativo/causal (ex: "Não saia, pois está perigoso"). Se estiver entre vírgulas depois do verbo, é CONCLUSIVO (ex: "Treinou incansavelmente; será, pois, aprovado").',
    ),
    QuestaoModel(
      id: 315,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Artigo Definido e Indefinido',
      enunciado: 'O emprego do artigo indefinido antes de substantivo próprio, como em "Ele pensa que é um Sherlock Holmes da perícia", produz efeito semântico de aproximação estilística ou comparação figurada.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O artigo indefinido diante de substantivo próprio atribui valor conotativo de semelhança ("alguém que se assemelha às características do célebre detetive").',
    ),
  ],
);

