import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Direitos Humanos da PM-PE:
/// Teoria Geral, Gerações de Direitos e Incorporação dos Tratados Internacionais (STF)
final aulaGuiaItemDh01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Teoria Geral dos Direitos Humanos, Gerações/Dimensões e Incorporação de Tratados (STF)',
  detalhes: '20 min • Método CRAVOU • Conceitos Doutrinários e Hierarquia Normativa • 15 questões',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# TEORIA GERAL DOS DIREITOS HUMANOS E SISTEMA NORMATIVO BRASILEIRO

## 1. CONCEITO, TERMINOLOGIA E NATUREZA
- **Conceito**: Conjunto de faculdades e prerrogativas inerentes à dignidade da pessoa humana, universais e inalienáveis, destinadas a proteger a vida, liberdade, integridade e convivência em sociedade.
- **Distinção Essencial em Provas**:
  - *Direitos do Homem*: Origem jusnaturalista filosófica, inatos ao indivíduo, mesmo que não positivados em leis escritas.
  - *Direitos Humanos*: Positivados no plano internacional através de tratados, convenções e costumes globais.
  - *Direitos Fundamentais*: Positivados dentro da Constituição de um Estado Soberano específico (CF/88: Arts. 5º ao 17).

---

## 2. CARACTERÍSTICAS FUNDAMENTAIS (Mnemônico CRAVOU: U.I.I.I.R.C.V)
1. **Universalidade**: Titularizados por todos os seres humanos, independentemente de nacionalidade, classe ou antecedentes penais.
2. **Indisponibilidade e Inalienabilidade**: Não possuem preço nem podem ser comercializados ou doados.
3. **Imprescritibilidade**: Não caducam nem se perdem pelo decurso do tempo.
4. **Irrenunciabilidade**: O indivíduo não pode renunciar definitivamente à sua dignidade ou direitos essenciais.
5. **Relatividade (Não Absolutos)**: Nenhum direito é absoluto. Em colisão, aplica-se a ponderação e razoabilidade (ex: previsão constitucional de pena de morte em guerra declarada).
6. **Proibição do Retrocesso (Efeito Cliquet)**: O Estado não pode retroceder nem anular garantias e direitos já conquistados.

---

## 3. AS DIMENSÕES / GERAÇÕES DOS DIREITOS HUMANOS (Mnemônico L.I.F.E)
- **1ª Dimensão (LIBERDADE)**:
  - *Conteúdo*: Direitos civis e políticos (vida, locomoção, voto, propriedade, garantias processuais).
  - *Atuação do Estado*: **Prestação Negativa** (o Estado não deve interferir arbitrariamente).
  - *Marco Histórico*: Revoluções Burguesas (Francesa e Americana do século XVIII).
- **2ª Dimensão (IGUALDADE)**:
  - *Conteúdo*: Direitos sociais, econômicos e culturais (saúde pública, educação, trabalho digno, previdência social).
  - *Atuação do Estado*: **Prestação Positiva** (o Estado atua ativamente fornecendo serviços essenciais).
  - *Marco Histórico*: Revolução Industrial e Constituições do México (1917) e Weimar (1919).
- **3ª Dimensão (FRATERNIDADE / SOLIDARIEDADE)**:
  - *Conteúdo*: Direitos difusos e coletivos (meio ambiente equilibrado, paz mundial, progresso e autodeterminação dos povos).
  - *Marco Histórico*: Pós-Segunda Guerra Mundial (1945) e Carta das Nações Unidas.
- **4ª Dimensão**: Democracia direta participativa, direito à informação e limites à biotecnologia/genoma humano.
- **5ª Dimensão (Paulo Bonavides)**: A Paz Mundial como direito autônomo supremo da humanidade.

---

