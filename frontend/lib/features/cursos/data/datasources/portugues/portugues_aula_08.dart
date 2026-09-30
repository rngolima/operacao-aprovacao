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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (mandado / infringir / flagrante)

🔍 DESTRINCHANDO OS 3 PARES DE PARÔNIMOS POLICIAIS:
1. MANDADO vs MANDATO:
   • MANDADO (com "D" de determinação judicial): É a ordem escrita expedida por autoridade competente (juiz de direito ou delegado). Exemplo: "mandado de prisão", "mandado de busca e apreensão".
   • MANDATO (com "T" de tempo político/procuração): É o poder outorgado a alguém para agir em nome de outrem, ou o período de exercício de um cargo político eletivo. Exemplo: "mandato parlamentar de quatro anos".
2. INFRINGIR vs INFLIGIR:
   • INFRINGIR (com "R" de romper/rasgar a lei): Significa violar, transgredir, desobedecer a uma norma ou lei. Exemplo: "infringir as leis de trânsito".
   • INFLIGIR (com "L" de impor castigo): Significa aplicar pena, castigo ou penalidade. Exemplo: "o juiz infligiu dura pena ao criminoso".
3. FLAGRANTE vs FRAGRANTE:
   • FLAGRANTE (com "L"): Ato presenciado no exato momento da execução; evidente, manifesto. Exemplo: "prisão em flagrante delito".
   • FRAGRANTE (com "R"): Perfumado, aromático, que exala cheiro agradável. Exemplo: "uma flor fragrante".

Portanto, a combinação precisa é: "mandado / infringir / flagrante" (Alternativa B).''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Eufemismo)

🔍 DESTRINCHANDO AS FIGURAS DE PENSAMENTO:
• A) INCORRETA. A Metonímia consiste na substituição de uma palavra por outra com base em uma relação real de proximidade (autor pela obra, continente pelo conteúdo, instrumento pelo agente).
• B) CORRETA. O EUFEMISMO é a figura de pensamento que consiste em empregar uma palavra ou expressão suave, branda ou atenuada no lugar de um termo rude, chocante, desagradável ou doloroso. A expressão "descansou para sempre" é uma suavização poética e respeitosa para expressar a morte/falecimento em serviço. Outros eufemismos clássicos: "partiu para o andar de cima", "entregou a alma ao Criador", "faltou com a verdade" (mentiu).
• C) INCORRETA. A Hipérbole expressa um exagero proposital e dramático para impressionar ("morri de rir", "esperei uma eternidade").
• D) INCORRETA. O Paradoxo funde duas ideias mutuamente excludentes que desafiam a lógica racional ("uma doce tortura").
• E) INCORRETA. O Pleonasmo é a repetição enfática de uma mesma ideia ("subir para cima").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DE EQUIVALÊNCIA SINTÁTICA E COESIVA (PADRÃO CEBRASPE):
Ao analisar a reescrita de um período, o candidato deve verificar 3 pilares fundamentais:
1. Equivalência Semântica do Conectivo:
   • O conectivo original é "Embora" (Conjunção Subordinativa Concessiva).
   • O conectivo substituto é "Conquanto" (Conjunção Subordinativa Concessiva de registro culto).
   • Ambos estabelecem idêntica relação de oposição/ressalva concessiva.
2. Manutenção do Modo e Tempo Verbal:
   • Ambas as conjunções exigem obrigatoriamente verbo no Modo Subjuntivo.
   • A forma verbal "fossem" (pretérito imperfeito do subjuntivo) foi mantida integralmente em ambas as frases.
3. Pontuação e Ordem das Orações:
   • Na primeira frase, a oração concessiva estava anteposta (exigindo vírgula obrigatória).
   • Na segunda frase, foi posposta à oração principal, mantendo a vírgula de pausa explicativa perfeitamente legítima.
Conclusão: Sentido original, clareza e correção gramatical 100% preservados!''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (escudo do militar)

🔍 DENOTAÇÃO (SENTIDO REAL) VS CONOTAÇÃO (SENTIDO FIGURADO):
• Denotação (Mnemônico "D" de Dicionário): É o significado literal, objetivo, exato e real da palavra. Não depende de metáforas.
  - Em B, "escudo de proteção balística" é o objeto físico real de aramida/aço usado pela tropa de choque (sentido denotativo).
• Conotação (Mnemônico "C" de Criatividade / Coração): É o significado figurado, simbólico, metafórico e expressivo.
  - Em C, as virtudes "lealdade e coragem" não são artefatos materiais de metal, mas sim valores éticos que funcionam metaforicamente como um "escudo" protetor da integridade moral do militar. Logo, trata-se de SENTIDO CONOTATIVO / FIGURADO!
• As opções A, B, D e E foram empregadas em sentido puramente denotativo e literal.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (sessão / cessão / seção)

