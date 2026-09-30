import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 08: Semântica, Figuras de Linguagem e Reescrita de Frases
final AulaGuiaItem portuguesAula08 = AulaGuiaItem(
  numero: '08',
  titulo: 'Semântica: Sinonímia, Antonímia, Paronímia e Reescrita de Frases',
  detalhes: '18 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# SEMÂNTICA, FIGURAS DE LINGUAGEM E REESCRITA DE FRASES

## 1. RELAÇÕES SEMÂNTICAS FUNDAMENTAIS
1. **Sinonímia**: palavras com sentidos semelhantes em determinado contexto (*valente / corajoso*; *mandato / ordem judicial*).
2. **Antonímia**: palavras com sentidos opostos (*lícito / ilícito*; *beligerante / pacífico*).
3. **Homonímia**:
   - Homófonos (mesmo som, grafias diferentes): *seção* (divisão/repartição), *sessão* (reunião/tempo), *cessão* (ato de ceder).
   - Homógrafos (mesma grafia, sons diferentes): *almoço* (substantivo) e *almoço* (verbo).
4. **Paronímia (Palavras Parecidas que Confundem em Prova)**:
   - *Flagrante* (evidente, no ato do crime) vs. *Fragrante* (perfumado, odorífero).
   - *Mandado* (ordem judicial de prisão/busca) vs. *Mandato* (procuração, tempo de cargo político).
   - *Tráfego* (trânsito de veículos) vs. *Tráfico* (comércio clandestino/ilícito).
   - *Discrição* (reserva, modéstia) vs. *Descrição* (ato de descrever).
   - *Iminente* (prestes a acontecer) vs. *Eminente* (notável, ilustre, elevado).
   - *Infligir* (aplicar pena ou castigo) vs. *Infringir* (desrespeitar, violar regra/lei).
5. **Polissemia**: capacidade de uma mesma palavra assumir múltiplos sentidos a depender do contexto (*cabo* de vassoura / *cabo* da PM / *cabo* geográfico).

---

## 2. SENTIDO DENOTATIVO vs. CONOTATIVO
- **Denotativo (D de Dicionário)**: sentido literal, real, objetivo e direto da palavra (*O policial sacou a arma de fogo*).
- **Conotativo (C de Criativo / Figurativo)**: sentido figurado, metafórico, subjetivo e contextual (*A coragem é a arma dos bravos*).

---

## 3. FIGURAS DE LINGUAGEM MAIS COBRADAS EM CONCURSOS
1. **Metáfora**: comparação implícita sem conectivo comparativo (*Aquele sargento é uma fortaleza*).
2. **Metonímia**: substituição por relação de contiguidade (o autor pela obra, o continente pelo conteúdo: *Leu Machado de Assis*, *Tomou dois copos d'água*).
3. **Eufemismo**: suavização de ideia desagradável ou trágica (*Ele partiu desta para melhor* = faleceu).
4. **Hipérbole**: exagero expressivo intencional (*Esperei um milhão de anos na fila*).
5. **Antítese vs. Paradoxo**:
   - *Antítese*: aproximação de ideias opostas sem anulação lógica (*O batalhão atua de dia e de noite*).
   - *Paradoxo*: contradição inconciliável que rompe a lógica formal (*Aquele silêncio ensurdecedor*).
6. **Ironia**: expressar o oposto do que se pensa para satirizar (*Que ótimo! O pneu da viatura furou na chuva*).

---

## 4. TÁTICAS DE REESCRITA DE FRASES (PADRÃO CEBRASPE / AOCP)
- Questões de reescrita exigem a verificação de dois requisitos INDEPENDENTES:
  1. **Manutenção da Correção Gramatical**: obediência rigorosa a crase, regência, concordância e pontuação.
  2. **Manutenção do Sentido Original**: a troca de conectivos (ex: *embora* por *portanto*) ou a inversão de orações NÃO pode distorcer a mensagem nuclear do autor.
- **Dica de Ouro CRAVOU**: Trocar um conectivo concessivo (*embora*) por um causal (*porque*) mantém a sintaxe, mas **ALTERA O SENTIDO**, tornando o item incorreto!''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Semântica e Reescrita de Frases',
    conceitoCentral: 'Significado das Palavras e Equivalência Estrutural',
    regraDeOuro: 'Reescrita exige correção gramatical E manutenção do sentido original; atente para parônimos perigosos!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Parônimos de Segurança Pública',
        subtitulo: 'Palavras parecidas com sentidos distintos',
        corRamo: Color(0xFFDC2626),
        icone: Icons.warning_amber,
        itens: [
          MapaMentalItem(
            titulo: 'Mandado vs Mandato',
            descricao: 'Mandado = ordem judicial de prisão. Mandato = cargo político.',
            mnemonico: 'Mandado tem "D" de Detenção; Mandato tem "T" de Tempo político.',
          ),
          MapaMentalItem(
            titulo: 'Infligir vs Infringir',
            descricao: 'Infligir = aplicar pena. Infringir = violar lei ou edital.',
            exemplo: 'Infringiu o regulamento; o conselho infligiu punição.',
          ),
          MapaMentalItem(
            titulo: 'Flagrante vs Fragrante',
            descricao: 'Flagrante = no ato do crime. Fragrante = cheiroso.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Denotação vs Conotação',
        subtitulo: 'Literalidade vs Sentido Figurado',
        corRamo: Color(0xFF2563EB),
        icone: Icons.menu_book,
        itens: [
          MapaMentalItem(
            titulo: 'Denotação (D = Dicionário)',
            descricao: 'Sentido real, literal, informativo e objetivo.',
            exemplo: 'A pedra bloqueou a rodovia.',
          ),
          MapaMentalItem(
            titulo: 'Conotação (C = Criativo)',
            descricao: 'Sentido figurado, simbólico e subjetivo.',
            exemplo: 'Ele tinha um coração de pedra.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Figuras de Linguagem',
        subtitulo: 'Efeitos estilísticos nas bancas',
        corRamo: Color(0xFF059669),
        icone: Icons.auto_awesome,
        itens: [
          MapaMentalItem(
            titulo: 'Metáfora vs Metonímia',
            descricao: 'Metáfora = comparação direta; Metonímia = parte pelo todo ou autor pela obra.',
          ),
          MapaMentalItem(
            titulo: 'Antítese vs Paradoxo',
            descricao: 'Antítese = opostos convivendo; Paradoxo = contradição lógica irreconciliável.',
          ),
          MapaMentalItem(
            titulo: 'Eufemismo',
            descricao: 'Suavização de impacto negativo ou trágico.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Reescrita Tática',
        subtitulo: 'Protocolo de Análise CRAVOU',
        corRamo: Color(0xFFD97706),
        icone: Icons.find_replace,
        itens: [
          MapaMentalItem(
            titulo: 'Teste dos Dois Filtros',
            descricao: '1º Filtro: gramática 100% correta? 2º Filtro: sentido nuclear preservado?',
            mnemonico: 'Gramática perfeita + Sentido idêntico = Item CERTO.',
          ),
          MapaMentalItem(
            titulo: 'Troca de Conectivos',
            descricao: 'Cuidado ao trocar concessiva por causal ou adversativa.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 801,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Paronímia',
      enunciado: 'Assinale a alternativa que preenche correta e respectivamente as lacunas da frase: "A equipe policial cumpriu o _____ de busca e apreensão e deteve o motorista que tentou _____ as leis de trânsito em _____ delito."',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'mandato / infligir / flagrante.',
        'B': 'mandado / infringir / flagrante.',
        'C': 'mandado / infligir / fragrante.',
        'D': 'mandato / infringir / fragrante.',
        'E': 'mandado / infringir / fragrante.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! Mandado (ordem judicial escrita) + infringir (violar, desobedecer à lei) + flagrante delito (cometido no ato). "Mandato" é procuração/representação política; "infligir" é aplicar pena; "fragrante" é cheiroso.',
    ),
    QuestaoModel(
      id: 802,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Figuras de Linguagem',
      enunciado: 'Em "A corporação prestou homenagens ao herói que descansou para sempre em honra da pátria", a expressão "descansou para sempre" constitui exemplo de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Metonímia.',
        'B': 'Eufemismo.',
        'C': 'Hipérbole.',
        'D': 'Paradoxo.',
        'E': 'Pleonasmo vicioso.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! O eufemismo consiste no emprego de palavras ou expressões brandas para atenuar uma ideia triste, desagradável ou chocante (neste caso, o falecimento em combate).',
    ),
    QuestaoModel(
      id: 803,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Reescrita de Frases',
      enunciado: 'A frase "Embora as condições climáticas fossem desfavoráveis, a patrulha aérea localizou a embarcação" mantém a correção gramatical e o sentido original ao ser reescrita como: "A patrulha aérea localizou a embarcação, conquanto as condições climáticas fossem desfavoráveis".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! As conjunções "embora" e "conquanto" são ambas subordinativas concessivas estritas, e o verbo permaneceu no modo subjuntivo ("fossem"). Sentido e gramática 100% preservados.',
    ),
    QuestaoModel(
      id: 804,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Denotação e Conotação',
      enunciado: 'Assinale a alternativa em que o vocábulo destacado foi empregado em sentido conotativo (figurado):',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial efetuou disparos de advertência para conter a turba.',
        'B': 'O escudo de proteção balística resistiu aos impactos de projéteis.',
        'C': 'A lealdade e a coragem formam o verdadeiro escudo do militar.',
        'D': 'O inquérito policial foi protocolado na secretaria do fórum.',
        'E': 'Os cães farejadores inspecionaram a bagagem dos passageiros.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! Em C, a palavra "escudo" não se refere ao anteparo físico balístico, mas metaforicamente à proteção moral de virtudes cívicas, configurando sentido conotativo/figurado.',
    ),
    QuestaoModel(
      id: 805,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Homófonos - Cessão / Sessão / Seção',
      enunciado: 'Na oração "A _____ plenária do tribunal aprovou a _____ de terrenos públicos para a construção da nova _____ de criminalística", as lacunas devem ser preenchidas por:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'sessão / cessão / seção.',
        'B': 'seção / sessão / cessão.',
        'C': 'cessão / seção / sessão.',
        'D': 'sessão / seção / cessão.',
        'E': 'seção / cessão / sessão.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: 'CRAVOU NA A! Mnemônico CRAVOU: Sessão (com SS) = tempo/reunião colegiada. Cessão (com C inicial) = ato de ceder/doar patrimônio. Seção (com Ç) = departamento, repartição, divisão administrativa.',
    ),
    QuestaoModel(
      id: 806,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Reescrita e Coesão',
      enunciado: 'A substituição de "devido à falta de provas" por "em virtude da ausência de provas" preserva o nexo causal e a correção sintática do período.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Ambas as locuções prepositivas expressam relação semântica de causa ("devido a" = "em virtude de"), e "falta de provas" equivale sinimicamente a "ausência de provas".',
    ),
    QuestaoModel(
      id: 807,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Antítese vs Paradoxo',
      enunciado: 'A frase "Ele vivia uma morte aparente naquele cativeiro escuro" constitui exemplo de paradoxo (oximoro) por fundir dois conceitos mutuamente excludentes na mesma oração.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O paradoxo rompe com a lógica da realidade ao aproximar termos inconciliáveis ("viver uma morte"). Na antítese, há apenas contraste sem anulação mútua (como "guerra e paz").',
    ),
    QuestaoModel(
      id: 808,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Ambiguidade (Polissemia Indesejada)',
      enunciado: 'Assinale a alternativa que apresenta vício de linguagem caracterizado pela ambiguidade (duplo sentido):',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial conduziu o suspeito ao posto em sua motocicleta.',
        'B': 'A delegada determinou a prisão imediata dos investigados.',
        'C': 'Os soldados retornaram para a sede do quartel general ao pôr do sol.',
        'D': 'O laudo pericial atestou a presença de substância entorpecente.',
        'E': 'A tropa avançou com extrema cautela pelo terreno acidentado.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: 'CRAVOU NA A! Em A ocorre ambiguidade por conta do pronome possessivo "sua": a motocicleta era do policial ou do suspeito? A frase não permite identificar com certeza o possuidor da moto.',
    ),
    QuestaoModel(
      id: 809,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Parônimos - Iminente vs Eminente',
      enunciado: 'O perigo "iminente" indica uma situação prestes a acontecer no tempo, ao passo que uma autoridade "eminente" é aquela que goza de grande prestígio e distinção social.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Iminente = imediato, prestes a desabar/ocorrer. Eminente = ilustre, notável, sublime (ex: eminente desembargador).',
    ),
    QuestaoModel(
      id: 810,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Metonímia',
      enunciado: 'Na expressão "A polícia civil de Pernambuco interceptou três mil cabeças de gado roubadas", o segmento em destaque apresenta a figura de linguagem da metonímia da parte pelo todo.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Trata-se de metonímia (sinédoque): empregou-se a parte ("cabeças") para designar o todo ("bovinos completos").',
    ),
    QuestaoModel(
      id: 811,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Sinonímia e Contexto',
      enunciado: 'Assinale a opção em que a substituição do termo sublinhado altera substancialmente o sentido original:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial agiu de forma ÍNTEGRA. -> proba.',
        'B': 'O plano foi EXECUTADO com precisão. -> implementado.',
        'C': 'O militar foi INCUMBIDO da investigação. -> encarregado.',
        'D': 'O réu era contumaz e RECALCITRANTE. -> submisso.',
        'E': 'Os indícios eram VEROSSÍMEIS. -> plausíveis.',
      },
      gabaritoOficial: 'D',
      comentarioDidatico: 'CRAVOU NA D! "Recalcitrante" significa teimoso, desobediente, rebelde, refratário. "Submisso" é exatamente o seu ANTÔNIMO direto. Logo, a substituição inverte o sentido.',
    ),
    QuestaoModel(
      id: 812,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Pleonasmo',
      enunciado: 'Expressões como "subir para cima", "elo de ligação" e "monopólio exclusivo" configuram pleonasmos viciosos que devem ser extirpados da redação formal.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! São redundâncias inúteis e viciosas que ferem a concisão e a elegância do texto formal segundo a norma culta.',
    ),
    QuestaoModel(
      id: 813,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Reescrita e Pontuação',
      enunciado: 'Ao reescrever o período "A guarnição encontrou a vítima que estava ferida", a inserção de vírgula antes do pronome relativo ("A guarnição encontrou a vítima, que estava ferida") mantém a correção gramatical, mas transforma uma oração restritiva em explicativa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! A vírgula altera a semântica da oração adjetiva de restritiva (sem vírgula) para explicativa (com vírgula), mantendo a perfeita higidez gramatical da frase.',
    ),
    QuestaoModel(
      id: 814,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Polissemia',
      enunciado: 'A palavra "linha", empregada em "linha de tiro", "linha de raciocínio", "linha telefônica" e "linha férrea", ilustra o fenômeno semântico da polissemia.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Polissemia é a multiplicidade de acepções e significados que uma mesma palavra pode assumir em contextos e esferas comunicativas diversas.',
    ),
    QuestaoModel(
      id: 815,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Hipérbole e Ironia',
      enunciado: 'A hipérbole caracteriza-se pelo uso de figura de linguagem voltada a expressar diminuição intencional para fins humorísticos.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! A hipérbole é a figura do EXAGERO intencional e desmedido (ex: "Chorei rios de lágrimas", "Estou morrendo de sede"). A diminuição ou atenuação seria o eufemismo ou a litote.',
    ),
  ],
);