## 4. INCORPORAÇÃO DE TRATADOS DE DIREITOS HUMANOS NO BRASIL (STF)
- O procedimento de internalização é bifásico (Assinatura do Presidente + Aprovação pelo Congresso + Decreto Presidencial).
- **Hierarquia Normativa dos Tratados Internacionais (RE 466.343/SP e EC 45/2004)**:
  1. *Tratados de Direitos Humanos aprovados pelo Rito de Emenda (Art. 5º, § 3º da CF/88)*:
     - Aprovados em **2 turnos**, em **cada Casa do Congresso**, por **3/5 dos votos**.
     - **Status: EMENDA CONSTITUCIONAL**.
  2. *Tratados de Direitos Humanos aprovados pelo Rito Comum (Maioria Simples)*:
     - **Status: SUPRALEGAL** (abaixo da CF, mas acima de todas as leis ordinárias).
     - Exemplo: Pacto de San José da Costa Rica (CADH). Paralisou a prisão civil do depositário infiel (Súmula Vinculante 25 do STF).
  3. *Tratados Comuns (que não tratam de Direitos Humanos)*:
     - **Status: LEI ORDINÁRIA FEDERAL**.''',
  mapaMental: const MapaMentalData(
    titulo: 'DIREITOS HUMANOS: TEORIA GERAL E TRATADOS',
    conceitoCentral: 'Gerações dos Direitos (Liberdade, Igualdade e Fraternidade) e Pirâmide de Tratados no STF.',
    regraDeOuro: '1ª Dimensão = Liberdade (Não Fazer do Estado). 2ª Dimensão = Igualdade (Fazer do Estado). Rito do Art. 5º §3º (3/5 dos votos em 2 turnos) = Emenda Constitucional!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Dimensões (L.I.F.E)',
        subtitulo: 'Evolução Histórica',
        corRamo: Color(0xFFDC2626),
        icone: Icons.history_edu,
        itens: [
          MapaMentalItem(
            titulo: '1ª Dimensão: Liberdade',
            descricao: 'Direitos civis e políticos. Estado absenteísta (prestação negativa).',
            mnemonico: 'Liberdade (Século XVIII)',
          ),
          MapaMentalItem(
            titulo: '2ª Dimensão: Igualdade',
            descricao: 'Direitos sociais, econômicos e culturais. Estado prestacional ativo.',
            mnemonico: 'Igualdade (Século XX)',
          ),
          MapaMentalItem(
            titulo: '3ª Dimensão: Fraternidade',
            descricao: 'Direitos difusos, meio ambiente equilibrado e paz coletiva.',
            mnemonico: 'Solidariedade (Pós-Guerra 1945)',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Incorporação de Tratados',
        subtitulo: 'Pirâmide do STF',
        corRamo: Color(0xFF2563EB),
        icone: Icons.account_balance,
        itens: [
          MapaMentalItem(
            titulo: 'Rito de Emenda (Art. 5º §3º)',
            descricao: '2 turnos + 3/5 dos votos nas duas Casas = Equivalência de Emenda Constitucional.',
            mnemonico: '3/5 em 2 turnos = Norma Constitucional',
          ),
          MapaMentalItem(
            titulo: 'Rito Comum (Maioria Simples)',
            descricao: 'Status Supralegal (abaixo da CF, acima das leis ordinárias).',
            mnemonico: 'Pacto San José = Supralegal (Súmula Vinc. 25)',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Características Basilares',
        subtitulo: 'Regras de Ouro',
        corRamo: Color(0xFF16A34A),
        icone: Icons.verified_user,
        itens: [
          MapaMentalItem(
            titulo: 'Relatividade e Proporcionalidade',
            descricao: 'Nenhum direito é absoluto. Vida admite pena de morte em guerra.',
            mnemonico: 'Não há direito absoluto',
          ),
          MapaMentalItem(
            titulo: 'Efeito Cliquet',
            descricao: 'Proibição de retrocesso social em direitos conquistados.',
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
      disciplina: 'Direitos Humanos',
      assunto: 'Dimensões dos Direitos Humanos',
      enunciado: 'No que diz respeito à evolução e às dimensões dos Direitos Humanos, os direitos civis e políticos, orientados pelo valor supremo da liberdade e caracterizados por exigirem uma abstenção ou prestação negativa do Estado, são classificados como de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Primeira dimensão.',
        'B': 'Segunda dimensão.',
        'C': 'Terceira dimensão.',
        'D': 'Quarta dimensão.',
        'E': 'Quinta dimensão.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Primeira dimensão)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) CORRETA. Os direitos de primeira dimensão consagram a LIBERDADE (direitos civis e políticos individuais: vida, propriedade, locomoção e voto). Exigem uma abstenção (prestação negativa) do Estado perante o indivíduo.
• B) INCORRETA. A 2ª dimensão consagra a IGUALDADE (direitos sociais, saúde, educação, exigindo prestação positiva).
• C) INCORRETA. A 3ª dimensão consagra a FRATERNIDADE/SOLIDARIEDADE (meio ambiente, direitos difusos).''',
    ),
    QuestaoModel(
      id: 802,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direitos Humanos',
      assunto: 'Incorporação de Tratados e STF',
      enunciado: 'Nos termos da Constituição Federal de 1988 e da jurisprudência consolidada do Supremo Tribunal Federal, os tratados e convenções internacionais sobre direitos humanos que forem aprovados, em cada Casa do Congresso Nacional, em dois turnos, por três quintos dos votos dos respectivos membros, adquirem no ordenamento jurídico brasileiro a eficácia e o status formal de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Lei Complementar Federal.',
        'B': 'Emenda Constitucional.',
        'C': 'Norma Supralegal com efeitos vinculantes parciais.',
        'D': 'Lei Ordinária sujeita a controle concentrado difuso.',
        'E': 'Decreto Legislativo Autônomo com eficácia contida.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Emenda Constitucional)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Artigo 5º, § 3º da CF/88 (inserido pela EC 45/2004): Tratados sobre direitos humanos aprovados em 2 turnos por 3/5 dos votos em ambas as Casas do Congresso equivalem formalmente a EMENDAS CONSTITUCIONAIS.''',
    ),
  ],
);

