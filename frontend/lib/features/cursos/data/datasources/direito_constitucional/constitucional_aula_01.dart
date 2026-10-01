import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Direito Constitucional: Art. 5º da CF/88
/// Contém:
/// 1. Resumo Teórico Didático Enriquecido;
/// 2. Mapa Mental Tático Estruturado;
/// 3. Bateria Completa de 15 Questões Comentadas (Estilo Instituto AOCP / Cebraspe).
final aulaGuiaItemConstitucional01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Art. 5º da CF/88: Direitos e Deveres Individuais e Coletivos (Inviolabilidades e Garantias)',
  detalhes: '20 min • Inviolabilidade de Domicílio, Sigilo e Remédios Constitucionais • 15 questões',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# 🏛️ DIREITO CONSTITUCIONAL TÁTICO - AULA 01
## Direitos e Deveres Individuais e Coletivos (Art. 5º da CF/88)

---

### 📌 1. Destinatários e Eficácia dos Direitos Fundamentais
O Art. 5º, caput, da CF/88 estabelece que todos são iguais perante a lei, garantindo-se a:
- **Destinatários**: Brasileiros (natos ou naturalizados) e **estrangeiros** (residentes ou em trânsito). O STF estende garantias também a pessoas jurídicas (ex: honra objetiva, inviolabilidade de domicílio em escritórios).
- **Relatividade dos Direitos**: No ordenamento brasileiro, **NENHUM direito fundamental é absoluto**. Nem mesmo o direito à vida é absoluto, haja vista a admissão constitucional da **pena de morte em caso de guerra externa declarada** (Art. 5º, XLVII, "a").

---

### 🛡️ 2. Inviolabilidade de Domicílio (Art. 5º, Inciso XI)
> *"A casa é asilo inviolável do indivíduo, ninguém nela podendo penetrar sem consentimento do morador, salvo em caso de flagrante delito ou desastre, ou para prestar socorro, ou, durante o dia, por determinação judicial."*

#### As 4 Hipóteses de Entrada Forçada:
1. **Com consentimento do morador**: A qualquer momento (dia ou noite).
2. **Flagrante Delito**: A qualquer momento (dia ou noite). *(STF - Tema 280: Exige justa causa com fundada suspeita prévia, sob pena de nulidade da busca).*
3. **Prestar Socorro ou Desastre**: A qualquer momento (dia ou noite).
4. **Por Determinação Judicial (Mandado)**: **SOMENTE DURANTE O DIA**.
   - *Critério de "Dia":* Critério cronológico (das 06h às 18h) ou critério da Lei de Abuso de Autoridade (das 05h às 21h). É crime de abuso de autoridade cumprir mandado de busca após as 21h ou antes das 05h.

---

### 📱 3. Sigilo das Comunicações e Interceptação Telefônica (Art. 5º, XII)
- É inviolável o sigilo da correspondência e das comunicações telegráficas, de dados e das comunicações telefônicas.
- **Exceção (Interceptação Telefônica)**:
  - Exige **ordem judicial** fundamentada;
  - Apenas para fins de **investigação criminal ou instrução processual penal**;
  - Na forma da Lei Federal nº 9.296/96;
  - **VEDADA** em processos civis, administrativos disciplinares (PAD) ou tributários autônomos.

---