🔍 O TRIO DE HOMÓFONOS MAIS COBRADO EM CONCURSOS (MÉTODO CRAVOU):
1. SESSÃO (com "S" inicial e "SS" no meio):
   • Significado: Reunião, assembleia, encontro deliberativo, intervalo de tempo em que um grupo se reúne para realizar uma atividade.
   • Exemplos: sessão do tribunal de justiça, sessão de cinema, sessão legislativa.
   • Lacuna 1: "A SESSÃO plenária do tribunal...".
2. CESSÃO (com "C" inicial e "SS" no meio):
   • Significado: Ato ou efeito de CEDER, doar, transferir a posse, os direitos ou o patrimônio a outrem (família de "ceder").
   • Exemplos: cessão de terrenos, cessão de direitos hereditários, cessão de posse.
   • Lacuna 2: "...aprovou a CESSÃO de terrenos públicos...".
3. SEÇÃO ou SECÇÃO (com "S" inicial e "Ç" no meio):
   • Significado: Ato de seccionar, cortar, repartir; departamento, divisão administrativa, setor físico de uma repartição pública ou empresa.
   • Exemplos: seção de criminalística, seção de identificação civil, seção de votação eleitoral.
   • Lacuna 3: "...construção da nova SEÇÃO de criminalística."

Logo, a ordem correta é rigorosamente: sessão / cessão / seção.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DE REESCRITA E CORRESPONDÊNCIA VOCABULAR:
• Relação Lógico-Semântica:
  - "Devido a": locução prepositiva de valor causal.
  - "Em virtude de": locução prepositiva de valor causal idêntico.
• Sinonímia Perfeita:
  - "falta de provas" e "ausência de provas" expressam exatamente a mesma realidade probatória no contexto jurídico-processual.
• Correção Sintática:
  - Na expressão original havia crase ("devido À falta", preposição a + artigo a).
  - Na reescrita, a locução "em virtude de" funde-se com o artigo feminino "a" do substantivo "ausência", gerando a contração "da ausência", perfeitamente estruturada.
Portanto, a substituição mantém a integridade sintática e a preservação semântica integral do texto.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DIFERENÇA DECISIVA ENTRE ANTÍTESE E PARADOXO:
1. ANTÍTESE (Aproximação de Ideias Opostas Coexistentes):
   • Coloca termos contrários lado a lado, mas em que ambos continuam fazendo sentido lógico no mundo real.
   • Exemplo: "O policial enfrentava o calor do dia e o frio da noite" (calor vs frio - não há absurdo lógico, apenas contraste).
2. PARADOXO ou OXIMORO (Fusão de Ideias Incompatíveis que Desafiam a Lógica):
   • Combina termos mutuamente excludentes, criando uma contradição insolúvel no plano literal.
   • Na frase: "vivia uma morte" -> vida e morte são estados ontológicos inconciliáveis simultaneamente.
   • Exemplo de Camões: "Amor é fogo que arde sem se ver, é ferida que dói e não se sente."

Como a expressão "vivia uma morte" funde dois conceitos antagônicos em um mesmo ser, trata-se inquestionavelmente de PARADOXO.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (em sua motocicleta)

🔍 DESTRINCHANDO O VÍCIO DE AMBIGUIDADE (ANFIBOLOGIA):
• A) CORRETA (Apresenta ambiguidade). A anfibologia ou ambiguidade decorre do mau emprego do pronome possessivo de terceira pessoa "sua". Na oração: "O policial conduziu o suspeito ao posto em sua motocicleta", não é possível saber a quem pertence a motocicleta: ela é do policial ou era do suspeito? A frase tem duplo sentido insolúvel sem o contexto!
  - Para eliminar a ambiguidade na redação oficial, deve-se reescrever: "O policial conduziu o suspeito ao posto na motocicleta dele" ou "na motocicleta do próprio policial".
• Nas alternativas B, C, D e E, a redação é clara, unívoca e direta, sem qualquer margem para dupla interpretação.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PARÔNIMOS EM CONCURSO: IMINENTE VS EMINENTE:
1. IMINENTE (com "I" de imediato):
   • Refere-se àquilo que está prestes a ocorrer, que vai acontecer a qualquer instante, que ameaça desabar imediatamente.
   • Exemplos: "perigo iminente de desabamento", "risco iminente de confronto", "prisão iminente".
2. EMINENTE (com "E" de excelente / elevado):
   • Refere-se àquilo que se destaca pela superioridade, que se eleva acima dos demais; pessoa ilustre, notável, distinta, de alto escalão.
   • Exemplos: "eminente jurista", "eminente autoridade policial", "eminente comandante geral".

A definição trazida no item é precisa e irretocável.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 METONÍMIA: A PARTE PELO TODO (SINÉDOQUE):
A metonímia consiste em utilizar um termo no lugar de outro em virtude de uma relação objetiva e contígua de sentido entre eles:
• Na expressão "três mil cabeças de gado":
  - É evidente que a polícia não apreendeu apenas as "cabeças" decapitadas dos animais; apreendeu os animais bovinos inteiros (o corpo completo).
  - Empregou-se a PARTE anatômica mais evidente ("cabeças") para designar a TOTALIDADE do ser ("bois / vacas").