/// Aula 02 Oficial de Direitos Humanos da PM-PE:
/// Declaração Universal dos Direitos Humanos (DUDH 1948 - ONU)
final aulaGuiaItemDh02 = AulaGuiaItem(
  numero: '02',
  titulo: 'Declaração Universal dos Direitos Humanos (DUDH 1948 - ONU): Artigos Estratégicos e Aplicação Policial',
  detalhes: '22 min • Método CRAVOU • Resolução 217-A e Análise Artigo por Artigo • 15 questões',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# DECLARAÇÃO UNIVERSAL DOS DIREITOS HUMANOS (DUDH 1948)

## 1. CONTEXTO HISTÓRICO E VALOR JURÍDICO
- Proclamada em **10 de dezembro de 1948** pela Assembleia Geral da ONU através da **Resolução 217-A (III)** em Paris.
- Surgiu no contexto do pós-Segunda Guerra Mundial para impedir a repetição dos horrores do Holocausto e crimes contra a humanidade.
- **Natureza Jurídica**: Formalmente é uma resolução internacional recomendatória, mas que se transformou materialmente em **Costume Internacional Obrigatório e norma de Jus Cogens**, servindo de bússola para o constitucionalismo democrático mundial.

---

## 2. ANÁLISE DOS PRINCIPAIS ARTIGOS COBRADOS EM CONCURSOS POLICIAIS
- **Artigo 1º**: Todos os seres humanos nascem livres e iguais em dignidade e em direitos. Dotados de razão e consciência, devem agir fraternalmente.
- **Artigo 3º (Tríade Protetiva)**: Todo indivíduo tem direito à **vida**, à **liberdade** e à **segurança pessoal**.
- **Artigo 4º**: Ninguém será mantido em escravidão ou servidão; a escravidão e o tráfico de escravos são proibidos em todas as suas formas.
- **Artigo 5º**: Ninguém será submetido a **tortura**, nem a tratamento ou castigo cruel, desumano ou degradante.
- **Artigo 9º**: Ninguém pode ser arbitrariamente preso, detido ou exilado.
- **Artigo 11 (Presunção de Inocência e Legalidade)**:
  - Todo acusado tem direito a ser presumido inocente até prova legal de sua culpa em julgamento público com todas as garantias de defesa.
  - Ninguém pode ser condenado por ato que, no momento de sua prática, não constituía crime (Anterioridade da Lei Penal).
- **Artigo 12**: Proteção contra ingerências arbitrárias na vida privada, família, domicílio ou correspondência.
- **Artigo 14 (O Direito de Asilo e a Pegadinha da Banca)**:
  - Toda pessoa perseguida tem o direito de procurar e gozar de asilo em outros países.
  - **Atenção Mortal da AOCP**: Esse direito NÃO pode ser invocado em caso de perseguição legitimamente motivada por **crimes de direito comum** (homicídio comum, roubo) ou atos contrários aos princípios da ONU!
- **Artigo 29**: O indivíduo possui deveres para com a comunidade. Os direitos sofrem limitações apenas para garantir os direitos alheios e a ordem pública em uma sociedade democrática.''',
  mapaMental: const MapaMentalData(
    titulo: 'DUDH (1948 - ONU): ARTIGOS ESSENCIAIS',
    conceitoCentral: 'Resolução 217-A da ONU, Proibição da Tortura e Escravidão, Presunção de Inocência e Asilo Político.',
    regraDeOuro: 'Artigo 3º = Vida, Liberdade e Segurança. Artigo 5º = Proibida Tortura. Artigo 14 = Asilo NÃO vale para crimes de direito comum!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Garantias Penais',
        subtitulo: 'Segurança e Prisão',
        corRamo: Color(0xFFDC2626),
        icone: Icons.gavel,
        itens: [
          MapaMentalItem(
            titulo: 'Presunção de Inocência (Art. 11)',
            descricao: 'Inocente até comprovação formal da culpa em processo público.',
          ),
          MapaMentalItem(
            titulo: 'Proibição de Tortura (Art. 5º)',
            descricao: 'Veda tortura e tratamentos degradantes em qualquer circunstância.',
          ),
          MapaMentalItem(
            titulo: 'Prisão Legal (Art. 9º)',
            descricao: 'Vedada qualquer prisão, detenção ou exílio arbitrário.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Liberdades Civis',
        subtitulo: 'Asilo e Vida Privada',
        corRamo: Color(0xFF2563EB),
        icone: Icons.public,
        itens: [
          MapaMentalItem(
            titulo: 'Asilo Político (Art. 14)',
            descricao: 'Direito a asilo. EXCEÇÃO: Não se aplica a crimes de direito comum!',
            mnemonico: 'Crime comum = Sem asilo DUDH',
          ),
          MapaMentalItem(
            titulo: 'Inviolabilidades (Art. 12)',
            descricao: 'Vida privada, domicílio e correspondência protegidos.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 803,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direitos Humanos',
      assunto: 'DUDH - Direito de Asilo',
      enunciado: 'Em conformidade com as regras expressas da Declaração Universal dos Direitos Humanos (DUDH/1948), o direito de procurar e gozar de asilo político em outros países NÃO pode ser invocado no caso de:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Perseguição decorrente de manifestação pacífica de convicções filosóficas.',
        'B': 'Perseguição motivada legitimamente por crimes de direito comum ou por atos contrários aos princípios da ONU.',
        'C': 'Discordância ideológica formal contra o regime político vigente no Estado de origem.',
        'D': 'Processamento judicial fundamentado em crença e prática religiosa minoritária.',
        'E': 'Atividade jornalística independente de oposição aos governantes locais.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Crimes de direito comum)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. Literalidade do Artigo 14, item 2 da DUDH: "Este direito não pode ser invocado em caso de perseguição legitimamente motivada por crimes de direito comum ou por atos contrários aos objetivos e princípios das Nações Unidas".''',
    ),
  ],
);