### ⚖️ 4. Remédios Constitucionais (Garantias Fundamentais)
• **Habeas Corpus (Art. 5º, LXVIII)**: Protege a **liberdade de locomoção** (ir, vir e permanecer). É gratuito e não exige advogado.  
• **Mandado de Segurança (Art. 5º, LXIX)**: Protege **direito líquido e certo** não amparado por HC ou HD. Prazo decadencial de **120 dias**.  
• **Habeas Data (Art. 5º, LXXII)**: Assegura o conhecimento ou retificação de **informações relativas à pessoa do impetrante** (personalíssimo). É gratuito. Exige recusa administrativa prévia (Súmula 2 do STJ).  
• **Ação Popular (Art. 5º, LXXIII)**: Qualquer **cidadão** (eleitor com título regular) pode propor para anular ato lesivo ao patrimônio público, moralidade administrativa, meio ambiente ou patrimônio histórico. Isenta de custas (salvo má-fé).
''',
  mapaMental: const MapaMentalData(
    titulo: 'DIREITOS FUNDAMENTAIS: ART. 5º DA CF/88',
    conceitoCentral: 'Garantias individuais, inviolabilidades táticas e remédios constitucionais que blindam o cidadão perante o poder punitivo do Estado.',
    regraDeOuro: 'Mandado Judicial para entrar em casa SÓ DE DIA! Flagrante, desastre e socorro autorizam dia e noite. Direitos não são absolutos!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Inviolabilidade de Domicílio',
        subtitulo: 'Regra vs Exceções Constitucionais',
        corRamo: Color(0xFF1E3A8A),
        icone: Icons.home,
        itens: [
          MapaMentalItem(
            titulo: 'Flagrante, Desastre e Socorro',
            descricao: 'Permite ingresso dia e noite sem consentimento ou mandado.',
            mnemonico: 'F-D-S (Flagrante, Desastre, Socorro = Qualquer hora)',
          ),
          MapaMentalItem(
            titulo: 'Determinação Judicial',
            descricao: 'Exige ordem de juiz e SÓ PODE ocorrer durante o dia.',
            mnemonico: 'Juiz só trabalha com sol (durante o dia)',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Sigilo de Comunicações',
        subtitulo: 'Telefônica vs Dados',
        corRamo: Color(0xFFF59E0B),
        icone: Icons.phone_locked,
        itens: [
          MapaMentalItem(
            titulo: 'Interceptação Telefônica',
            descricao: 'Reserva de jurisdição: exige ordem judicial prévia.',
            mnemonico: 'Apenas para investigação e instrução processual penal',
          ),
          MapaMentalItem(
            titulo: 'Gravação Clandestina',
            descricao: 'Feita por um dos interlocutores sem conhecimento do outro é lícita em legítima defesa.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Remédios Constitucionais',
        subtitulo: 'Garantias Fundamentais de Proteção',
        corRamo: Color(0xFF10B981),
        icone: Icons.shield,
        itens: [
          MapaMentalItem(
            titulo: 'Habeas Corpus',
            descricao: 'Protege a liberdade de locomoção contra ilegalidade ou abuso de poder. Gratuito e sem advogado.',
          ),
          MapaMentalItem(
            titulo: 'Mandado de Segurança',
            descricao: 'Protege direito líquido e certo não amparado por HC ou HD. Prazo decadencial de 120 dias.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Características e Limites',
        subtitulo: 'Relatividade dos Direitos',
        corRamo: Color(0xFFDC2626),
        icone: Icons.gavel,
        itens: [
          MapaMentalItem(
            titulo: 'Relatividade',
            descricao: 'Nenhum direito fundamental é absoluto no Brasil.',
            mnemonico: 'Pena de morte é admitida em caso de guerra externa declarada',
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
      disciplina: 'Direito Constitucional',
      assunto: 'Inviolabilidade de Domicílio',
      enunciado: 'Segundo o Art. 5º, XI, da Constituição Federal de 1988, a casa é asilo inviolável do indivíduo. A esse respeito, assinale a alternativa correta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'A polícia militar pode adentrar em domicílio durante a noite munida de mandado judicial de busca e apreensão.',
        'B': 'O flagrante delito autoriza o ingresso forçado no domicílio tanto durante o dia quanto durante o período noturno, independentemente de autorização judicial.',
        'C': 'O consentimento do morador só é válido juridicamente se prestado durante o dia.',
        'D': 'A prestação de socorro autoriza a entrada domiciliar apenas durante o horário comercial.',
        'E': 'O conceito constitucional de casa restringe-se à residência fixa, excluindo quartos de hotel ou trailers.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Flagrante dia e noite)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. Mandado judicial só pode ser cumprido DURANTE O DIA.
• B) CORRETA. O flagrante delito, desastre e prestação de socorro constituem exceções absolutas que autorizam a entrada a qualquer hora (dia ou noite), sem necessidade de mandado judicial prévio.
• C) INCORRETA. O consentimento do morador autoriza a entrada a qualquer momento (dia ou noite).
• D) INCORRETA. Socorro não tem horário; autoriza a entrada a qualquer instante.
• E) INCORRETA. O STF adota conceito elástico de casa (quarto de hotel ocupado, escritório, trailer e consultório).

💡 REGRA DE OURO TÁTICA:
Mandado Judicial = Somente de DIA!
Flagrante, Socorro e Desastre = Dia e Noite!''',
    ),
    QuestaoModel(
      id: 302,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Relatividade dos Direitos Fundamentais',
      enunciado: 'No sistema constitucional brasileiro, os direitos e garantias fundamentais não possuem caráter absoluto, encontrando limites nos demais direitos consagrados na Carta Magna, razão pela qual admite-se excepcionalmente a pena de morte no Brasil em caso de guerra externa declarada.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNDAMENTAÇÃO LEGAL (Art. 5º, XLVII, "a", da CF/88):
"Não haverá penas: a) de morte, salvo em caso de guerra declarada, nos termos do art. 84, XIX;"
• Este dispositivo comprova categoricamente a relatividade dos direitos fundamentais: nem mesmo o direito à vida é absoluto perante a ordem constitucional brasileira!''',
    ),
    QuestaoModel(
      id: 303,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Remédios Constitucionais',
      enunciado: 'O remédio constitucional adequado para garantir o conhecimento de informações relativas à pessoa do impetrante, constantes de registros ou bancos de dados de entidades governamentais ou de caráter público, denomina-se:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Habeas Corpus.',
        'B': 'Habeas Data.',
        'C': 'Mandado de Segurança.',
        'D': 'Mandado de Injunção.',
        'E': 'Ação Popular.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Habeas Data)

🔍 ANÁLISE DOS REMÉDIOS CONSTITUCIONAIS:
• A) Habeas Corpus: Defende liberdade de locomoção física (ir e vir).
• B) Habeas Data (Art. 5º, LXXII): Ação personalíssima gratuita que visa assegurar o conhecimento ou retificação de dados da PESSOA do impetrante em bancos públicos.
• C) Mandado de Segurança: Protege direito líquido e certo não amparado por HC/HD.
• D) Mandado de Injunção: Supre a falta de norma regulamentadora que inviabilize direito constitucional.
• E) Ação Popular: Proposta por cidadão eleitor em defesa do patrimônio público.''',
    ),
    QuestaoModel(
      id: 304,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Interceptação Telefônica',
      enunciado: 'A interceptação de comunicações telefônicas pode ser determinada judicialmente para instruir processo administrativo disciplinar instaurado contra servidor público, independentemente da existência de investigação criminal correlata.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 LITERALIDADE DO ART. 5º, XII DA CF/88:
A quebra do sigilo telefônico (interceptação) SÓ PODE ser deferida por ordem judicial "para fins de investigação criminal ou instrução processual penal".
• É vedada a decretação originária de interceptação em sede de processo administrativo ou cível puro!
• O que se admite pelo STF é a "prova emprestada": interceptação legitimamente colhida no processo penal pode ser compartilhada posteriormente com o PAD, mas NUNCA instaurada diretamente no administrativo!''',
    ),
    QuestaoModel(
      id: 305,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Direito de Reunião',
      enunciado: 'Nos termos do Art. 5º, XVI, da Constituição Federal, todos podem reunir-se pacificamente, sem armas, em locais abertos ao público, independentemente de autorização, desde que:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Obtenham autorização prévia da autoridade policial com antecedência de 48 horas.',
        'B': 'Paguem taxa de uso do solo urbano à prefeitura municipal.',
        'C': 'Não frustrem outra reunião anteriormente convocada para o mesmo local e haja prévio aviso à autoridade competente.',
        'D': 'Sejam filiados a partido político ou sindicato devidamente registrado.',
        'E': 'Limitem o evento estritamente a praças fechadas.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Prévio aviso e não frustrar outra)

🔍 REQUISITOS CONSTITUCIONAIS DA REUNIÃO (Art. 5º, XVI):
1. Fins pacíficos;
2. Sem armas;
3. Em locais abertos ao público;
4. INDEPENDE DE AUTORIZAÇÃO (o Estado não pode censurar previamente!);
5. Exige apenas PRÉVIO AVISO (para garantir o trânsito e a segurança policial);
6. Não frustrar outra reunião anteriormente convocada para o mesmo local.''',
    ),
    QuestaoModel(
      id: 306,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Escrivão de Polícia',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Gravação Telefônica Clandestina',
      enunciado: 'É lícita a gravação de conversa telefônica realizada por um dos interlocutores sem o conhecimento do outro, mesmo sem autorização judicial, quando utilizada como meio de defesa contra a prática de crime de extorsão.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DISTINÇÃO CLÁSSICA STF / STJ:
• Interceptação Telefônica: Feita por terceiro sem o conhecimento de nenhum interlocutor. EXIGE autorização judicial.
• Gravação Clandestina (Ambiental ou Telefônica): Feita por um dos interlocutores. O STF pacificou em repercussão geral (Tema 979) que é VÁLIDA e LÍCITA como meio de prova e autodefesa, mormente para repelir extorsão ou abuso de poder!''',
    ),
    QuestaoModel(
      id: 307,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Prisão Civil por Dívida',
      enunciado: 'Em conformidade com a Constituição Federal e com o Pacto de São José da Costa Rica (Súmula Vinculante 25 do STF), a única hipótese de prisão civil por dívida atualmente admitida no ordenamento jurídico brasileiro é a do:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Depositário infiel.',
        'B': 'Devedor inadimplente de tributos municipais.',
        'C': 'Responsável pelo inadimplemento voluntário e inescusável de obrigação alimentícia.',
        'D': 'Inadimplente de financiamento de veículo automotor alienado fiduciariamente.',
        'E': 'Empregador que atrasa salários em período de crise.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Pensão Alimentícia)

🔍 ANÁLISE DA SÚMULA VINCULANTE 25 DO STF:
"É ilícita a prisão civil de depositário infiel, qualquer que seja a modalidade do depósito."
• Diante do status supralegal do Pacto de São José da Costa Rica, a única prisão civil por dívida válida no Brasil é a do devedor inescusável de alimentos (pensão alimentícia). O depositário infiel não pode mais ser preso!''',
    ),
    QuestaoModel(
      id: 308,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Direito ao Silêncio (Nemo Tenetur se Detegere)',
      enunciado: 'O direito ao silêncio e o privilégio contra a autoincriminação impedem que o investigado seja compelido a participar de reconstituição simulada dos fatos ou a realizar exame de alcoolemia (bafômetro), sem que sua recusa possa ser valorada como confissão de culpa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PRINCÍPIO DO NEMO TENETUR SE DETEGERE (Art. 5º, LXIII):
• O preso será informado de seus direitos, entre os quais o de permanecer calado.
• O cidadão não é obrigado a produzir prova ativa contra si mesmo (reconstituição de crime, fornecer sangue ou soprar bafômetro). A recusa não importa em presunção de culpabilidade penal!''',
    ),
    QuestaoModel(
      id: 309,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Penas Vedadas pela Constituição',
      enunciado: 'A Constituição Federal de 1988 proíbe expressamente determinadas espécies de penas no Brasil. Assinale a alternativa que indica uma pena permitida pela Constituição:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Pena de trabalhos forçados.',
        'B': 'Pena de banimento.',
        'C': 'Pena de caráter perpétuo.',
        'D': 'Pena de prestação social alternativa.',
        'E': 'Pena cruel.',
      },
      gabaritoOficial: 'D',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: D (Prestação social alternativa)

🔍 ANÁLISE DO ART. 5º, XLVI E XLVII DA CF/88:
• Penas VEDADAS expressamente: morte (salvo guerra declarada), caráter perpétuo, trabalhos forçados, banimento e penas cruéis.
• Penas PERMITIDAS: privação/restrição de liberdade, perda de bens, multa, prestação social alternativa e suspensão/interdição de direitos!''',
    ),
    QuestaoModel(
      id: 310,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Extradição de Brasileiros',
      enunciado: 'O brasileiro naturalizado pode ser extraditado em caso de crime comum praticado antes da naturalização, ou de comprovado envolvimento em tráfico ilícito de entorpecentes, praticado a qualquer tempo (antes ou depois da naturalização).',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 REGRA CONSTITUCIONAL DE EXTRADIÇÃO (Art. 5º, LI):
1. Brasileiro NATO: NUNCA será extraditado sob hipótese alguma!
2. Brasileiro NATURALIZADO pode ser extraditado em DUAS situações:
   • Crime comum praticado ANTES da naturalização;
   • Tráfico ilícito de entorpecentes a QUALQUER TEMPO (antes ou depois!).
O item cobrou a literalidade impecável da Constituição Federal!''',
    ),
    QuestaoModel(
      id: 311,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Ação Popular',
      enunciado: 'De acordo com a Constituição Federal, é parte legítima para propor Ação Popular visando anular ato lesivo ao patrimônio público ou de entidade de que o Estado participe:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Qualquer partido político com representação no Congresso Nacional.',
        'B': 'Qualquer cidadão que esteja no pleno gozo de seus direitos políticos.',
        'C': 'O Ministério Público Estadual exclusivamente.',
        'D': 'Qualquer pessoa jurídica regularmente constituída há mais de um ano.',
        'E': 'Apenas os servidores públicos do respectivo órgão.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Qualquer cidadão eleitor)

🔍 LEGITIMIDADE ATIVA NA AÇÃO POPULAR (Art. 5º, LXXIII):
• "Qualquer cidadão é parte legítima..."
• Cidadão = Nacional no gozo de seus direitos políticos (comprovado mediante apresentação do Título de Eleitor).
• Atenção: Pessoa jurídica NÃO PODE propor ação popular (Súmula 365 do STF).''',
    ),
    QuestaoModel(
      id: 312,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Litispendência e Identificação Criminal',
      enunciado: 'O civilmente identificado não será submetido a identificação criminal, salvo nas hipóteses expressamente previstas em lei, como na ausência de documento idôneo ou indícios de falsificação.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 LITERALIDADE DO ART. 5º, LVIII DA CF/88 E LEI 12.037/09:
• "O civilmente identificado não será submetido a identificação criminal, salvo nas hipóteses previstas em lei."
• A Lei 12.037/09 prevê as ressalvas operacionais (documento rasurado, com indício de falsidade, insuficiente para identificação cabal ou existência de múltiplos nomes de registro). Item perfeito!''',
    ),
    QuestaoModel(
      id: 313,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Crimes Inafiançáveis e Imprescritíveis',
      enunciado: 'A Constituição Federal de 1988 estabelece que a prática do racismo e a ação de grupos armados, civis ou militares, contra a ordem constitucional e o Estado Democrático constituem crimes:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Inafiançáveis e insuscetíveis de graça ou anistia apenas.',
        'B': 'Inafiançáveis e imprescritíveis.',
        'C': 'Prescritíveis em 20 anos e afiançáveis.',
        'D': 'Suscetíveis de fiança por decisão do delegado de polícia.',
        'E': 'Sujeitos exclusivamente a penas restritivas de direitos.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Inafiançáveis e Imprescritíveis)

🔍 MNEMÔNICO INFALÍVEL R.A.ÇÃO (IMPRESCRITÍVEIS):
A CF/88 prevê apenas DOIS crimes que NUNCA prescrevem (imprescritíveis e inafiançáveis):
1. **R**acismo (Art. 5º, XLII);
2. **AÇÃO** de grupos armados contra o Estado Democrático (Art. 5º, XLIV).

💡 E os 3T + Hediondos? (Tráfico, Tortura, Terrorismo e Hediondos):
São Inafiançáveis e INSUSCETÍVEIS DE GRAÇA OU ANISTIA (mas prescrevem!). Não confunda jamais!''',
    ),
    QuestaoModel(
      id: 314,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Princípio do Juiz Natural',
      enunciado: 'O princípio do juiz natural veda a criação de tribunais de exceção e assegura que ninguém será processado nem sentenciado senão pela autoridade competente previamente instituída por lei.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DUPLA DIMENSÃO DO JUIZ NATURAL:
1. Art. 5º, XXXVII: "Não haverá juízo ou tribunal de exceção" (vedação ao tribunal ad hoc pós-fato);
2. Art. 5º, LIII: "Ninguém será processado nem sentenciado senão pela autoridade competente". Gabarito CERTO!''',
    ),
    QuestaoModel(
      id: 315,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Constitucional',
      assunto: 'Uso de Algemas (Súmula Vinculante 11)',
      enunciado: 'Nos termos da Súmula Vinculante nº 11 do Supremo Tribunal Federal, o emprego de algemas é medida excepcional, somente sendo lícito em casos de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Todo e qualquer crime apenado com reclusão.',
        'B': 'Prisão em flagrante de suspeito primário.',
        'C': 'Resistência e de fundado receio de fuga ou de perigo à integridade física própria ou alheia, justificada a excepcionalidade por escrito.',
        'D': 'Mandado de prisão expedido por vara cível de alimentos.',
        'E': 'Condução coercitiva de testemunhas não intimadas.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Resistência, Fuga e Perigo)

🔍 SÚMULA VINCULANTE 11 DO STF (Mnemônico PRF):
"Só é lícito o uso de algemas em caso de:
• **P**erigo à integridade física própria ou alheia;
• **R**esistência;
• **F**undado receio de fuga.
Justificada a excepcionalidade por escrito, sob pena de responsabilidade disciplinar, civil e penal do agente e nulidade da prisão!"''',
    ),
  ],
);
