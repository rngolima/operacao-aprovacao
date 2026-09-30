import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 01: Compreensão, Interpretação e Tipologia Textual
final AulaGuiaItem portuguesAula01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Compreensão, Interpretação e Tipologia Textual (Narrativo, Descritivo, Dissertativo e Injuntivo)',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# COMPREENSÃO VS. INTERPRETAÇÃO E TIPOLOGIA TEXTUAL (MÉTODO CRAVOU)

## 1. COMPREENSÃO (Decodificação Explícita) vs. INTERPRETAÇÃO (Infeferência Lógica)
- **Compreensão Textual**: Está explícito no texto ("Segundo o autor...", "O texto afirma expressamente que..."). Basta localizar o segmento e validar o dado literal.
- **Interpretação Textual**: Vai além do explícito por meio de dedução lógica ("Depreende-se do texto...", "Infere-se que..."). CUIDADO com extrapolação, redução ou contradição.
- **Regra de Ouro CRAVOU**: Nunca traga opiniões pessoais ou conhecimentos externos para a questão de interpretação. Limite-se estritamente às premissas oferecidas pelo texto da banca examinadora.

---

## 2. AS 4 GRANDES TIPOLOGIAS TEXTUAIS NO EDITAL
1. **Dissertativo-Argumentativo**:
   - Objetivo: Defender uma tese, ponto de vista ou proposta com argumentos lógicos.
   - Marcas: Verbos no presente do indicativo, conectivos de causa/consequência/conclusão, impessoalidade.
   - Padrão de Prova: É o gênero predominante em textos sobre segurança pública, criminologia e direitos fundamentais.
2. **Dissertativo-Expositivo (Informativo)**:
   - Objetivo: Apresentar dados, fatos, teorias ou conceitos sem intenção persuasiva direta de convencer.
3. **Narrativo**:
   - Objetivo: Relatar uma sequência temporal de acontecimentos reais ou fictícios.
   - Elementos obrigatórios (Mnemônico **PENTE**):
     - **P**ersonagens
     - **E**nredo
     - **N**arrador (1ª ou 3ª pessoa)
     - **T**empo (cronológico ou psicológico)
     - **E**spaço
   - Marcas: Verbos no pretérito perfeito/imperfeito indicando ação progressiva.
4. **Descritivo**:
   - Objetivo: Caracterizar seres, objetos, cenários ou estados em um recorte estático do tempo.
   - Marcas: Abundância de adjetivos, orações adjetivas e verbos de ligação.
5. **Injuntivo / Instrucional**:
   - Objetivo: Orientar, instruir ou prescrever uma conduta obrigatória ou recomendada ao receptor.
   - Marcas: Verbos no imperativo ("Faça", "Preencha", "Observe"), infinitivo com valor prescritivo. Típico de manuais policiais, POPs e editais.

---