/// Aula 03 Oficial de Direitos Humanos da PM-PE:
/// Convenção Americana sobre Direitos Humanos (Pacto de San José da Costa Rica) e Sistema Interamericano
final aulaGuiaItemDh03 = AulaGuiaItem(
  numero: '03',
  titulo: 'Pacto de San José da Costa Rica (CADH) e Sistema Interamericano de Direitos Humanos (OEA)',
  detalhes: '22 min • Método CRAVOU • Audiência de Custódia, Comissão vs Corte IDH • 15 questões',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# CONVENÇÃO AMERICANA SOBRE DIREITOS HUMANOS (PACTO DE SAN JOSÉ DA COSTA RICA)

## 1. NATUREZA E STATUS NORMATIVO NO BRASIL
- Adotada em **1969** em San José (Costa Rica) e promulgada no Brasil pelo **Decreto nº 678/1992**.
- Possui status de **NORMA SUPRALEGAL** (está abaixo da Constituição Federal, mas acima de todas as leis ordinárias e processuais internas).
- **Proibição da Prisão Civil do Depositário Infiel (Art. 7.7 e Súmula Vinculante 25 do STF)**:
  - O Pacto admite unicamente a prisão civil pelo inadimplemento inescusável de **obrigação alimentar**.
  - A prisão civil de depositário infiel foi paralisada e declarada ilícita pelo STF em razão do status supralegal do Pacto.

---

## 2. DISPOSITIVOS VITAIS PARA A ATIVIDADE POLICIAL
- **Audiência de Custódia (Art. 7.5)**: Toda pessoa presa tem o direito de ser conduzida, sem demora (no Brasil: prazo de até 24 horas - Art. 310 do CPP), à presença de um juiz.
- **Direito à Informação dos Motivos da Prisão (Art. 7.4)**: O detido deve ser informado das razões de sua prisão no momento em que for capturado.
- **Direito à Não Autoincriminação (Art. 8.2, "g")**: Direito irrenunciável de não ser obrigado a depor contra si mesmo nem a confessar culpa (*Nemo tenetur se detegere*).
- **Pena de Morte (Art. 4º)**: Proibição de restabelecer a pena de morte em países que a tenham abolido. Proibida sua aplicação a menores de 18 anos, maiores de 70 anos e mulheres grávidas.
- **Suspensão de Garantias (Art. 27)**: Em estado de sítio ou emergência, NUNCA podem ser suspensos: Direito à vida, integridade pessoal, proibição da escravidão, liberdade de consciência e o Habeas Corpus!

---

## 3. OS DOIS ÓRGÃOS DE PROTEÇÃO DO SISTEMA INTERAMERICANO (OEA)
1. **Comissão Interamericana de Direitos Humanos (CIDH)**:
   - Sede: **Washington, D.C. (Estados Unidos)**.
   - Composta por 7 membros independentes eleitos pela OEA.
   - Natureza consultiva e instrutória: recebe queixas e petições individuais de **qualquer pessoa ou ONG**, realiza inspeções e submete casos à Corte.
2. **Corte Interamericana de Direitos Humanos (Corte IDH)**:
   - Sede: **San José (Costa Rica)**.
   - Composta por 7 juízes juristas eleitos pela OEA.
   - Natureza Judicial: Profere sentenças condenatórias obrigatórias e vinculantes aos Estados.
   - **Regra de Ouro da Banca**: **Cidadãos individuais NÃO podem entrar diretamente com processos na Corte IDH**! Apenas os **Estados Partes e a Comissão Interamericana** têm legitimidade para submeter um caso à Corte!''',
  mapaMental: const MapaMentalData(
    titulo: 'PACTO DE SAN JOSÉ DA COSTA RICA (CADH)',
    conceitoCentral: 'Audiência de Custódia (24h), Supralegalidade e Estrutura da Comissão (Washington) vs Corte (San José).',
    regraDeOuro: 'Cidadãos peticionam na COMISSÃO (Washington). Apenas a COMISSÃO e ESTADOS acionam a CORTE (San José)!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Garantias Judiciais',
        subtitulo: 'Regras da Prisão',
        corRamo: Color(0xFFDC2626),
        icone: Icons.security,
        itens: [
          MapaMentalItem(
            titulo: 'Audiência de Custódia',
            descricao: 'Condução imediata do preso perante o juiz em até 24 horas.',
            mnemonico: 'Apresentação em 24h sem demora',
          ),
          MapaMentalItem(
            titulo: 'Prisão por Dívida',
            descricao: 'VEDADA prisão civil de depositário infiel (Súmula Vinculante 25).',
            mnemonico: 'Apenas Pensão Alimentícia',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Órgãos do Sistema (OEA)',
        subtitulo: 'Comissão vs Corte',
        corRamo: Color(0xFF2563EB),
        icone: Icons.apartment,
        itens: [
          MapaMentalItem(
            titulo: 'Comissão (Washington)',
            descricao: 'Recebe queixas de indivíduos e ONGs. Fiscaliza e recomenda.',
            mnemonico: 'Indivíduos acessam a Comissão',
          ),
          MapaMentalItem(
            titulo: 'Corte IDH (San José)',
            descricao: 'Julga e condena Estados soberanos com sentenças vinculantes.',
            mnemonico: 'Apenas Comissão e Estados acessam a Corte',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 804,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direitos Humanos',
      assunto: 'Sistema Interamericano de Direitos Humanos',
      enunciado: 'No que concerne à competência e ao funcionamento dos órgãos de proteção previstos na Convenção Americana sobre Direitos Humanos (Pacto de San José da Costa Rica), assinale a afirmativa correta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Qualquer cidadão brasileiro que sofrer violação de seus direitos pode propor ação indenizatória direta perante a Corte Interamericana de Direitos Humanos.',
        'B': 'Somente os Estados Partes e a Comissão Interamericana têm o direito de submeter um caso à decisão contenciosa da Corte Interamericana de Direitos Humanos.',
        'C': 'A Comissão Interamericana de Direitos Humanos tem sede em San José da Costa Rica e funciona como tribunal penal internacional.',
        'D': 'O Brasil não aceitou a jurisdição contenciosa da Corte Interamericana de Direitos Humanos, tendo suas decisões mero caráter consultivo.',
        'E': 'As audiências de custódia foram consideradas incompatíveis com o Pacto de San José da Costa Rica pela jurisprudência do STF.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Somente Estados e Comissão submetem casos à Corte)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• B) CORRETA. O Artigo 61, parágrafo 1º da CADH veda o acesso individual direto à Corte IDH: "Somente os Estados Partes e a Comissão têm direito de submeter um caso à decisão da Corte". As vítimas apresentam suas petições perante a Comissão em Washington.''',
    ),
  ],
);

/// Acervo Oficial de Direitos Humanos da PM-PE
class DireitosHumanosConteudoOficial {
  DireitosHumanosConteudoOficial._();

  static final List<AulaGuiaItem> aulas = [
    aulaGuiaItemDh01,
    aulaGuiaItemDh02,
    aulaGuiaItemDh03,
  ];

  static List<QuestaoModel> get todasAsQuestoes {
    final List<QuestaoModel> lista = [];
    for (final aula in aulas) {
      if (aula.questoes != null) {
        lista.addAll(aula.questoes!);
      }
    }
    return lista;
  }

  static ModuloGuiaEstudo get moduloGuiaEstudo {
    return ModuloGuiaEstudo(
      id: 'direitos_humanos',
      nome: 'Direitos Humanos (Teoria Geral, DUDH & CADH)',
      icone: '🛡️',
      corBadge: const Color(0xFFDC2626),
      totalAulas: aulas.length,
      totalQuestoes: todasAsQuestoes.length,
      aulas: aulas,
    );
  }
}
