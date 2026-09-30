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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (à tropa reunida)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA (O TESTE DO "AO"):
• A) INCORRETA. CRASE PROIBIDA DIANTE DE VERBO! "Redigir" é verbo no infinitivo; antes de verbos não existe artigo feminino, apenas a preposição "a".
• B) INCORRETA. CRASE PROIBIDA: "A" no singular diante de palavra no plural ("a audiências"). Nesse caso, o "a" é mera preposição genérica desacompanhada de artigo definido ("as"). Se houvesse crase, seria "às audiências".
• C) CORRETA. REGRA GERAL DA CRASE (Preposição "A" + Artigo Definido "A"):
  - Regência do verbo "comunicar": quem comunica, comunica algo (as novas regras = Objeto Direto) A ALGUÉM (à tropa = Objeto Indireto regido pela preposição "a").
  - Termo posterior feminino: "tropa" aceita o artigo definido feminino "a".
  - Teste da Troca pelo Masculino: Substitua "tropa" por um substantivo masculino equivalente (ex: "pelotão", "batalhão"):
    "O comandante comunicou as novas regras AO batalhão!"
  - Deu "AO" no masculino? No feminino a crase é 100% OBRIGATÓRIA: "à tropa"!
• D) INCORRETA. CRASE PROIBIDA ENTRE PALAVRAS REPETIDAS (ex: frente a frente, cara a cara, gota a gota, passo a passo).
• E) INCORRETA. CRASE PROIBIDA DIANTE DE ARTIGO INDEFINIDO ("a uma comissão"). Não se fundem dois artigos concorrentes.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DETALHADA DE REGÊNCIA E LOCUÇÃO ADVERBIAL:
1. Regência do Verbo OBEDECER / DESOBEDECER:
   • Na linguagem coloquial, é comum o uso incorreto como transitivo direto ("obedecer o sargento").
   • Na NORMA CULTA (e nas provas de concursos policiais), OBEDECER e DESOBEDECER são Transitivos Indiretos (VTI), regendo OBRIGATORIAMENTE a preposição "A"!
   • Exemplos: "Obedeceu AO regulamento", "Obedeceu AO oficial", "Obedeceu À autoridade constituída".
2. Presença da Crase em "à risca":
   • Trata-se de uma LOCUÇÃO ADVERBIAL DE MODO de núcleo feminino ("à risca" = rigorosamente, fielmente).
   • Todas as locuções adverbiais femininas recebem acento grave indicativo de crase de forma obrigatória (ex: à risca, à vista, à toa, à beira de).
Portanto, a assertiva está inteiramente correta.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (à sua supervisora)

🔍 OS 3 CASOS CLÁSSICOS DE CRASE FACULTATIVA (MNEMÔNICO PRO-NO-ATÉ):
1. PRO = Diante de Pronome Possessivo Feminino SINGULAR (minha, tua, sua, nossa, vossa):
   • O uso do artigo antes desses pronomes é facultativo ("Entreguei a sua mãe" ou "Entreguei à sua mãe").
   • Portanto, em "à sua supervisora", o acento grave é estritamente FACULTATIVO!
2. NO = Diante de Nomes Próprios Femininos de pessoas familiares/íntimas:
   • Exemplo: "Entreguei o ofício a Maria" ou "à Maria".
3. ATÉ = Depois da preposição "ATÉ":
   • Exemplo: "O policial foi até a delegacia" ou "até à delegacia".

Descarte dos demais itens:
• A) Obrigatória (dirigiu-se AO posto / À viatura);
• C) Proibida (antes de verbo);
• D) Proibida (entre palavras repetidas);
• E) Obrigatória (fusão da preposição "a" com o "a" inicial do pronome demonstrativo "àquele").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DUPLA REGÊNCIA DO VERBO ASPIRAR:
1. ASPIRAR no sentido de "Sugar / Inalar / Respirar":
   • Classificação: Verbo Transitivo Direto (VTD) - NÃO exige preposição!
   • Exemplo: "O policial aspirou o gás lacrimogêneo durante o confronto." (o gás = Objeto Direto).