## 3. PRINCIPAIS ERROS DE LEITURA DETECTADOS PELA BANCA
- **Extrapolação**: Acrescentar ideias que o texto não autoriza inferir.
- **Redução**: Considerar apenas uma parte do texto, ignorando a conclusão ampla do autor.
- **Contradição**: Assinalar alternativa que afirma o oposto direto do que está escrito no parágrafo.''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Compreensão, Interpretação e Tipologias',
    conceitoCentral: 'Leitura Tática de Textos em Concursos Policiais',
    regraDeOuro: 'Interpretar é deduzir sem extrapolar; tipologia define o objetivo primordial do emissor!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Compreensão vs Interpretação',
        subtitulo: 'Níveis de decodificação da prova',
        corRamo: Color(0xFF2563EB),
        icone: Icons.visibility,
        itens: [
          MapaMentalItem(
            titulo: 'Compreensão (Explícito)',
            descricao: 'Informação impressa no texto. Busca direta nas linhas indicadas.',
            mnemonico: '"Segundo o texto...", "O autor informa..."',
          ),
          MapaMentalItem(
            titulo: 'Interpretação (Implícito)',
            descricao: 'Inferência válida com base nas pistas textuais e coesão.',
            mnemonico: '"Depreende-se...", "Infere-se...", "Conclui-se..."',
          ),
          MapaMentalItem(
            titulo: 'Armadilha do Conhecimento Externo',
            descricao: 'Não julgue a realidade fática exterior, mas sim a tese restrita do autor.',
            exemplo: 'Mesmo que discorde da tese, valide o que o autor sustentou.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Tipologia Dissertativa',
        subtitulo: 'Argumentação e Exposição',
        corRamo: Color(0xFF059669),
        icone: Icons.article,
        itens: [
          MapaMentalItem(
            titulo: 'Dissertação Argumentativa',
            descricao: 'Defesa de posicionamento crítico com dados e conectivos lógicos.',
            exemplo: 'Artigo de opinião sobre o papel da polícia comunitária.',
          ),
          MapaMentalItem(
            titulo: 'Dissertação Expositiva',
            descricao: 'Apenas apresenta fatos, dados e relatórios sem debate ideológico.',
            exemplo: 'Boletim estatístico de criminalidade do estado de Pernambuco.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Tipologia Narrativa e Descritiva',
        subtitulo: 'Ação no tempo vs Caracterização',
        corRamo: Color(0xFFD97706),
        icone: Icons.history_edu,
        itens: [
          MapaMentalItem(
            titulo: 'Narrativo (Mnemônico PENTE)',
            descricao: 'Personagem, Enredo, Narrador, Tempo e Espaço em progressão.',
            mnemonico: 'P-E-N-T-E (Ação sucessiva no tempo)',
          ),
          MapaMentalItem(
            titulo: 'Descritivo (Retrato Estático)',
            descricao: 'Predomínio de adjetivos, verbos de ligação e ausência de progressão temporal.',
            exemplo: 'Descrição minuciosa da cena de uma perícia criminal.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Tipologia Injuntiva',
        subtitulo: 'Instrução e Prescrição',
        corRamo: Color(0xFFDC2626),
        icone: Icons.gavel,
        itens: [
          MapaMentalItem(
            titulo: 'Injuntivo / Instrucional',
            descricao: 'Indica ordens, recomendações e procedimentos a serem cumpridos.',
            mnemonico: 'Verbos no Imperativo ("Aproxime-se com cautela")',
            exemplo: 'Manual de Abordagem Policial e Instruções de Edital.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 101,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'Considere o excerto: "O soldado avançou cuidadosamente pela viela escura. Sentia o pulso acelerado enquanto a chuva fina caía sobre seu uniforme. Ao dobrar a esquina, avistou a viatura de apoio estacionada à esquerda." Quanto à tipologia predominante, o texto classifica-se como:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Dissertativo-argumentativo, pois debate a periculosidade do trabalho policial.',
        'B': 'Narrativo, pois apresenta sequência cronológica de ações, personagens e cenário.',
        'C': 'Injuntivo, pois busca prescrever regras de patrulhamento tático.',
        'D': 'Descritivo puro, visto que apenas qualifica os objetos sem progressão temporal.',
        'E': 'Expositivo, pois traz relatório estatístico sobre ocorrências noturnas.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Narrativo)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A dissertação argumentativa exige a defesa de uma tese por meio de argumentos, dados e juízos de valor para convencer o leitor. No excerto não há debate ideológico, crítica ou tese sendo defendida.
• B) CORRETA. O trecho estrutura-se essencialmente na progressão temporal de ações ("avançou", "sentia", "ao dobrar", "avistou"). Reúne com perfeição os 5 elementos indispensáveis da narrativa (Mnemônico PENTE): Personagem (o soldado), Espaço (a viela escura, a esquina), Narrador (em 3ª pessoa, observador), Tempo (momento da ronda noturna chuvosa) e Enredo (a movimentação tática até o encontro da viatura).
• C) INCORRETA. O texto injuntivo (ou instrucional) prescreve normas, ordens ou recomendações de conduta, empregando verbos no imperativo ou no infinitivo imperativo (ex: "faça", "verifique", "mantenha"). Não há prescrição no texto.
• D) INCORRETA. O texto contém elementos descritivos ("viela escura", "chuva fina", "pulso acelerado"), porém eles atuam apenas como recurso acessório de ambientação. O que domina a macroestrutura é a sucessão cronológica dos acontecimentos (dinamismo). A descrição pura seria uma imagem estática, sem linha temporal.
• E) INCORRETA. O texto expositivo objetiva informar dados, estatísticas ou conceitos teóricos de maneira neutra e informativa, o que não ocorre na passagem.

💡 O PULO DO GATO / PEGADINHA DA AOCP:
A banca examinadora adora inserir adjetivos expressivos em sequências narrativas para seduzir o candidato a marcar "descritivo". Grave a regra tática: se as ações modificam o estado das coisas e há avanço no relógio (linha do tempo), a tipologia mestre é NARRATIVA!''',
    ),
    QuestaoModel(
      id: 102,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'Em um manual de procedimentos com os seguintes dizeres: "Mantenha a arma no coldre travada. Verifique os documentos do condutor mantendo a distância regulamentar de segurança.", a tipologia textual predominante é a:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Narrativa.',
        'B': 'Descritiva.',
        'C': 'Injuntiva.',
        'D': 'Dissertativa.',
        'E': 'Poética.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Injuntiva)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A narrativa exige relato temporal de ações com personagens e enredo fictício ou real em sucessão. Aqui não há história sendo contada.
• B) INCORRETA. A descrição visa desenhar em palavras as propriedades e atributos físicos ou psicológicos de seres e cenários de forma estática.
• C) CORRETA. A tipologia injuntiva (instrucional/prescritiva) tem o objetivo explícito de orientar, direcionar, comandar ou instruir o interlocutor a adotar determinado comportamento prático. Sua marca linguística mais marcante é o uso recorrente de verbos no Modo Imperativo ("Mantenha", "Verifique") ou infinitivos prescritivos. É a tipologia típica de manuais operacionais, Procedimentos Operacionais Padrão (POP), bulas, receitas e regulamentos de trânsito e segurança.
• D) INCORRETA. O texto dissertativo busca explicar conceitos (expositivo) ou defender teses com argumentos reflexivos (argumentativo). Não formula ordens operacionais imediatas.
• E) INCORRETA. O texto lírico/poético centra-se na função poética da linguagem e na emotividade subjetiva, sem qualquer relação com um protocolo técnico operacional.

💡 O PULO DO GATO / PEGADINHA DA AOCP:
Diferencie Injunção Instrucional (dica, sugestão, bula) de Injunção Prescritiva (lei, edital, manual militar obrigatório onde o descumprimento gera punição legal). Ambas pertencem ao macrotronco da Injunção!''',
    ),
    QuestaoModel(
      id: 103,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Compreensão e Interpretação',
      enunciado: 'A diferença conceitual entre "compreensão" e "interpretação" reside no fato de que a compreensão atém-se aos dados expressos e decodificados no texto, ao passo que a interpretação envolve deduções e conclusões fundamentadas a partir das premissas textuais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DOUTRINÁRIA DETALHADA:
O item sintetiza com máxima precisão a distinção clássica cobrada em provas de concursos:
1. COMPREENSÃO (Intratextual / Explícita):
   • O foco está no que está escrito diretamente na folha de prova.
   • Comandos de prova típicos: "Segundo o texto...", "O autor afirma expressamente na linha X...", "Conforme os dados do primeiro parágrafo...".
   • Exige apenas capacidade de decodificação, localização e paráfrase fiel do texto.
2. INTERPRETAÇÃO (Extratextual / Implícita por Inferência Lógica):
   • O foco está no que se deduz legitimamente a partir do texto lido ("ler nas entrelinhas").
   • Comandos de prova típicos: "Depreende-se do texto que...", "Infere-se que...", "É possível deduzir que...", "O texto sugere que...".
   • Exige raciocínio dedutivo ou indutivo com base estrita nas premissas autorizadas pelo autor.

💡 DICA DE OURO CRAVOU:
Quando o enunciado pedir "Segundo o texto", não vá além das palavras do autor (compreensão). Quando o enunciado pedir "Depreende-se", você DEVE buscar a inferência lógica não dita expressamente, mas que decorre com certeza absoluta das premissas expostas!''',
    ),
    QuestaoModel(
      id: 104,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'O texto dissertativo-argumentativo distingue-se do dissertativo-expositivo fundamentalmente porque o primeiro visa persuadir o leitor acerca de uma tese por meio de juízos de valor e argumentos, enquanto o segundo limita-se a expor informações e conceitos sem defesa de ponto de vista.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DOUTRINÁRIA DETALHADA:
Excelente síntese da tipologia dissertativa:
1. DISSERTAÇÃO ARGUMENTATIVA:
   • Finalidade: Convencer, persuadir e moldar a opinião do leitor sobre um determinado tema controverso.
   • Instrumentos: Apresentação de tese clara na introdução, juízos de valor, fundamentação com causas/consequências, refutação de contra-argumentos e proposta interventiva/conclusiva.
   • Exemplos: Artigo de opinião, editorial de jornal, redação de prova discursiva de concurso.
2. DISSERTAÇÃO EXPOSITIVA / INFORMATIVA:
   • Finalidade: Transmitir saberes, relatar constatações científicas, conceituar fenômenos ou apresentar dados de forma neutra e impessoal.
   • Instrumentos: Clareza terminológica, ausência de adjetivação valorativa ("bom", "ruim", "inadmissível"), ausência de tentativa de tomada de lado.
   • Exemplos: Verbete de enciclopédia, relatório estatístico criminal da SDS-PE, notícia informativa pura.

💡 PEGADINHA FREQUENTE:
Muitas bancas tentam afirmar que todo texto dissertativo é argumentativo. ERRADO! Há dissertações puramente expositivas em que o emissor não emite opinião alguma, atuando apenas como expositor neutro de fatos.''',
    ),
    QuestaoModel(
      id: 105,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Compreensão de Texto',
      enunciado: 'Ao realizar a interpretação de um texto em prova de concurso público, o candidato deve priorizar o seu conhecimento prévio sobre o tema em detrimento das ideias veiculadas pelo autor quando estas forem contrárias ao senso comum.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 ANÁLISE DOUTRINÁRIA DETALHADA:
O item comete a mais perigosa infração na interpretação de textos de concursos: a EXTRAPOLAÇÃO INDEVIDA POR CONHECIMENTO EXTERNO.
• Regra Soberana de Concursos: O texto da prova é o universo supremo da questão. Se o autor do texto afirmar categoricamente que "a terra é cúbica e o gelo queima", o candidato deve julgar as questões com base rigorosamente no que o texto declarou.
• O conhecimento prévio de mundo (bagagem cultural) serve apenas para compreender o vocabulário e a lógica dos conectivos, JAMAIS para refutar, substituir ou contestar o posicionamento do texto de apoio.
• Colocar o conhecimento de senso comum acima do texto gerará erro fatal de extrapolação ou contradição na folha de respostas.

💡 REGRA DE OURO CRAVOU:
"Interpretar em prova é responder o que o autor disse, não o que você acha que ele deveria ter dito!"''',
    ),
    QuestaoModel(
      id: 106,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'Assinale a alternativa que apresenta elemento indispensável à estruturação da tipologia descritiva:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Sequência de eventos no tempo com clímax e desfecho dinâmico.',
        'B': 'Emprego predominante de adjetivos, locuções adjetivas e orações que caracterizam seres ou ambientes estáticos.',
        'C': 'Uso imperativo para regular a conduta do leitor.',
        'D': 'Apresentação de dados estatísticos para comprovar tese controversa.',
        'E': 'Alternância constante de narrador em primeira e terceira pessoas.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A sucessão de eventos no tempo ("antes, durante e depois"), clímax e desfecho são marcas constitutivas da TIPOLOGIA NARRATIVA. Na descrição não há progressão temporal.
• B) CORRETA. A descrição funciona como uma fotografia verbal: captura um instante estático no tempo e no espaço. Por isso, fundamenta-se na qualificação e caracterização minuciosa dos seres e ambientes, o que exige a abundância de adjetivos, locuções adjetivas, metáforas descritivas e verbos de estado ou ligação (ser, estar, permanecer, parecer).
• C) INCORRETA. O uso do modo imperativo para regulação ou determinação de conduta é traço da TIPOLOGIA INJUNTIVA.
• D) INCORRETA. Apresentação de dados para respaldar tese caracteriza a DISSERTAÇÃO ARGUMENTATIVA.
• E) INCORRETA. O foco narrativo (narrador em 1ª ou 3ª pessoa) é elemento do texto narrativo, não sendo requisito de estruturação do texto descritivo.

💡 DICA DE PROVA:
A descrição pura é raríssima em textos longos. Em provas policiais, ela surge comumente inserida dentro de boletins periciais ou trechos de narrativas que descrevem o aspecto fisionômico de um suspeito ou o estado de uma viatura.''',
    ),
    QuestaoModel(
      id: 107,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Coesão e Coerência',
      enunciado: 'A coesão textual referencial é obtida quando um termo do texto remete a outro já expresso anteriormente (anáfora) ou que ainda será apresentado (catáfora), garantindo a continuidade do fluxo informativo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DOUTRINÁRIA DETALHADA:
O item traz a exata definição conceitual dos mecanismos endofóricos de coesão referencial:
1. ANÁFORA (Movimento Retrospectivo / Olha para trás):
   • Ocorre quando um termo coesivo (pronome, sinônimo, hiperônimo, elipse) retoma um referente previamente mencionado no texto para evitar repetição viciosa.
   • Exemplo: "O Comandante Geral da PMPE convocou a tropa. Ele apresentou o novo plano tático." (O pronome "Ele" funciona anafórica e referencialmente resgatando "O Comandante Geral").
2. CATÁFORA (Movimento Prospectivo / Olha para a frente):
   • Ocorre quando um termo antecipa uma informação que só será formalmente introduzida mais adiante na frase.
   • Exemplo: "O policial só exigiu isto: honestidade e disciplina militar." (O pronome demonstrativo "isto" funciona cataforicamente antecipando a lista que vem após os dois-pontos).

💡 DICA MNEMÔNICA CRAVOU:
• Anáfora = "Antes" (resgata o termo que veio antes).
• Catáfora = "Cata na frente" (projeta a ideia para o que vem à frente no texto).''',
    ),
    QuestaoModel(
      id: 108,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Compreensão e Inferência',
      enunciado: 'O termo "infere-se", comumente presente nos enunciados das bancas organizadoras, autoriza o leitor a formular deduções implícitas sustentadas pelas premissas do texto.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DOUTRINÁRIA DETALHADA:
O vocábulo "inferir" tem como correspondentes semânticos diretos em provas de concurso: deduzir, concluir, depreender, extrair por raciocínio lógico.
• A inferência autorizada não é mera suposição ou "chute": ela é uma ponte de causalidade lógica estrita, em que os dados visíveis no texto (premissas) conduzem necessariamente à conclusão postulada pela assertiva.
• Se a inferência for coerente com as pistas do autor, a afirmativa é verdadeira; caso introduza fatores novos sem qualquer respaldo no texto, configura extrapolação inválida.

💡 ATENÇÃO ÀS BANCAS (CEBRASPE & INSTITUTO AOCP):
Quando o comando usar "infere-se do texto que...", não procure o trecho com as mesmas palavras! A banca deliberadamente reescreverá a ideia com sinônimos e conclusões implícitas legítimas.''',
    ),
    QuestaoModel(
      id: 109,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'Assinale a alternativa correspondente a um gênero textual eminentemente injuntivo:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Crônica lírica sobre o amanhecer no Recife.',
        'B': 'Resenha crítica de uma obra de direito penal militar.',
        'C': 'Regulamento disciplinar que estabelece deveres e vedações aos militares estaduais.',
        'D': 'Ensaio filosófico sobre a ética na antiguidade.',
        'E': 'Verbete de enciclopédia sobre o bioma da Caatinga.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A crônica lírica é um gênero com forte carga expressiva, narrativa e poética, retratando impressões pessoais do cotidiano.
• B) INCORRETA. A resenha crítica tem predomínio dissertativo-argumentativo, sintetizando uma obra e avaliando seu valor técnico e doutrinário.
• C) CORRETA. Regulamentos disciplinares, códigos de ética, portarias operacionais, manuais de tiro e normas de conduta têm como propósito estrutural orientar, prescrever e vincular o comportamento de indivíduos (função conativa/apelativa da linguagem). Sua essência é eminentemente injuntiva e prescritiva.
• D) INCORRETA. O ensaio filosófico é dissertativo-argumentativo por excelência, estruturado em teses, antíteses e sínteses conceituais.
• E) INCORRETA. O verbete enciclopédico é tipicamente dissertativo-expositivo, apresentando definições conceituais de modo neutro e didático.

