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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Adjunto Adverbial Deslocado)

🔍 DESTRINCHANDO AS FUNÇÕES DA VÍRGULA ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A vírgula isola um VOCATIVO ("Policiais militares"), que é o chamamento direto da tropa.
• B) CORRETA. O segmento "Naquela fria manhã de inverno" é uma Locução Adverbial Temporal de LONGA EXTENSÃO (composta por 5 palavras). Na ordem direta, o adjunto adverbial fica ao final da oração ("A tropa desfilou no quartel naquela fria manhã..."). Ao ser deslocado para o início do período, a regra gramatical determina que a vírgula é DE USO ESTRITAMENTE OBRIGATÓRIO!
• C) INCORRETA. As vírgulas isolam um APOSTO EXPLICATIVO ("comandante do destacamento"), termo de natureza substantiva que esclarece quem é o sargento Lima.
• D) INCORRETA. As vírgulas separam elementos de mesma função sintática em uma ENUMERAÇÃO (núcleos do objeto direto: celulares, documentos, armas).
• E) INCORRETA. A vírgula separa ORAÇÃO COORDENADA SINDÉTICA ADVERSATIVA introduzida pela conjunção "mas".

💡 CRITÉRIO DE TAMANHO DO ADJUNTO ADVERBIAL DESLOCADO (PADRÃO DE BANCA):
• Curta Extensão (1 a 2 palavras, ex: "Ontem,", "Aqui,"): Vírgula FACULTATIVA.
• Longa Extensão (3 ou mais palavras, ex: "Naquela fria manhã de inverno,"): Vírgula OBRIGATÓRIA!''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A REGRA MAIS SAGRADA DA PONTUAÇÃO (PROIBIÇÃO PÉTREA):
Na sintaxe da língua portuguesa, é TERMINANTEMENTE PROIBIDO usar vírgula simples entre os termos essenciais e integrantes que possuem ligação sintática direta imediata:
1. NUNCA se separa o SUJEITO do seu VERBO / PREDICADO!
   • Errado: "O soldado da PMPE, efetuou o disparo de advertência."
   • Correto: "O soldado da PMPE efetuou o disparo de advertência."
2. NUNCA se separa o VERBO do seu OBJETO (Direto ou Indireto)!
   • Errado: "O delegado ouviu, as testemunhas."
   • Correto: "O delegado ouviu as testemunhas."
3. NUNCA se separa o NOME do seu COMPLEMENTO NOMINAL ou ADJUNTO ADNOMINAL!

⚠️ A ÚNICA EXCEÇÃO APARENTE:
Se houver um termo intercalado (como um adjunto adverbial longo ou um aposto), serão necessárias DUAS VÍRGULAS (uma para abrir e outra para fechar a intercalação):
• Exemplo: "O soldado, [com frieza exemplar], efetuou o disparo."''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: D

🔍 DESTRINCHANDO CADA ALTERNATIVA E SEUS ERROS:
• A) INCORRETA. Erro de vírgula única: "com muita coragem" é adjunto adverbial intercalado entre sujeito ("O policial militar") e verbo ("resgatou"). Exige DUAS vírgulas ("O policial militar, com muita coragem, resgatou...") ou NENHUMA vírgula. Do jeito que está, separou indevidamente sujeito e predicado.
• B) INCORRETA. Erro gravíssimo: separou o sujeito "os réus" do verbo "permaneceram" com vírgula simples. O correto seria pontuar o adjunto inicial: "Durante a audiência, os réus permaneceram...".
• C) INCORRETA. Erro clássico: separou o verbo transitivo direto ("sabem") da sua oração subordinada substantiva objetiva direta ("que a persistência garante a aprovação").
• D) CORRETA. O termo intercalado "ciente das dificuldades logísticas" (oração adjetiva reduzida de particípio com valor explicativo) foi perfeitamente isolado entre DUAS vírgulas simétricas.
• E) INCORRETA. Separou o verbo passivo ("foram entregues") do seu objeto indireto ("ao juiz").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ADJUNTOS ADVERBIAIS ANTEPOSTOS: REGRA DA FACULDADE:
A Academia Brasileira de Letras (ABL) e os principais manuais de redação oficial (Presidência da República, Cebraspe, FCC, AOCP) estabelecem o seguinte critério objetivo de extensão para adjuntos adverbiais deslocados para o início da oração:
1. Curta Extensão (Advérbios monossilábicos, dissilábicos ou até duas palavras):
   • O emprego da vírgula é FACULTATIVO.
   • Ambas as construções são 100% corretas:
     - "Hoje, realizaremos a inspeção das viaturas." (Com vírgula)
     - "Hoje realizaremos a inspeção das viaturas." (Sem vírgula)
     - "Ontem, o suspeito prestou depoimento." / "Ontem o suspeito prestou depoimento."