2. ASPIRAR no sentido de "Almejar / Desejar / Pretender":
   • Classificação: Verbo Transitivo Indireto (VTI) - EXIGE A PREPOSIÇÃO "A"!
   • Exemplo: "O candidato aspira AO cargo de Agente da Polícia Civil." (ao cargo = Objeto Indireto).
   • Exemplo no feminino com crase: "O concursando aspira À estabilidade pública."

Como no enunciado o sentido é de almejar um cargo na carreira policial, a preposição "A" é de uso imperativo.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A REGRA DE PROVA: "A NO SINGULAR ANTES DE PLURAL, CRASE NEM A PAU!":
• Para ocorrer o fenômeno da crase, são necessários dois elementos simultâneos: a PREPOSIÇÃO "a" (exigida pela regência de um verbo ou nome) somada ao ARTIGO DEFINIDO "a/as" (aceito pelo termo substantivo subsequente).
• Quando o substantivo feminino seguinte está no plural ("reclamações") e a letra "a" que o antecede está no SINGULAR:
  - Não existe artigo definido plural ("as"), mas unicamente a preposição "a" de valor indeterminado/genérico.
  - Conclusão: Havendo apenas preposição sem artigo, É TERMINANTEMENTE PROIBIDO colocar acento grave!
  - Forma correta sem artigo: "...não deu ouvidos A reclamações."
  - Forma correta com artigo definido especificado: "...não deu ouvidos ÀS reclamações."

A explicação teórica da assertiva é impecável.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C

🔍 AS 3 EXIGÊNCIAS RÍGIDAS DO VERBO PREFERIR NA NORMA PADRÃO:
1. Transitividade Bitransitiva (VTDI): Quem prefere, prefere UMA COISA (Objeto Direto, sem preposição) A OUTRA COISA (Objeto Indireto regido pela preposição "A"):
   • Correto: "Prefiro o estudo À ociosidade."
   • Correto: "Prefere patrulhar A permanecer na guarda."
2. PROIBIÇÃO de "DO QUE / QUE":
   • A conjunção comparativa "do que" é erro grave com o verbo preferir.
   • Errado: "Prefiro X do que Y."
3. PROIBIÇÃO de Termos Intensificadores ou Pleonásticos:
   • Como o próprio verbo preferir já exprime primazia e prioridade absoluta, é vedado usar: "mais", "muito mais", "antes", "mil vezes".
   • Errado: "Prefiro mais...", "Prefiro antes...".

Apenas a alternativa C cumpre todas as 3 exigências normativas!''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A TRANSMISSÃO DE PREPOSIÇÃO AO PRONOME RELATIVO:
Em períodos subordinados adjetivos:
1. Verbo da Oração Adjetiva: "fomos" (verbo IR).
   • O verbo IR rege a preposição "A" indicando destino ou movimento transitório: quem vai, vai A algum lugar.
2. Regra Geral da Regência com Pronomes Relativos:
   • Se o verbo subordinado exigir uma preposição ("a", "de", "em", "com", "por"), essa preposição DEVE OBRIGATORIAMENTE ser deslocada para antes do pronome relativo!
   • Frase com desvio: "A delegacia [que] fomos..." (falta a preposição do verbo ir).
   • Frase corrigida com preposição: "A delegacia [A QUE] fomos..." ou "A delegacia [AONDE] fomos...".

O item propôs com total precisão a correção exigida pela regência gramatical.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: E (à / aos)

🔍 PREENCHIMENTO DETALHADO DAS DUAS LACUNAS:
1. Primeira lacuna ("fez elogios _____ dedicação..."):
   • O substantivo "elogios" rege a preposição "A" (elogios a algo/alguém).
   • O substantivo feminino "dedicação" é antecedido pelo artigo definido feminino "A".
   • Ocorre a fusão obrigatória: preposição "a" + artigo "a" = À (com acento grave de crase). Prova da troca pelo masculino: "fez elogios AO empenho".