💡 O PULO DO GATO:
Lembre-se da distinção: "Tipo Textual" é o modelo abstrato estrutural (narrar, descrever, dissertar, injungir). "Gênero Textual" é o veículo prático de comunicação da sociedade (crônica, bula, receita, regulamento, contrato, boletim de ocorrência).''',
    ),
    QuestaoModel(
      id: 110,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Erros de Interpretação',
      enunciado: 'Quando a banca afirma que uma alternativa comete "extrapolação textual", significa que ela:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Reduziu a abrangência do texto a um detalhe sem importância.',
        'B': 'Inseriu assertiva contraditória com a introdução da matéria.',
        'C': 'Ultrapassou os limites do que o texto informou ou permitiu legitimamente inferir.',
        'D': 'Reproduziu literalmente as frases do primeiro parágrafo.',
        'E': 'Inverteu a relação de causa e consequência explicitada pelo autor.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 DESTRINCHANDO OS 3 GRANDES PECADOS DA INTERPRETAÇÃO DE TEXTOS:
• A) INCORRETA. Trata-se da REDUÇÃO (ou Restrição Indevida). Ocorre quando a alternativa toma uma circunstância particular ou exceção e a apresenta como se fosse o todo, ignorando o sentido global do autor.
• B) INCORRETA. Trata-se da CONTRADIÇÃO (ou Oposição Semântica). A alternativa afirma exatamente o inverso do que o texto explicita.
• C) CORRETA. EXTRAPOLAÇÃO (ou Invenção Textual). Ocorre quando a assertiva acrescenta dados, intenções, generalizações extremas ou desdobramentos que o texto original não disse nem autoriza inferir. É o erro mais comum induzido pelas bancas organizadoras, pois frequentemente se apoia em verdades do senso comum que não foram ditas no texto!
• D) INCORRETA. A reprodução literal configura paráfrase ou cópia direta (compreensão textual), sem erro de extrapolação.
• E) INCORRETA. Trata-se da Inversão de Causa e Consequência (falácia de causalidade), outro vício argumentativo.

💡 DICA TÁTICA CRAVOU:
Desconfie imediatamente de alternativas com generalizadores absolutos como "sempre", "nunca", "jamais", "todos", "em hipótese alguma" quando o texto original usou termos ponderados como "geralmente", "em alguns casos" ou "tende a". Isso é quase sempre extrapolação!''',
    ),
    QuestaoModel(
      id: 111,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Tipologia Textual',
      enunciado: 'O relato de uma testemunha detalhando a sequência das ações criminosas ocorridas durante um assalto bancário enquadra-se prioritariamente na tipologia narrativa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DETALHADA E CONTEXTO POLICIAL:
O relato testemunhal e o termo de declaração de testemunha são manifestações práticas da TIPOLOGIA NARRATIVA.
• Justificativa: Ao detalhar o iter criminis (como o crime se desenrolou), a testemunha estrutura seu discurso em torno de uma linha de tempo sucessiva: a chegada dos agentes delitivos, o anúncio do assalto, a contenção dos clientes, a subtração dos malotes e a fuga em veículo automotor.
• Estão presentes todos os componentes da narrativa: personagens (vítimas e criminosos), tempo (início da tarde), espaço (agência bancária), narrador (a testemunha em primeira pessoa) e o enredo delitivo.

💡 ATENÇÃO À TERMINOLOGIA DO CEBRASPE:
O Cebraspe usa frequentemente o vocábulo "prioritariamente" ou "predominantemente". Fique atento: mesmo que a testemunha descreva a fisionomia do assaltante (trecho descritivo), a tipologia "prioritária" de todo o relato é inquestionavelmente NARRATIVA.''',
    ),
    QuestaoModel(
      id: 112,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Compreensão de Texto',
      enunciado: 'O emprego de expressões como "em virtude de", "haja vista que" e "porquanto" confere ao texto coesão interparágrafos de natureza predominantemente explicativa ou causal.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE GRAMATICAL E COESIVA COMPLETA:
As três locuções e conjunções citadas possuem valor semântico primário estritamente causal/explicativo:
1. "Em virtude de" = locução prepositiva de valor causal (ex: "Em virtude do aumento do efetivo, a criminalidade reduziu").
2. "Haja vista que" = locução conjuntiva causal/explicativa (ex: "A operação foi um sucesso, haja vista que todos os mandados foram cumpridos").
3. "Porquanto" = conjunção subordinativa causal ou coordenativa explicativa (equivale a "porque", "já que", "visto que").

💡 CUIDADO COM A PEGADINHA MORTAL DE CONCURSO:
Não confunda PORQUANTO (Causa/Explicação = porque) com CONQUANTO (Concessão = embora, ainda que). As bancas (especialmente Cebraspe e AOCP) adoram trocar essas duas conjunções para derrubar candidatos desatentos!''',
    ),
    QuestaoModel(
      id: 113,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Gênero e Tipologia',
      enunciado: 'Qual das alternativas abaixo expressa a correlação correta entre tipo e gênero textual?',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Tipo: Artigo de opinião; Gênero: Argumentativo.',
        'B': 'Tipo: Dissertativo-argumentativo; Gênero: Editorial de jornal.',
        'C': 'Tipo: Receita culinária; Gênero: Injuntivo.',
        'D': 'Tipo: Narrativo; Gênero: Fábula infantil (apenas quando não tiver animais).',
        'E': 'Tipo e gênero são termos rigorosamente sinônimos na linguística moderna.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. A banca inverteu os conceitos! "Artigo de opinião" é o GÊNERO TEXTUAL (material concreto em circulação social); "Argumentativo" é a TIPOLOGIA TEXTUAL (modelo estrutural abstrato).
• B) CORRETA. Aqui a correlação é perfeita: o "Tipo textual" é o padrão teórico composicional (Dissertativo-argumentativo), e o "Gênero textual" é a sua corporificação discursiva em um veículo de imprensa (Editorial de jornal, que expressa o posicionamento oficial da empresa jornalística).
• C) INCORRETA. Novamente invertido: "Receita culinária" é o gênero textual e "Injuntivo" é o tipo textual.
• D) INCORRETA. A fábula infantil é um gênero narrativo com ou sem animais antropomorfizados. A restrição "apenas quando não tiver animais" é absurda e anula a alternativa.
• E) INCORRETA. Na linguística moderna (Marcuschi, Bakhtin), Tipos Textuais são finitos (cerca de 5 a 6 tipos: narração, descrição, dissertação argumentativa, dissertação expositiva e injunção), ao passo que Gêneros Textuais são infinitos e dinâmicos (e-mail, tweet, boletim policial, ata de reunião, editorial, romance, conto).

