import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 05: Emprego dos Sinais de Pontuação
final AulaGuiaItem portuguesAula05 = AulaGuiaItem(
  numero: '05',
  titulo: 'Emprego dos Sinais de Pontuação (Vírgula Obrigatória, Proibida e Facultativa)',
  detalhes: '16 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# GUIA DEFINITIVO DE PONTUAÇÃO PARA CONCURSOS PÚBLICOS

## 1. AS DUAS GRANDES PROIBIÇÕES DA VÍRGULA (REGRA SUPREMA)
1. **JAMAIS separe o SUJEITO do seu PREDICADO (VERBO)** por vírgula simples!
   - ERRADO: *Os novos soldados da PMPE, chegaram ao quartel.*
   - CERTO: *Os novos soldados da PMPE chegaram ao quartel.*
   - ATENÇÃO: É permitida intercalação entre DUAS vírgulas (*Os novos soldados, após o teste físico, chegaram ao quartel*).
2. **JAMAIS separe o VERBO do seu COMPLEMENTO (OD / OI)** por vírgula simples!
   - ERRADO: *O perito criminal constatou, a existência de impressões digitais.*
   - CERTO: *O perito criminal constatou a existência de impressões digitais.*
3. **JAMAIS separe o NOME do seu COMPLEMENTO NOMINAL ou ADJUNTO ADNOMINAL** por vírgula!

---

## 2. CASOS DE VÍRGULA OBRIGATÓRIA
1. **Isolar o Vocativo**:
   - *Atenção, candidatos, iniciem a prova agora.*
2. **Isolar o Aposto Explicativo**:
   - *O Instituto AOCP, organizador do certame, divulgou o gabarito preliminar.*
3. **Isolar Adjunto Adverbial Deslocado de Grande Extensão** (3 ou mais palavras):
   - *Durante o treinamento de tiro noturno, todos os alunos mantiveram a concentração.*
4. **Isolar Orações Subordinadas Adverbiais Antepostas ou Intercaladas**:
   - *Embora chovesse torrencialmente, o policiamento a pé foi realizado.*
5. **Separar Orações Coordenadas Assindéticas ou Adversativas/Conclusivas**:
   - *O suspeito correu, pulou o muro, mas foi interceptado pelo cerco tático.*
6. **Separar Itens de uma Enumeração**:
   - *Apreenderam munições, rádios comunicadores, celulares e dinheiro em espécie.*
7. **Marcar a Omissão (Elipse / Zeugma) de um Verbo**:
   - *Eu estudei Direito Constitucional; ele, Língua Portuguesa.* (Vírgula zeugmática).

---

## 3. CASOS DE VÍRGULA FACULTATIVA
1. **Adjunto Adverbial Deslocado de Curta Extensão** (1 ou 2 palavras):
   - *Ontem(,) os policiais realizaram a operação no centro.*
2. **Antes da Conjunção Aditiva "E"**:
   - Quando os sujeitos das duas orações forem diferentes: *O alarme tocou(,) e os seguranças correram.*

---

## 4. PONTO E VÍRGULA, DOIS-PONTOS E TRAVESSÃO
- **Ponto e Vírgula ( ; )**:
  - Separa orações coordenadas longas que já contenham vírgulas internas.
  - Separa itens numerados ou alíneas em textos de lei e editais.
- **Dois-Pontos ( : )**:
  - Introduz citação direta, fala de personagem ou enumeração/esclarecimento apositivo.
- **Travessão Duplo ( — )**:
  - Substitui as vírgulas ou os parênteses para isolar expressões explicativas ou comentários enfáticos do autor.''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Pontuação e Uso da Vírgula',
    conceitoCentral: 'Regras Posicionais e Semânticas de Pontuação',
    regraDeOuro: 'Nunca separe Sujeito do Verbo nem Verbo do Objeto com uma vírgula; Vocativo e Aposto explicativo sempre se isolam!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Casos Proibidos',
        subtitulo: 'Erros fatais na prova',
        corRamo: Color(0xFFDC2626),
        icone: Icons.block,
        itens: [
          MapaMentalItem(
            titulo: 'Sujeito + Verbo',
            descricao: 'Proibido vírgula simples entre sujeito e predicado.',
            mnemonico: 'S-V-O nunca se quebra com vírgula isolada!',
          ),
          MapaMentalItem(
            titulo: 'Verbo + Complemento',
            descricao: 'Proibido separar VTD/VTI do seu Objeto Direto/Indireto.',
            exemplo: '"O policial prendeu, o suspeito" (ERRADO).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Casos Obrigatórios',
        subtitulo: 'Exigência absoluta da norma culta',
        corRamo: Color(0xFF059669),
        icone: Icons.verified,
        itens: [
          MapaMentalItem(
            titulo: 'Vocativo e Aposto',
            descricao: 'Vocativo isolado sempre; aposto explicativo entre pontuação dupla.',
            exemplo: 'Recife, capital pernambucana, recebeu novos soldados.',
          ),
          MapaMentalItem(
            titulo: 'Adjunto Adverbial Longo Deslocado',
            descricao: '3 ou mais palavras no início da oração exigem vírgula.',
            exemplo: 'No início da tarde de ontem, iniciaram a operação.',
          ),
          MapaMentalItem(
            titulo: 'Vírgula Zeugmática',
            descricao: 'Indica a omissão deliberada de um verbo já citado.',
            exemplo: 'Ela comprou a apostila; eu, o curso em vídeo.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Casos Facultativos',
        subtitulo: 'Preferência de estilo do redator',
        corRamo: Color(0xFF2563EB),
        icone: Icons.rule,
        itens: [
          MapaMentalItem(
            titulo: 'Adjunto Adverbial Curto Deslocado',
            descricao: 'Uma ou duas palavras no início ou meio (ontem, hoje, aqui).',
            exemplo: 'Hoje(,) os policiais treinaram tiro tático.',
          ),
          MapaMentalItem(
            titulo: 'Conjunção "E" com Sujeitos Distintos',
            descricao: 'Vírgula facultativa antes do "e" quando os sujeitos diferem.',
            exemplo: 'O sino tocou, e o soldado apresentou-se.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Outros Sinais de Pontuação',
        subtitulo: 'Ponto e vírgula, dois-pontos e travessão',
        corRamo: Color(0xFFD97706),
        icone: Icons.edit_attributes,
        itens: [
          MapaMentalItem(
            titulo: 'Ponto e Vírgula (;)',
            descricao: 'Separa orações coordenadas com vírgulas internas ou alíneas de lei.',
          ),
          MapaMentalItem(
            titulo: 'Dois-Pontos (:)',
            descricao: 'Anunciam enumeração, citação textual ou explicação.',
          ),
          MapaMentalItem(
            titulo: 'Travessões Duplos (—)',
            descricao: 'Isolam termos com ênfase estilística substitutiva às vírgulas.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 501,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação - Uso da Vírgula',
      enunciado: 'Assinale a opção em que a vírgula foi empregada para isolar um adjunto adverbial deslocado:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Policiais militares, mantenham a atenção redobrada.',
        'B': 'Naquela fria manhã de inverno, a tropa desfilou com garbo no quartel.',
        'C': 'O sargento Lima, comandante do destacamento, agradeceu o apoio da população.',
        'D': 'Apreenderam celulares, documentos falsificados, armas de fogo e coletes.',
        'E': 'O suspeito tentou fugir, mas foi cercado pelos agentes.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! "Naquela fria manhã de inverno" é um adjunto adverbial de tempo deslocado de longa extensão (5 palavras), cuja vírgula é obrigatória pela norma-padrão. Em A temos vocativo; em C aposto; em D enumeração; em E conjunção adversativa.',
    ),
    QuestaoModel(
      id: 502,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação Proibida',
      enunciado: 'É gramaticalmente incorreto o emprego de vírgula simples entre o sujeito e o seu respectivo predicado na ordem direta da oração.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Regra pétrea da língua portuguesa: nunca se separa por vírgula simples o termo que funciona como sujeito do verbo de que ele depende sintaticamente.',
    ),
    QuestaoModel(
      id: 503,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação - Casos Gerais',
      enunciado: 'Assinale a alternativa em que a pontuação está plenamente correta segundo o padrão culto:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial militar com muita coragem, resgatou a vítima das águas.',
        'B': 'Durante a audiência os réus, permaneceram em silêncio.',
        'C': 'Todos os concursandos sabem, que a persistência garante a aprovação.',
        'D': 'O capitão, ciente das dificuldades logísticas, organizou o comboio de suprimentos.',
        'E': 'Os documentos foram entregues, ao juiz da comarca de Olinda.',
      },
      gabaritoOficial: 'D',
      comentarioDidatico: 'CRAVOU NA D! A oração reduzida adjetiva intercalada "ciente das dificuldades logísticas" está corretamente isolada entre duas vírgulas. Nas demais alternativas há separações indevidas de sujeito e verbo ou de verbo e objeto.',
    ),
    QuestaoModel(
      id: 504,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Vírgula Facultativa',
      enunciado: 'No início de um período, a vírgula que sucede adjuntos adverbiais de curta extensão (como "Hoje" ou "Ontem") é de emprego facultativo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Adjuntos adverbiais de pequena extensão (até duas palavras) quando antepostos admitem pontuação facultativa ("Ontem, o suspeito se entregou" ou "Ontem o suspeito se entregou").',
    ),
    QuestaoModel(
      id: 505,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Vírgula Zeugmática',
      enunciado: 'Em: "Os oficiais ocuparam a primeira fileira; os praças, a segunda", a vírgula após "praças" justifica-se para:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Isolar vocativo de reverência militar.',
        'B': 'Marcar a elipse/zeugma do verbo "ocuparam".',
        'C': 'Separar o sujeito do predicativo do objeto.',
        'D': 'Destacar adjunto adverbial de lugar deslocado.',
        'E': 'Assinalar oração coordenada sindética adversativa.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! É a famosa vírgula vicária ou zeugmática: substitui e marca a elipse do verbo "ocuparam" previamente expresso na oração antecedente.',
    ),
    QuestaoModel(
      id: 506,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Dois-Pontos e Travessão',
      enunciado: 'A substituição das vírgulas que isolam um aposto explicativo por travessões duplos mantém a correção gramatical e o sentido original do enunciado.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Travessões duplos e parênteses podem substituir legitimamente as vírgulas explicativas sem prejuízo sintático ou semântico.',
    ),
    QuestaoModel(
      id: 507,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Orações Adjetivas e Pontuação',
      enunciado: 'Considere as frases: I. "Os candidatos que estudaram com dedicação foram aprovados." II. "Os candidatos, que estudaram com dedicação, foram aprovados." A respeito das duas frases, é correto afirmar:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'A frase I é gramaticalmente incorreta por ausência de vírgulas.',
        'B': 'A frase II é gramaticalmente incorreta por excesso de vírgulas.',
        'C': 'Ambas são corretas, mas na frase I apenas parte dos candidatos foi aprovada, e na frase II todos os candidatos estudaram e foram aprovados.',
        'D': 'O sentido de ambas as frases é estritamente idêntico perante a norma padrão.',
        'E': 'Na frase II a oração tem valor restritivo.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! Em I a oração é adjetiva restritiva (sem vírgulas): apenas os que estudaram passaram. Em II a oração é adjetiva explicativa (com vírgulas): generaliza que todos os candidatos estudaram e foram aprovados.',
    ),
    QuestaoModel(
      id: 508,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunção "E" e Vírgula',
      enunciado: 'É admitido o emprego de vírgula antes da conjunção aditiva "e" quando as orações coordenadas por ela unidas possuírem sujeitos diferentes.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Exemplo: "O comandante deu a ordem, e os soldados avançaram". Como os sujeitos são distintos ("O comandante" vs "os soldados"), a vírgula antes do "e" é plenamente admitida.',
    ),
    QuestaoModel(
      id: 509,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Ponto e Vírgula',
      enunciado: 'O ponto e vírgula é recomendado para separar orações coordenadas já extensas que contenham vírgulas internas ou para elencar incisos e alíneas legais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O ponto e vírgula indica pausa intermediária entre a vírgula e o ponto final, organizando períodos complexos.',
    ),
    QuestaoModel(
      id: 510,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação - Erro de Emprego',
      enunciado: 'Assinale a alternativa que apresenta ERRO de pontuação:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Embora o percurso fosse longo, ninguém demonstrou cansaço.',
        'B': 'O governador de Pernambuco, sancionou a lei que reajustou os salários da corporação.',
        'C': 'Caros cidadãos, preservem o patrimônio público de sua cidade.',
        'D': 'Recife, linda cidade litorânea, atrai turistas do mundo inteiro.',
        'E': 'Chegaram os reforços policiais, e a ordem foi restabelecida com rapidez.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! Há vírgula simples separando o sujeito "O governador de Pernambuco" do seu verbo predicador "sancionou", o que viola regra basilar da língua portuguesa.',
    ),
    QuestaoModel(
      id: 511,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Conjunções Adversativas e Pontuação',
      enunciado: 'A conjunção adversativa "porém", quando deslocada para o meio ou fim da oração, deve vir obrigatoriamente isolada entre duas vírgulas.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Conjunções adversativas deslocadas (porém, contudo, todavia, no entanto) devem vir entre vírgulas (ex: "O plano era arriscado; obteve, contudo, total sucesso").',
    ),
    QuestaoModel(
      id: 512,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Aspas',
      enunciado: 'As aspas são empregadas para assinalar citações textuais diretas, neologismos, gírias ou termos usados com sentido irônico.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Esse é o rol canônico de emprego das aspas na produção textual formal.',
    ),
    QuestaoModel(
      id: 513,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação de Expressões Explicativas',
      enunciado: 'Expressões retificativas e explicativas como "ou seja", "isto é", "a saber" e "por exemplo" devem vir isoladas por vírgulas.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Locuções explicativas, corretivas ou continuativas exigem isolamento por vírgulas (ex: "O suspeito confessou, isto é, colaborou com a justiça").',
    ),
    QuestaoModel(
      id: 514,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Uso dos Parênteses',
      enunciado: 'Os parênteses podem ser utilizados para inserir informações acessórias, comentários marginais ou dados bibliográficos no texto.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Função precípua dos parênteses na organização frasal da norma culta.',
    ),
    QuestaoModel(
      id: 515,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pontuação e Paralelismo Sintático',
      enunciado: 'A manutenção do paralelismo em enumerações exige que os termos listados e separados por vírgula guardem idêntica estrutura gramatical (por exemplo, todos substantivos ou todos orações verbais).',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O paralelismo sintático exige harmonia estrutural nos elementos coordenados e pontuados.',
    ),
  ],
);