2. Segunda lacuna ("referiu-se _____ fatos ocorridos..."):
   • O verbo pronominal "referir-se" é Transitivo Indireto e rege a preposição "A" (quem se refere, refere-se A algo).
   • O substantivo subsequente é "fatos", vocábulo MASCULINO PLURAL precedido pelo artigo "os".
   • A fusão da preposição "a" com o artigo masculino plural "os" resulta em: AOS ("referiu-se AOS fatos").
Logo, a resposta definitiva é a alternativa E.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 REGRA FIXA DAS LOCUÇÕES COM PALAVRA FEMININA:
Mesmo que não haja um termo anterior regendo explicitamente a preposição "a", a gramática impõe o acento indicativo de crase em todas as locuções estruturadas sobre um substantivo feminino:
1. Locuções Adverbiais Femininas:
   • De tempo: à noite, à tarde, às vezes, às pressas;
   • De modo: à toa, às claras, às escondidas, à revelia;
   • De lugar: à esquerda, à direita, à distância de.
2. Locuções Prepositivas Femininas (terminam com a preposição "de"):
   • à espera de, à procura de, à custa de, à base de, à sombra de, à mercê de.
3. Locuções Conjuntivas Femininas (terminam com o conectivo "que"):
   • à medida que, à proporção que.

Todas levam o acento grave fixo por convenção sintático-semântica obrigatória.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 OS 4 SIGNIFICADOS E REGÊNCIAS DO VERBO ASSISTIR:
1. Sentido de "Ver / Presenciar / Ser Espectador":
   • É TRANSITIVO INDIRETO (VTI) e rege a preposição "A"!
   • Exemplo no masculino: "Assistiram AO curso de tiro."
   • Exemplo no feminino com crase: "Assistiram À aula com disciplina." (A crase é obrigatória!).
2. Sentido de "Prestar Socorro / Ajudar":
   • É preferencialmente TRANSITIVO DIRETO (VTD), sem preposição: "O médico assistiu o policial ferido."
3. Sentido de "Caber / Pertencer / Competir":
   • É TRANSITIVO INDIRETO com preposição "A": "Assiste ao militar o direito de ampla defesa."
4. Sentido de "Morar / Residir" (arcaico/jurídico):
   • É INTRANSITIVO com preposição "EM": "O magistrado assiste em Recife."

Como a frase trata de assistir a uma aula no sentido de espectador, o acento grave é rigorosamente obrigatório.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A REGRA E AS EXCEÇÕES DOS PRONOMES DE TRATAMENTO:
1. Regra Geral: Não se usa crase diante de pronomes de tratamento!
   • Motivo: Pronomes de tratamento rejeitam o artigo feminino "a", recebendo apenas a preposição "a".
   • Exemplos proibidos: "Encaminhei o relatório a Vossa Excelência", "Enviei a notificação a Você", "Informei a Vossa Senhoria".
2. EXCEÇÃO DE OURO (MÉTODO CRAVOU):
   • As únicas 3 formas de tratamento que admitem artigo feminino "a" e, portanto, RECEBEM CRASE caso o termo anterior exija preposição são:
     - SENHORA: "Entreguei as chaves À Senhora."
     - SENHORITA: "Dirigi-me À Senhorita."
     - DONA: "Pediu autorização À Dona Helena."

O item delimita a regra e suas exceções com perfeição doutrinária.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: E (acostumado de trabalhar)