2. Longa Extensão (Três ou mais palavras):
   • O emprego da vírgula é OBRIGATÓRIO (ex: "Durante a operação na madrugada de ontem, a equipe apreendeu armas").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Vírgula de Zeugma / Vicária)

🔍 CONCEITO DE ZEUGMA E VÍRGULA VICÁRIA:
• O que é Zeugma? É a figura de sintaxe que consiste na omissão deliberada (elipse) de um termo ou palavra que JÁ FOI EXPRESSA anteriormente no mesmo período, evitando repetição cansativa.
• No período: "Os oficiais ocuparam a primeira fileira; os praças, [ocuparam] a segunda."
  - O verbo "ocuparam" foi omitido na segunda oração coordenada porque já havia sido dito na primeira.
  - A vírgula foi inserida precisamente no lugar exato onde o verbo foi suprimido.
• Nome Técnico da Vírgula: Chama-se VÍRGULA ZEUGMÁTICA (ou Vírgula Vicária).
• Descarte dos distratores:
  - Não há vocativo (ninguém está chamando os praças);
  - Não há adjunto adverbial deslocado ("a segunda" é o núcleo do objeto direto elíptico);
  - A oração é coordenada assindética, não sindética adversativa.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 INTERCAMBIABILIDADE DOS SINAIS DE PONTUAÇÃO EXPLICATIVOS:
Termos explicativos ou intercalados (em especial o APOSTO EXPLICATIVO e orações adjetivas explicativas) podem ser isolados por 3 recursos equivalentes na norma culta:
1. Duas Vírgulas: "O Batalhão de Choque, tropa de elite da PMPE, atuou na manifestação."
2. Dois Travessões: "O Batalhão de Choque — tropa de elite da PMPE — atuou na manifestação."
3. Parênteses: "O Batalhão de Choque (tropa de elite da PMPE) atuou na manifestação."

A troca mútua entre esses sinais preserva rigorosamente a correção gramatical e a coerência do texto, variando apenas o nível de ênfase visual (o travessão confere maior destaque gráfico; os parênteses conferem tom mais acessório/secundário).''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 COMPARATIVO SEMÂNTICO DEFINITIVO (RESTRITIVA VS EXPLICATIVA):
Ambas as frases obedecem integralmente à gramática normativa, porém seus sentidos lógicos são completamente diferentes:
• Frase I (Sem Vírgulas): Oração Subordinada Adjetiva RESTRITIVA.
  - Função: Delimitar um subgrupo dentro do todo.
  - Significado: Nem todos os candidatos foram aprovados. A aprovação restringiu-se estritamente àquele subconjunto de candidatos que estudou com dedicação.
• Frase II (Com Duas Vírgulas): Oração Subordinada Adjetiva EXPLICATIVA.
  - Função: Generalizar uma qualidade inerente à totalidade do conjunto.
  - Significado: TODOS os candidatos estudaram com dedicação e, consequentemente, TODOS foram aprovados.

Portanto, a alternativa C descreve com absoluta perfeição a mudança de sentido decorrente da pontuação!''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 CASOS LEGÍTIMOS DE VÍRGULA ANTES DA CONJUNÇÃO "E":
Embora a regra geral dite que não se usa vírgula antes de "e" em adições simples com mesmo sujeito, a gramática consagra hipóteses em que a vírgula é plenamente admitida ou recomendada:
1. Sujeitos Diferentes (Caso do Enunciado):
   • "O juiz assinou o mandado judicial, [e] os policiais civis cumpriram as prisões."
   • Sujeito da 1ª oração: "O juiz".
   • Sujeito da 2ª oração: "Os policiais civis".
   • Por terem agentes gramaticais distintos, a vírgula antes do "e" é plenamente autorizada e recomendada para evitar ambiguidade na leitura.
2. Polissíndeto (Repetição enfática do conectivo):
   • "O policial lutava, e avançava, e resistia bravamente."
3. Conjunção "e" com valor adversativo (= mas):
   • "Treinou muito para o teste físico, e [=mas] não atingiu a pontuação mínima."''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 AS DUAS GRANDES FUNÇÕES DO PONTO E VÍRGULA (;):
1. Organização Sintática de Períodos Complexos:
   • Quando as orações coordenadas já possuem vírgulas internas (marcando apostos, adjuntos adverbiais ou enumerações), o ponto e vírgula atua como organizador de nível superior, marcando a transição entre as grandes ideias:
   • Exemplo: "O primeiro grupo, comandado pelo sargento, cercou a entrada norte; o segundo, chefiado pelo tenente, bloqueou a saída dos fundos."
2. Estruturação Textual Normativa (Redação Oficial e Técnica Legislativa):
   • Em leis, decretos, editais de concursos e portarias administrativas, o ponto e vírgula é o sinal padrão obrigatório para fechar cada um dos incisos e alíneas de um artigo, reservando-se o ponto final unicamente para o último item.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Vírgula proibida entre sujeito e verbo)

