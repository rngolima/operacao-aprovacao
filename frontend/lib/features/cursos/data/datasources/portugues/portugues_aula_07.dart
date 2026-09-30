import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 07: Regência Verbal, Nominal e Emprego da Crase
final AulaGuiaItem portuguesAula07 = AulaGuiaItem(
  numero: '07',
  titulo: 'Regência Verbal, Nominal e Emprego do Acento Indicativo de Crase',
  detalhes: '22 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# REGÊNCIA VERBAL, NOMINAL E CRASE (MÉTODO TÁTICO CRAVOU)

## 1. CRASE: CONCEITO E A REGRA DE OURO
- **Conceito**: Crase é a fusão da preposição "a" (exigida por um termo regente) com o artigo feminino "a(s)" ou pronome demonstrativo (*aquele, aquela, aquilo*).
- **Regra de Ouro da Substituição**:
  - Troque a palavra feminina por uma masculina correspondente (ex: *delegacia* por *batalhão*).
  - Se antes da masculina surgir **"AO"**, na feminina OCORRE **CRASE COM ACENTO GRAVE (À)**!
  - Se surgir apenas **"O"** ou **"A"**, NÃO HÁ CRASE.
  - Exemplo: *Foi à delegacia* -> *Foi AO batalhão* (Deu "AO", CRAVA A CRASE!).

---

## 2. CASOS DE CRASE 100% PROIBIDA (NUNCA USE!)
1. **Diante de Palavras Masculinas**:
   - *Andar a pé, pagamento a prazo, passeio a cavalo.*
   - (Exceção: se estiver subentendida a locução "à moda de": *bife à Oswaldo Aranha*).
2. **Diante de Verbos**:
   - *Começou a atirar, disposto a cooperar, voltou a treinar.*
3. **"A" no Singular diante de Palavra no Plural**:
   - *Refiro-me a ordens judiciais.* (Se o "A" está no singular, não há artigo plural "as". Logo, sem crase!).
4. **Entre Palavras Repetidas**:
   - *Cara a cara, corpo a corpo, dia a dia, passo a passo.*
5. **Diante de Pronomes de Tratamento**:
   - *Dirijo-me a Vossa Excelência / a Você.* (Exceções: *Senhora*, *Senhorita* e *Dona* admitem crase).
6. **Diante de Pronomes Indefinidos e Pessoais**:
   - *Pediu ajuda a ela / a qualquer pessoa / a ninguém.*

---

## 3. CASOS DE CRASE FACULTATIVA (MNEMÔNICO "PRO-NO-ATE")
1. **PRO**: Diante de **PRONOME POSSESSIVO FEMININO SINGULAR** (*minha, tua, sua, nossa, vossa*):
   - *Entregou a farda a sua mãe* OU *à sua mãe*. (Ambas corretas!).
2. **NO**: Diante de **NOMES PRÓPRIOS FEMININOS** (sem especificador):
   - *Fez alusão a Maria* OU *à Maria*. (Ambas corretas!).
3. **ATE**: Após a preposição **ATÉ**:
   - *Os policiais foram até a praça* OU *até à praça*. (Ambas corretas!).

---

## 4. REGÊNCIAS VERBAIS PERIGOSAS EM CONCURSOS
1. **Aspirar**:
   - No sentido de respirar/sorver = VTD (*Aspirou o ar da manhã*).
   - No sentido de almejar/pretender = VTI regendo "A" (*Aspira AO cargo de policial militar*).
2. **Assistir**:
   - No sentido de ver/presenciar = VTI regendo "A" (*Assistiu AO desfile militar*).
   - No sentido de prestar socorro = VTD ou VTI (*O médico assistiu o ferido / ao ferido*).
3. **Obedecer / Desobedecer**:
   - Sempre VTI regendo a preposição "A" (*Obedeça AO regulamento*, *Obedeceu À autoridade*).
4. **Preferir**:
   - Rege dois complementos: prefere X **A** Y (*Prefere o treino tático AO descanso*).
   - ERRADO: *Prefere mais o treino do que o descanso* (Proibido "do que" e "mais").
5. **Visar**:
   - No sentido de mirar ou pôr visto = VTD (*O atirador visou o alvo*; *O cônsul visou o passaporte*).
   - No sentido de ter como objetivo/almejar = VTI regendo "A" (*A medida visa À segurança coletiva*).''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Crase e Regência Verbal',
    conceitoCentral: 'Acento Grave e Regência Sintática de Verbos Cruciais',
    regraDeOuro: 'Trocou pelo masculino e deu "AO", crase confirmada! "A" no singular diante de plural é crase proibida!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Regra da Troca pelo Masculino',
        subtitulo: 'O teste infalível da crase',
        corRamo: Color(0xFF2563EB),
        icone: Icons.swap_horiz,
        itens: [
          MapaMentalItem(
            titulo: 'Fórmula do AO',
            descricao: 'Se na palavra masculina virar "AO", na feminina tem acento grave (À).',
            exemplo: 'Foi à cidade (Foi AO campo). Entregou à juíza (Entregou AO juiz).',
          ),
          MapaMentalItem(
            titulo: 'Pronomes Demonstrativos Aquele / Aquela',
            descricao: 'Se o termo regente pedir "A", junta com a letra inicial: àquele, àquela, àquilo.',
            exemplo: 'Fez referência àquele batalhão militar.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Crase 100% Proibida',
        subtitulo: 'Gatilhos de eliminação na prova',
        corRamo: Color(0xFFDC2626),
        icone: Icons.cancel,
        itens: [
          MapaMentalItem(
            titulo: 'Verbo e Masculino',
            descricao: 'Sem artigo feminino, sem crase: "a partir de", "a pé", "a prazo".',
          ),
          MapaMentalItem(
            titulo: '"A" singular + Plural',
            descricao: 'Sem artigo plural "as", proibido acento: "a pessoas", "a ordens".',
          ),
          MapaMentalItem(
            titulo: 'Palavras Repetidas',
            descricao: 'Sem crase: gota a gota, frente a frente, cara a cara.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Crase Facultativa (PRO-NO-ATE)',
        subtitulo: 'Três situações canônicas',
        corRamo: Color(0xFF059669),
        icone: Icons.check_circle_outline,
        itens: [
          MapaMentalItem(
            titulo: 'PRO: Possessivo Feminino Singular',
            descricao: 'à sua escolha / a sua escolha; à minha mãe / a minha mãe.',
          ),
          MapaMentalItem(
            titulo: 'NO: Nome Próprio Feminino',
            descricao: 'Pediu apoio à Joana / a Joana (sem especificador).',
          ),
          MapaMentalItem(
            titulo: 'ATE: Preposição Até',
            descricao: 'Dirigiu-se até à base / até a base.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Regências Críticas de Concurso',
        subtitulo: 'Aspirar, Assistir, Obedecer, Preferir',
        corRamo: Color(0xFFD97706),
        icone: Icons.track_changes,
        itens: [
          MapaMentalItem(
            titulo: 'Aspirar (Almejar)',
            descricao: 'Exige preposição "A": aspira AO posto de oficial.',
          ),
          MapaMentalItem(
            titulo: 'Obedecer / Desobedecer',
            descricao: 'Sempre VTI com "A": obedeceu AO sargento, obedeceu À lei.',
          ),
          MapaMentalItem(
            titulo: 'Preferir (A, não "do que")',
            descricao: 'Prefere ação tática A conversas fiadas (sem "mais que").',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 701,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Emprego da Crase',
      enunciado: 'Assinale a alternativa em que o uso do acento grave indicativo de crase é OBRIGATÓRIO:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial começou a redigir o boletim de ocorrência.',
        'B': 'Todos os militares foram chamados a comparecer a audiências públicas.',
        'C': 'O comandante comunicou as novas regras à tropa reunida no pátio.',
        'D': 'O flagrante foi feito frente a frente com o suspeito.',
        'E': 'Os documentos foram encaminhados a uma comissão especial.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! Em C, quem comunica, comunica algo (as novas regras = OD) a alguém (à tropa = OI preposicionado + artigo definido feminino "a"). Substituindo pelo masculino: "comunicou AO pelotão". Deu "AO", a crase é obrigatória. Em A temos verbo; em B "a" singular diante de plural; em D palavras repetidas; em E artigo indefinido "uma".',
    ),
    QuestaoModel(
      id: 702,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência do Verbo Obedecer',
      enunciado: 'O verbo "obedecer", segundo a norma padrão gramatical, é transitivo indireto e exige complemento introduzido pela preposição "A", justificando a crase em "Os recrutas obedeceram à risca as determinações superiores".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O verbo obedecer rege preposição A ("obedecer a algo/alguém"). Além disso, "à risca" é locução adverbial feminina que obrigatoriamente leva crase.',
    ),
    QuestaoModel(
      id: 703,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase Facultativa',
      enunciado: 'Assinale a opção em que o emprego da crase é FACULTATIVO:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O militar dirigiu-se à viatura caracterizada.',
        'B': 'Entreguei os relatórios à sua supervisora imediata.',
        'C': 'O soldado recusou-se a prestar informações falsas.',
        'D': 'Caminharam passo a passo pela trilha na mata.',
        'E': 'Solicitou auxílio financeiro àquele batalhão.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: 'CRAVOU NA B! Mnemônico PRO-NO-ATE: diante de pronome possessivo feminino singular ("sua supervisora"), o uso do artigo feminino é facultativo, tornando o acento grave de crase igualmente facultativo ("a sua supervisora" ou "à sua supervisora").',
    ),
    QuestaoModel(
      id: 704,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência Verbal - Aspirar',
      enunciado: 'Na oração "O candidato aspiro ao cargo de Agente da Polícia Civil", a presença da preposição "a" é exigida pela regência do verbo aspirar com sentido de almejar.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Aspirar com o sentido de desejar, almejar, ter como meta é Transitivo Indireto (VTI) e rege a preposição "A" (aspirar ao cargo).',
    ),
    QuestaoModel(
      id: 705,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase Proibida - "A" singular antes de plural',
      enunciado: 'No segmento "O oficial não deu ouvidos a reclamações infundadas", o acento grave indicativo de crase é proibido porque a palavra "reclamações" está no plural e desprovida de artigo definido plural ("as").',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Regra pétrea: "A" no singular diante de vocábulo no plural não admite crase sob nenhuma hipótese. Se houvesse o artigo, seria grafado "às reclamações".',
    ),
    QuestaoModel(
      id: 706,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência do Verbo Preferir',
      enunciado: 'Assinale a alternativa que obedece à norma culta quanto à regência do verbo "preferir":',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial prefere mais patrulhar na viatura do que permanecer na guarda do quartel.',
        'B': 'O policial prefere antes patrulhar na viatura do que ficar na guarda.',
        'C': 'O policial prefere patrulhar na viatura a permanecer na guarda do quartel.',
        'D': 'O policial prefere mil vezes o plantão do que a folga remunerada.',
        'E': 'O policial prefere patrulhar na viatura do que a guarda do quartel.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: 'CRAVOU NA C! O verbo PREFERIR é transitivo direto e indireto: quem prefere, prefere uma coisa A outra. A gramática condena o uso de intensificadores ("mais", "mil vezes", "antes") e a conjunção comparativa "do que".',
    ),
    QuestaoModel(
      id: 707,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência com Pronome Relativo',
      enunciado: 'No trecho "A delegacia QUE fomos pertencia à circunscrição metropolitana", a substituição por "A delegacia A QUE fomos" corrige o desvio de regência gramatical.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! O verbo ir rege preposição A (quem vai, vai A algum lugar). Em orações relativas, a preposição regida pelo verbo DEVE ser anteposta ao pronome relativo: "A delegacia A QUE fomos" ou "AONDE fomos".',
    ),
    QuestaoModel(
      id: 708,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase com Pronomes Demonstrativos',
      enunciado: 'Na frase "O capitão fez elogios _____ dedicação daquela aluna e referiu-se _____ fatos ocorridos na instrução", as lacunas são preenchidas corretamente por:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'à / àqueles.',
        'B': 'a / aqueles.',
        'C': 'à / àqueles (com crase facultativa).',
        'D': 'a / àqueles.',
        'E': 'à / aos.',
      },
      gabaritoOficial: 'E',
      comentarioDidatico: 'CRAVOU NA E! "Fez elogios À dedicação" (fazer elogio A + artigo feminino A = crase obrigatória; troque por "ao empenho") e "referiu-se AOS fatos" (referir-se A + artigo masculino OS = aos fatos).',
    ),
    QuestaoModel(
      id: 709,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Locuções Femininas e Crase',
      enunciado: 'Locuções adverbiais, prepositivas e conjuntivas formadas por palavras femininas (como "à noite", "às escondidas", "à espera de", "à medida que") recebem acento grave obrigatoriamente.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! É a regra fixa das locuções com núcleo feminino: locuções adverbiais (à tarde, às pressas), prepositivas (à mercê de, à frente de) e conjuntivas (à proporção que, à medida que) levam acento grave obrigatório.',
    ),
    QuestaoModel(
      id: 710,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência do Verbo Assistir',
      enunciado: 'Na frase "Os alunos do CFO assistiram a aula com máxima disciplina", há desvio da norma culta, devendo ser empregado o acento grave ("assistiram à aula") em virtude da regência do verbo assistir no sentido de ver/presenciar.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! No sentido de ver, presenciar ou assistir como espectador, o verbo ASSISTIR é transitivo indireto e exige a preposição A. Com o artigo feminino de "a aula", ocorre crase obrigatória: "assistiram À aula" (troque por "assistiram AO curso").',
    ),
    QuestaoModel(
      id: 711,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase Diante de Pronomes de Tratamento',
      enunciado: 'É vedado o emprego de crase diante de pronomes de tratamento em geral (como Vossa Senhoria e Você), exceto perante as formas "senhora", "senhorita" e "dona".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Os pronomes de tratamento não admitem artigo feminino ("a você", "a Vossa Excelência"), mas "senhora", "senhorita" e "dona" aceitam artigo feminino, permitindo crase ("Enviei a carta à Senhora").',
    ),
    QuestaoModel(
      id: 712,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência Nominal',
      enunciado: 'Assinale a frase em que a regência nominal do adjetivo está em desacordo com o padrão culto:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial militar era imune a ameaças de criminosos.',
        'B': 'Aquele procedimento era prejudicial ao bom andamento do serviço.',
        'C': 'O soldado estava apto para assumir o plantão operacional.',
        'D': 'O candidato era residente em Caruaru.',
        'E': 'O agente estava acostumado de trabalhar sob pressão extrema.',
      },
      gabaritoOficial: 'E',
      comentarioDidatico: 'CRAVOU NA E! O termo "acostumado" rege primordialmente a preposição A ("acostumado A trabalhar sob pressão"). A regência correta é com a preposição "A" e não "DE".',
    ),
    QuestaoModel(
      id: 713,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase com Nomes Geográficos',
      enunciado: 'Para saber se ocorre crase antes de nomes de cidades ou países, aplica-se a regra mnemônica: "Vou a, volto DA: crase no A! Vou a, volto DE: crase para quê?". Logo, "Vou a Olinda" não recebe crase, mas "Vou à Bahia" recebe crase obrigatória.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Mnemônico tático clássico: Volto DE Olinda (sem crase); Volto DA Bahia (tem artigo "a", logo "Vou à Bahia" tem crase). Se a cidade for qualificada ("Vou à linda Olinda dos carnavais"), a crase passa a ser obrigatória.',
    ),
    QuestaoModel(
      id: 714,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência do Verbo Lembrar / Esquecer',
      enunciado: 'Os verbos "lembrar" e "esquecer", quando conjugados na forma pronominal (lembrar-se / esquecer-se), regem obrigatoriamente a preposição "DE", como em "O policial lembrou-se do número da placa".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Regra de Ouro: Sem pronome, é VTD ("Esqueci o documento"); COM pronome, é VTI exigindo a preposição DE ("Esqueci-ME DO documento"). Erro frequente é misturar as duas regências.',
    ),
    QuestaoModel(
      id: 715,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase Diante da Palavra Casa e Terra',
      enunciado: 'A palavra "casa" (no sentido de lar/moradia própria) e a palavra "terra" (em oposição a bordo de embarcação) só admitem crase se estiverem acompanhadas de termo modificador/especificador.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO CERTO! Regra especial: "Chegou a casa" (sem modificador, sem crase); "Chegou à casa de seus pais" (especificada, crase obrigatória!). Da mesma forma: "Os marinheiros desceram a terra" vs "Desceram à terra dos seus ancestrais".',
    ),
  ],
);