🔍 DESTRINCHANDO A REGÊNCIA DOS NOMES:
• A) CORRETA. "Imune" rege a preposição "A" (imune a algo).
• B) CORRETA. "Prejudicial" rege a preposição "A" (prejudicial ao serviço).
• C) CORRETA. "Apto" admite a preposição "A" ou "PARA" (apto a / apto para assumir).
• D) CORRETA. "Residente" e "Sito" regem a preposição "EM" (residente em Caruaru, sito na Avenida Agamenon Magalhães).
• E) INCORRETA (Gabarito da questão). O adjetivo "acostumado" rege primordialmente a preposição "A" (ou "COM"): "acostumado A trabalhar sob pressão" ou "acostumado COM a rotina". O emprego da preposição "DE" ("acostumado de trabalhar") é condenado pela regência culta.''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 O FAMOSO TESTE DO "VOLTO DE / VOLTO DA":
Com topônimos (nomes de lugares, cidades, estados e países):
1. Verbo Voltar com "DA" (Preposição + Artigo Feminino):
   • Se você volta "DA", o lugar aceita artigo feminino. Logo, ao ir para lá, a crase é OBRIGATÓRIA!
   • "Volto DA Bahia" -> "Vou À Bahia."
   • "Volto DA Paraíba" -> "Vou À Paraíba."
   • "Volto DA França" -> "Vou À França."
2. Verbo Voltar com "DE" (Apenas preposição, sem artigo):
   • Se você volta "DE", o lugar não aceita artigo. Logo, a crase é PROIBIDA!
   • "Volto DE Olinda" -> "Vou A Olinda." (sem crase)
   • "Volto DE Brasília" -> "Vou A Brasília." (sem crase)
   • "Volto DE Pernambuco" -> "Vou A Pernambuco." (sem crase)
3. Exceção do Topônimo Determinado:
   • Se o nome que volta "de" vier especificado por adjetivo ou locução, a crase torna-se obrigatória: "Vou À histórica Olinda das colinas".''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 A DOBRADINHA DE REGÊNCIA: LEMBRAR / ESQUECER:
A presença do pronome oblíquo altera radicalmente a transitividade e a regência desses dois verbos:
1. FORMA NÃO PRONOMINAL (Sem pronome oblíquo):
   • São Verbos Transitivos Diretos (VTD) -> NÃO admitem preposição!
   • "O policial lembrou o número da placa." (o número = Objeto Direto).
   • "O candidato esqueceu a caneta preta." (a caneta = Objeto Direto).
2. FORMA PRONOMINAL (Com pronome oblíquo: me, te, se, nos, vos, se):
   • São Verbos Transitivos Indiretos (VTI) -> EXIGEM OBRIGATORIAMENTE A PREPOSIÇÃO "DE"!
   • "O policial lembrou-SE DO número da placa." (de + o = do; Objeto Indireto).
   • "O candidato esqueceu-SE DA caneta preta." (de + a = da; Objeto Indireto).

⚠️ ERRO FREQUENTE DE PROVA: Misturar as duas regências (ex: "Esqueci da prova" - Errado! Ou se diz "Esqueci a prova" ou "Esqueci-me da prova").''',
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
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 REGRAS ESPECIAIS DE CRASE COM "CASA", "TERRA" E "DISTÂNCIA":
1. Palavra "CASA" (Lar, moradia própria):
   • Sem especificação: NÃO LEVA CRASE -> "Após o plantão exaustivo, o militar retornou a casa."
   • COM especificação ou qualificativo: LEVA CRASE OBRIGATÓRIA -> "O militar retornou À casa de seus pais", "Foi À casa dos avós".
2. Palavra "TERRA" (Terra firme em oposição a estar a bordo / embarcado):
   • Sem especificação: NÃO LEVA CRASE -> "Após semanas no mar, a guarnição desceu a terra."
   • COM especificação: LEVA CRASE OBRIGATÓRIA -> "Retornaram À terra natal de seus antepassados."
   • (Atenção: se "Terra" for o planeta com inicial maiúscula, leva crase: "O foguete regressou à Terra").

Portanto, a exigência de termo especificador foi exposta com total exatidão pela assertiva.''',
    ),
  ],
);