🔍 DESTRINCHANDO CADA ALTERNATIVA:
• A) CORRETA. A oração subordinada adverbial concessiva anteposta ("Embora o percurso fosse longo") exige vírgula obrigatória antes da oração principal.
• B) INCORRETA (Gabarito da questão). Ocorreu o erro primário e proibido de separar o sujeito simples ("O governador de Pernambuco") do seu verbo predicador ("sancionou") por uma vírgula espúria. O correto é: "O governador de Pernambuco sancionou a lei...".
• C) CORRETA. Vocativo anteposto ("Caros cidadãos") isolado por vírgula.
• D) CORRETA. Aposto explicativo ("linda cidade litorânea") isolado por duas vírgulas.
• E) CORRETA. Vírgula antes do "e" separando orações com sujeitos diferentes ("os reforços" vs "a ordem").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DESLOCAMENTO DE CONJUNÇÕES COORDENADAS ADVERSATIVAS E CONCLUSIVAS:
• Posição Padrão (Início da oração):
  - "O treinamento foi exaustivo, porém todos os recrutas concluíram a etapa." (Vírgula única antes do conectivo).
• Posição Deslocada (Intercalada ou Posposta):
  - Quando conectivos adversativos (porém, contudo, todavia, entretanto, no entanto) ou conclusivos (portanto, por conseguinte, dessarte) são deslocados para o meio da oração (após o verbo ou outro termo), o emprego de DUAS VÍRGULAS (ou ponto e vírgula antes e vírgula depois) é ESTRITAMENTE OBRIGATÓRIO!
  - Exemplo: "O treinamento foi exaustivo; todos os recrutas, PORÉM, concluíram a etapa."
  - Exemplo: "O treinamento foi exaustivo; todos os recrutas concluíram a etapa, PORÉM."''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 USOS NORMATIVOS DAS ASPAS (" ") NA REDAÇÃO FORMAL:
A gramática normativa e o Manual de Redação da Presidência da República consagram 4 usos essenciais para as aspas duplas:
1. Citação Direta Literal: Isolar a reprodução exata das palavras de outra autoridade ou autor (ex: Conforme Rui Barbosa, "a força do direito deve superar o direito da força").
2. Ironia ou Sentido Contrário: Destacar que o termo foi empregado com conotação irônica (ex: O réu agiu com imensa "educação" ao ameaçar a vítima).
3. Estrangeirismos, Gírias e Neologismos: Sinalizar palavras fora do vernáculo padrão (ex: Os agentes realizaram um "briefing" tático).
4. Títulos de Artigos, Capítulos e Obras Artísticas breves.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PONTUAÇÃO DE CONECTIVOS REPARADORES E ILUSTRATIVOS:
Locuções conjuntivas ou prepositivas com valor de:
• Retificação / Correção: ou melhor, aliás, ou seja;
• Explicação / Esclarecimento: isto é, a saber, por exemplo, a meu ver;
Possuem natureza sintática de elementos expletivos ou adverbiais intercalados. Por isso, na norma culta, DEVEM VIR OBRIGATORIAMENTE ISOLADAS ENTRE VÍRGULAS (ou por vírgula antes e ponto final depois se encerrarem o período).
• Exemplo: "O prazo recursal encerrou-se ontem, ISTO É, não cabe nova manifestação."
• Exemplo: "Alguns crimes militares, POR EXEMPLO, exigem julgamento na Justiça Castrense."''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNÇÃO DOS PARÊNTESES:
Os parênteses exercem o papel de isolar comentários adicionais, notas explicativas, desdobramentos de siglas ou reflexões que se afastam temporariamente do fluxo principal da narrativa sem cortar definitivamente o raciocínio sintático.
• Exemplo de sigla: "O edital foi emitido pela Secretaria de Defesa Social (SDS-PE)."
• Exemplo de comentário: "A operação tática (que durou mais de doze horas ininterruptas) resultou na captura do foragido."
• A assertiva reflete com fidelidade o papel consagrado pela pontuação formal.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PRINCÍPIO DO PARALELISMO SINTÁTICO NAS ENUMERAÇÕES:
O paralelismo sintático exige que elementos coordenados que exercem a mesma função e vêm separados por vírgulas ou conjunções apresentem equivalência formal de classe e estrutura gramatical:
• Errado (Quebra de Paralelismo): "O policial militar preza a pontualidade [Substantivo], agir com bravura [Oração com infinitivo] e a honestidade [Substantivo]."
• Correto (Paralelismo Nominal): "O policial militar preza a pontualidade [Substantivo], a bravura [Substantivo] e a honestidade [Substantivo]."
• Correto (Paralelismo Verbal): "O policial militar busca ser pontual [Infinitivo], agir com bravura [Infinitivo] e manter a honestidade [Infinitivo]."

Portanto, o paralelismo é requisito direto de clareza, elegância e correção sintática cobrado assiduamente em provas do Cebraspe e da AOCP.''',
    ),
  ],
);