• Outros exemplos clássicos de prova:
  - "Ele não tem um teto para morar" (teto pela casa inteira).
  - "Várias velas cruzavam o horizonte" (velas pelas embarcações a vela).
  - "Precisamos de novos braços para a lavoura" (braços pelos trabalhadores).

O item classifica com perfeita fidelidade a figura da metonímia.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: D (recalcitrante -> submisso)

🔍 DESTRINCHANDO AS RELAÇÕES SEMÂNTICAS:
• A) PRESERVA O SENTIDO. Íntegro e probo são sinônimos perfeitos na esfera moral e jurídica (retidão, honestidade).
• B) PRESERVA O SENTIDO. Executado e implementado são sinônimos de realização de um plano.
• C) PRESERVA O SENTIDO. Incumbido e encarregado significam ter recebido a delegação de uma tarefa.
• D) ALTERA SUBSTANCIALMENTE (Gabarito da questão). O vocábulo "recalcitrante" significa teimoso, obstinado, rebelde, que resiste tenazmente ao cumprimento da ordem legal. O vocábulo "submisso" significa exatamente o OPOSTO (obediente, dócil, humilde). Logo, trata-se de uma relação de ANTONÍMIA que inverte 180 graus o sentido da assertiva!
• E) PRESERVA O SENTIDO. Verossímil e plausível são termos sinônimos (que têm aparência de verdade, críveis).''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PLEONASMO VICIOSO (TAUTOLOGIA REPROVADA):
1. Diferença entre Pleonasmo Literário e Pleonasmo Vicioso:
   • Pleonasmo Literário: É um recurso de estilo consciente para dar ênfase poética (ex: "Chorei um choro sentido").
   • Pleonasmo Vicioso (ou Redundância Viciosa): É a repetição inútil, tautológica e desnecessária de um mesmo conceito dentro da mesma frase, que empobrece o texto e viola a concisão da redação oficial.
2. Análise dos Exemplos:
   • "subir para cima": o verbo subir já traz a direção ascendente;
   • "elo de ligação": todo elo é por definição uma ligação;
   • "monopólio exclusivo": todo monopólio já é exclusivo por essência conceitual;
   • Outros clássicos: "planejar antecipadamente", "conviver junto", "fato real".

O item reflete com rigor as orientações do Manual de Redação Oficial e da gramática normativa.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A INSERÇÃO DE VÍRGULA E O IMPACTO SEMÂNTICO:
O item traz uma questão clássica cobrada pelo Cebraspe em todos os concursos policiais:
• Frase Original (Sem Vírgula): "A guarnição encontrou a vítima [que estava ferida]."
  - Classificação Sintática: Oração Subordinada Adjetiva RESTRITIVA.
  - Efeito Semântico: Havia mais de uma vítima no local e a guarnição encontrou especificamente aquela que estava ferida (restringe o universo das vítimas).
• Frase Reescrita (Com Vírgula): "A guarnição encontrou a vítima, [que estava ferida]."
  - Classificação Sintática: Oração Subordinada Adjetiva EXPLICATIVA.
  - Efeito Semântico: Havia apenas uma vítima identificada, e o fato de ela estar ferida passa a ser uma informação explicativa e acessória sobre o seu estado.
• Conclusão: A correção gramatical é integralmente mantida, havendo apenas a transmutação semântica de restrição para explicação. O item é perfeito!''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 O QUE É POLISSEMIA:
A polissemia (do grego poly = muitos, sema = significado) é a propriedade pela qual uma MESMA palavra pode assumir múltiplos significados e matizes dependendo do contexto em que é inserida:
• Exemplos de "linha":
  - Em "linha de tiro": demarcação física no estande de tiro;
  - Em "linha de raciocínio": encadeamento lógico de ideias;
  - Em "linha telefônica": conexão técnica de telecomunicações;
  - Em "linha férrea": trilho de transporte ferroviário;
  - Em "linha de costura": fio têxtil.
Como se trata do mesmo significante ("linha") com diversas ramificações semânticas contextuais, configura com clareza exemplar o fenômeno da POLISSEMIA.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 DEFINIÇÃO DA HIPÉRBOLE E DAS FIGURAS DE INTENSIDADE:
O item inverteu grotescamente a definição da figura de linguagem:
1. HIPÉRBOLE (Figura do EXAGERO Intencional):
   • Ocorre quando o emissor emprega termos excessivos e desmedidos para intensificar dramaticamente uma ideia e impressionar o receptor.
   • Exemplos: "Já lhe disse isso um milhão de vezes!", "A viatura voava a mil por hora", "Chorei rios de lágrimas".
2. Diminuição ou Atenuação Intencional:
   • A atenuação para suavizar algo doloroso chama-se EUFEMISMO ("ele descansou" = morreu).
   • A afirmação por meio da negação do contrário chama-se LITOTE ("ele não é nada bobo" = é muito esperto).

Portanto, hipérbole é a figura do EXAGERO desmedido, nunca da diminuição!''',
    ),
  ],
);