💡 RESUMO ESQUEMÁTICO:
• TIPO = Como o texto se estrutura (estrutura gramatical).
• GÊNERO = Para que o texto serve na sociedade (função comunicativa real).''',
    ),
    QuestaoModel(
      id: 114,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Interpretação e Pressupostos',
      enunciado: 'Na frase: "O policial militar voltou a se destacar nos treinamentos táticos", a presença do verbo auxiliar "voltar a" introduz o pressuposto implícito de que o policial já havia se destacado em ocasiões anteriores.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DA SEMÂNTICA PRAGMÁTICA (PRESSUPOSTOS VS SUBENTENDIDOS):
Em língua portuguesa, a informação implícita divide-se em:
1. PRESSUPOSTO (Marcado Linguisticamente):
   • É uma ideia incontestável que o leitor extrai necessariamente a partir de um "gatilho linguístico" presente na frase (um verbo, um advérbio ou um adjetivo).
   • Na oração sob análise, a locução aspectual "voltou a se destacar" indica repetição/iteração de uma ação pregressa. Logo, é IMPOSSÍVEL que ele esteja se destacando pela primeira vez na vida; o próprio verbo "voltar" carrega o pressuposto de que ele já fora destaque no passado.
2. SUBENTENDIDO (Deduzido pelo Contexto):
   • Depende de pistas contextuais, ironia ou intenção do falante, podendo ser contestado ou negado sem quebrar a gramática.

💡 GATILHOS DE PRESSUPOSTO MAIS COBRADOS:
• Verbos de mudança/continuidade de estado: "parou de fumar" (pressupõe que fumava), "começou a correr" (pressupõe que não corria), "continua estudando" (pressupõe que já estudava).
• Advérbios: "finalmente conseguiu" (pressupõe que demorou ou foi difícil), "ainda mora em Recife" (pressupõe que morava antes).''',
    ),
    QuestaoModel(
      id: 115,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Progressão Temática',
      enunciado: 'A manutenção da coerência em um texto dissertativo depende de que os argumentos apresentados pelo autor guardem relação lógica de não contradição mútua e sustentem convergentemente a tese central defendida.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DETALHADA DOS PRINCÍPIOS DA COERÊNCIA TEXTUAL:
A coerência textual é a responsável pela harmonia do sentido global (plano das ideias e da lógica). A doutrina textual estabelece 3 grandes princípios para garantir a coerência:
1. Princípio da Não Contradição: Em nenhum momento o texto pode afirmar uma premissa e, posteriormente, sustentar o oposto, a menos que adote uma linha dialética de refutação explícita.
2. Princípio da Não Tautologia: O texto precisa progredir tematicamente, trazendo novas ideias a cada parágrafo em vez de apenas repetir a mesma ideia com palavras diferentes em círculos viciosos.
3. Princípio da Relevância / Convergência Argumentativa: Todos os dados, estatísticas, exemplos históricos e argumentos secundários devem convergir como pilares de sustentação da tese mestra apresentada no início da dissertação.

💡 DIFERENÇA VITAL ENTRE COERÊNCIA E COESÃO:
• COESÃO = Conexão gramatical na superfície do texto (pronomes, conjunções, concordância, pontuação).
• COERÊNCIA = Conexão de sentido profundo na mente do leitor (lógica, ideias, ausência de contradições). Um texto pode ter todos os conectivos perfeitos (coesão) e, mesmo assim, ser completamente incoerente se afirmar um absurdo contraditório!''',
    ),
  ],
);

