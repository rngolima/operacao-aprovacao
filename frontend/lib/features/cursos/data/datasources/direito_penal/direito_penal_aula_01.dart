import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// Aula 01 Oficial de Direito Penal: Princípios Penais e Aplicação da Lei Penal
/// Contém:
/// 1. Resumo Teórico Enriquecido (Linguagem clara, autoral e didática);
/// 2. Mapa Mental Tático Estruturado (Conceito Central + Regra de Ouro + 4 Ramos);
/// 3. Bateria Completa de 15 Questões Comentadas (Estilo Cebraspe / Instituto AOCP).
final aulaGuiaItemDireitoPenal01 = AulaGuiaItem(
  numero: '01',
  titulo: 'Princípios Fundamentais do Direito Penal e Aplicação da Lei Penal no Tempo e Espaço',
  detalhes: '18 min • Legalidade, Insignificância e Tempo/Lugar do Crime • 15 questões',
  concluida: false,
  destaque: true,
  conteudoTeorico: '''# ⚖️ DIREITO PENAL TÁTICO - AULA 01
## Princípios Constitucionais Penais e Aplicação da Lei Penal

---

### 📌 1. Princípio da Legalidade / Reserva Legal (Art. 5º, XXXIX da CF/88 e Art. 1º do CP)
O Direito Penal é a ferramenta mais invasiva do Estado. Por isso, vige a regra inegociável:
> *"Não há crime sem lei anterior que o defina, nem pena sem prévia cominação legal."*

#### Os 4 Desdobramentos da Legalidade:
1. **Anterioridade da Lei Penal (*Lex Praevia*)**: A lei penal incriminadora não retroage para punir fatos praticados antes da sua entrada em vigor.
2. **Reserva Legal Estrita (*Lex Scripta*)**: Somente lei em sentido formal (ordinária ou complementar) pode criar tipos penais e cominar penas. Medida Provisória **NÃO** pode criar crimes nem majorar penas (Art. 62, §1º, I, "b" da CF/88).
3. **Taxatividade e Certeza (*Lex Certa*)**: É vedada a criação de crimes com tipos vagos, abertos ou ambíguos. O cidadão precisa saber com exatidão o que é proibido.
4. **Proibição da Analogia Incriminadora (*Lex Stricta*)**: É permitida a analogia apenas *in bonam partem* (em benefício do réu). É proibida a analogia *in malam partem*.

---

### 🔍 2. Princípio da Insignificância (Bagatela Própria)
O princípio da insignificância atua como causa de **exclusão da tipicidade material** da conduta (o fato deixa de ser crime).

#### Requisitos Cumulativos do STF e STJ (Mnemônico MARI):
• **M** - Mínima ofensividade da conduta do agente;  
• **A** - Ausência de periculosidade social da ação;  
• **R** - Reduzidíssimo grau de reprovabilidade do comportamento;  
• **I** - Inexpressividade da lesão jurídica provocada.  

#### ⚠️ Vedações e Súmulas de Prova Policial:
- **Súmula 599 do STJ**: O princípio da insignificância é **inaplicável aos crimes contra a Administração Pública** (salvo a hipótese do crime de descaminho tributário até R\$ 20.000,00).
- **Súmula 588 do STJ**: É **inaplicável** aos crimes e contravenções cometidos com violência ou grave ameaça à mulher no âmbito das relações domésticas.
- **Crimes com Violência Real**: Roubo, extorsão e homicídio JAMAIS admitem insignificância.

---

### ⏳ 3. Lei Penal no Tempo (Art. 2º a 4º do CP)
- **Regra**: Aplica-se a lei vigente ao tempo da conduta (*tempus regit actum*).
- **Exceção (Retroatividade Benéfica)**: A lei penal só retroage para beneficiar o réu (*lex mitior*).
- **Abolitio Criminis**: Lei nova que deixa de considerar o fato como crime extingue todos os efeitos penais da condenação (permanecem apenas efeitos civis).
- **Tempo do Crime (Art. 4º do CP)**: Adota a **Teoria da Atividade** — momento da ação ou omissão, mesmo que outro seja o resultado.
- **Súmula 711 do STF (Crimes Permanentes e Continuados)**:
  > *"A lei penal mais grave aplica-se ao crime continuado ou permanente, se a sua vigência é anterior à cessação da continuidade ou permanência."*

---

### 🗺️ 4. Lei Penal no Espaço (Art. 5º e 6º do CP)
- **Lugar do Crime (Art. 6º do CP)**: Adota a **Teoria da Ubiquidade (ou Mista)** — o crime é considerado praticado tanto no local da ação/omissão quanto no local onde ocorreu ou deveria ocorrer o resultado.
- **Mnemônico Tático LUTA**:
  - **L**ugar do Crime = **U**biquidade
  - **T**empo do Crime = **A**tividade
''',
  mapaMental: const MapaMentalData(
    titulo: 'DIREITO PENAL: PRINCÍPIOS E LEI PENAL',
    conceitoCentral: 'A espinha dorsal das garantias penais: Legalidade estrita, Tipicidade material e Aplicação temporal e espacial da norma penal.',
    regraDeOuro: 'L.U.T.A: Lugar é Ubiquidade; Tempo é Atividade. Insignificância exige M.A.R.I e é vedada na Administração Pública (Súmula 599 STJ)!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Legalidade Estrita',
        subtitulo: 'Anterioridade e Reserva Legal',
        corRamo: Color(0xFF1E3A8A),
        icone: Icons.balance,
        itens: [
          MapaMentalItem(
            titulo: 'Anterioridade da Lei',
            descricao: 'Não há crime sem lei anterior que o defina, nem pena sem prévia cominação legal.',
            mnemonico: 'Lei penal não retroage para prejudicar o réu',
          ),
          MapaMentalItem(
            titulo: 'Taxatividade',
            descricao: 'Vedada a criação de crimes por normas vagas, indeterminadas ou por Medida Provisória.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Insignificância (MARI)',
        subtitulo: 'Exclusão da Tipicidade Material',
        corRamo: Color(0xFF10B981),
        icone: Icons.verified_user,
        itens: [
          MapaMentalItem(
            titulo: 'Requisitos do STF / STJ',
            descricao: 'Mínima ofensividade, Ausência de periculosidade, Reduzido grau de reprovabilidade, Inexpressividade da lesão.',
            mnemonico: 'M.A.R.I',
          ),
          MapaMentalItem(
            titulo: 'Vedações Sumuladas',
            descricao: 'Inaplicável a crimes contra a Administração Pública (Súmula 599 STJ) e Violência Doméstica (Súmula 589 STJ).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Lei Penal no Tempo',
        subtitulo: 'Teoria da Atividade (Art. 4º)',
        corRamo: Color(0xFFF59E0B),
        icone: Icons.access_time,
        itens: [
          MapaMentalItem(
            titulo: 'Tempo do Crime',
            descricao: 'Considera-se praticado o crime no momento da ação ou omissão, ainda que outro seja o do resultado.',
            mnemonico: 'T-A: Tempo = Atividade',
          ),
          MapaMentalItem(
            titulo: 'Crime Permanente',
            descricao: 'Aplica-se a lei penal mais grave se sua vigência é anterior à cessação da permanência (Súmula 711 STF).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Lei Penal no Espaço',
        subtitulo: 'Teoria da Ubiquidade (Art. 6º)',
        corRamo: Color(0xFF6366F1),
        icone: Icons.public,
        itens: [
          MapaMentalItem(
            titulo: 'Lugar do Crime',
            descricao: 'Lugar onde ocorreu a ação/omissão, no todo ou em parte, bem como onde se produziu ou deveria produzir-se o resultado.',
            mnemonico: 'L-U: Lugar = Ubiquidade (Mista)',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 201,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípios do Direito Penal',
      enunciado: 'O princípio da legalidade penal desdobra-se em anterioridade da lei penal e reserva legal. Em decorrência do princípio da reserva legal estrita, é vedada a criação de crimes ou a majoração de penas por meio de Medida Provisória, ainda que em caráter de urgência e relevância social.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNDAMENTAÇÃO CONSTITUCIONAL E PENAL:
O item está perfeito e expressa a literalidade do Art. 62, § 1º, I, "b", da Constituição Federal de 1988, introduzido pela EC nº 32/2001:
• É expressamente vedada a edição de Medidas Provisórias sobre matéria relativa a Direito Penal, Processual Penal e Processual Civil.
• A criação de crimes e a cominação de penas sujeitam-se à Reserva Legal Estrita (lei formal votada pelo Congresso Nacional).

💡 O PULO DO GATO CEBRASPE:
A banca costuma tentar confundir o candidato afirmando que MP pode criar crime se for benéfica ao réu. Falso! Medida Provisória não pode tratar de matéria penal incriminadora sob hipótese alguma!''',
    ),
    QuestaoModel(
      id: 202,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Insignificância',
      enunciado: 'Servidor público da Polícia Civil que subtrai de sua repartição três resmas de folhas de papel para uso pessoal não pode ser beneficiado pelo princípio da insignificância, em razão do entendimento sumulado de que este princípio não se aplica aos crimes contra a Administração Pública.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNDAMENTAÇÃO JURISPRUDENCIAL VINCULANTE:
O item retrata com fidelidade a Súmula 599 do Superior Tribunal de Justiça (STJ):
"O princípio da insignificância é inaplicável aos crimes contra a administração pública."

• A ratio decidendi da súmula apoia-se no fato de que o bem jurídico tutelado pelo crime de peculato (Art. 312 do CP) não é apenas o valor patrimonial dos bens, mas a probidade, moralidade e a integridade da Administração Pública, que são valores indisponíveis e imensuráveis economicamente.

💡 O PULO DO GATO:
Cuidado para não confundir com o crime de descaminho (Art. 334 do CP), no qual o STJ e STF admitem bagatela para tributos sonegados de até R\$ 20.000,00! Nos demais crimes funcionais contra a administração, a Súmula 599 é implacável!''',
    ),
    QuestaoModel(
      id: 203,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Lei Penal no Tempo e Espaço',
      enunciado: 'No que concerne à aplicação da lei penal no tempo e no espaço, o Código Penal brasileiro adotou, respectivamente, as seguintes teorias:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Teoria do Resultado para o tempo do crime e Teoria da Atividade para o lugar do crime.',
        'B': 'Teoria da Atividade para o tempo do crime e Teoria da Ubiquidade para o lugar do crime.',
        'C': 'Teoria da Ubiquidade para o tempo do crime e Teoria da Atividade para o lugar do crime.',
        'D': 'Teoria Mista para o tempo do crime e Teoria do Resultado para o lugar do crime.',
        'E': 'Teoria da Atividade tanto para o tempo quanto para o lugar do crime.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Atividade e Ubiquidade)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA (Mnemônico LUTA):
• A) INCORRETA. Inverteu as teorias e errou os conceitos.
• B) CORRETA. O Código Penal adota a Teoria da Atividade para o tempo do crime (Art. 4º: considera-se praticado o crime no momento da ação ou omissão) e a Teoria da Ubiquidade para o lugar do crime (Art. 6º: considera-se praticado no lugar da ação/omissão bem como onde se produziu ou deveria produzir-se o resultado).
• C) INCORRETA. Trocou a ordem das teorias.
• D) INCORRETA. Não se adota teoria mista para tempo do crime.
• E) INCORRETA. A teoria da atividade para o lugar do crime é adotada apenas no Processo Penal (para fixação da comarca competente), e não no Direito Penal Material.

💡 MACETE TÁTICO L.U.T.A:
Lugar = Ubiquidade
Tempo = Atividade''',
    ),
    QuestaoModel(
      id: 204,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Aplicação da Lei Penal',
      enunciado: 'Considere que João cometeu crime de extorsão mediante sequestro (crime permanente), que se iniciou sob a vigência de uma lei penal que cominava pena de 8 a 15 anos de reclusão. Durante a manutenção do cativeiro, entrou em vigor nova lei que elevou a pena para 12 a 20 anos de reclusão. Nessa situação, aplica-se a João a lei penal nova mais gravosa.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE JURISPRUDENCIAL VINCULANTE:
A questão cobra a exata aplicação da Súmula 711 do Supremo Tribunal Federal (STF):
"A lei penal mais grave aplica-se ao crime continuado ou ao crime permanente, se a sua vigência é anterior à cessação da continuidade ou da permanência."

• Como a extorsão mediante sequestro é um crime permanente, a consumação se protrai no tempo enquanto a vítima estiver privada de sua liberdade.
• Tendo a lei nova entrado em vigor enquanto o crime ainda estava em execução, ela colhe a conduta em flagrante atividade delitiva, não havendo que se falar em irretroatividade maléfica!''',
    ),
    QuestaoModel(
      id: 205,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Escrivão de Polícia',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Insignificância',
      enunciado: 'O princípio da insignificância opera no ordenamento jurídico brasileiro como causa extintiva da punibilidade do agente, mantendo íntegra a tipicidade formal e material do fato.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 DISTINÇÃO DOGMÁTICA CRUCIAL:
• O princípio da insignificância NÃO extingue a punibilidade!
• A insignificância opera como **CAUSA EXCLUDENTE DA TIPICIDADE MATERIAL**.
• O fato torna-se um indiferente penal (atípico), o que impõe a absolvição sumária ou o trancamento do inquérito policial por falta de justa causa (fato atípico não é crime).

💡 PEGADINHA CLÁSSICA DO CEBRASPE:
A banca sempre tenta trocar "exclusão da tipicidade material" por "exclusão da ilicitude", "exclusão da culpabilidade" ou "extinção da punibilidade". Grave: Insignificância = Fato Atípico!''',
    ),
    QuestaoModel(
      id: 206,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípios do Direito Penal',
      enunciado: 'Acerca dos princípios fundamentais do Direito Penal, assinale a alternativa que indica o princípio segundo o qual o Direito Penal somente deve intervir quando os outros ramos do direito (Civil, Administrativo, Tributário) forem insuficientes para proteger o bem jurídico tutelado:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Princípio da Taxatividade.',
        'B': 'Princípio da Subsidiariedade (ou Intervenção Mínima / Ultima Ratio).',
        'C': 'Princípio da Individualização da Pena.',
        'D': 'Princípio da Culpabilidade.',
        'E': 'Princípio da Territorialidade.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Subsidiariedade / Ultima Ratio)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• A) INCORRETA. Taxatividade exige tipos penais claros e certos.
• B) CORRETA. Pelo Princípio da Intervenção Mínima, em sua vertente da Subsidiariedade, o Direito Penal é a "ultima ratio" do Estado. Ele só atua quando todos os outros ramos do ordenamento jurídico falharem na contenção do ilícito.
• C) INCORRETA. Individualização da pena refere-se à personalização da sanção pelo juiz na dosimetria.
• D) INCORRETA. Culpabilidade exige dolo ou culpa, proibindo a responsabilidade penal objetiva.
• E) INCORRETA. Territorialidade diz respeito à jurisdição espacial da lei brasileira.''',
    ),
    QuestaoModel(
      id: 207,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Abolitio Criminis',
      enunciado: 'A ocorrência da abolitio criminis faz cessar todos os efeitos penais da condenação, inclusive a reincidência e o registro de antecedentes, mas não desconstitui a obrigação civil de reparar o dano causado à vítima.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNDAMENTAÇÃO LEGAL (Art. 2º, caput, do CP):
"Ninguém pode ser punido por fato que lei posterior deixa de considerar crime, cessando em virtude dela a execução e os efeitos penais da sentença condenatória."

• Efeitos Penais: Cessam TODOS (prisão, reincidência, maus antecedentes, perda do cargo).
• Efeitos Extrapenais (Civis/Administrativos): SUBSISTEM! A obrigação de indenizar o prejuízo cível permanece hígida. O item está 100% correto!''',
    ),
    QuestaoModel(
      id: 208,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Anterioridade',
      enunciado: 'Em face do princípio da anterioridade da lei penal, uma lei penal incriminadora entra em vigor e produz efeitos imediatos desde a data de sua publicação, sendo incompatível com o ordenamento pátrio a previsão de vacatio legis para normas penais.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: ERRADO

🔍 FUNDAMENTAÇÃO JURÍDICA:
• É perfeitamente legítima e comum a existência de vacatio legis em leis penais incriminadoras para permitir que a sociedade e os operadores do direito conheçam a nova norma antes de sua vigência.
• Exemplo prático: O Pacote Anticrime (Lei 13.964/19) e a Nova Lei de Licitações (Lei 14.133/21) tiveram prazos expressos de vacatio legis para adaptação. O item erra ao dizer que vacatio legis é incompatível com o Direito Penal.''',
    ),
    QuestaoModel(
      id: 209,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Intranscendência',
      enunciado: 'O princípio constitucional segundo o qual nenhuma pena passará da pessoa do condenado, podendo a obrigação de reparar o dano e a decretação do perdimento de bens ser estendidas aos sucessores até o limite do patrimônio transferido, denomina-se:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Princípio da Proporcionalidade.',
        'B': 'Princípio da Intranscendência (ou Personalidade da Pena).',
        'C': 'Princípio da Ofensividade.',
        'D': 'Princípio da Legalidade estrita.',
        'E': 'Princípio da Isonomia processual.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Princípio da Intranscendência)

🔍 ANÁLISE DO ART. 5º, XLV DA CF/88:
"Nenhuma pena passará da pessoa do condenado, podendo a obrigação de reparar o dano e a decretação do perdimento de bens ser, nos termos da lei, estendidas aos sucessores e contra eles executadas, até o limite do valor do patrimônio transferido."

• A pena privativa de liberdade é personalíssima: filho não cumpre pena de prisão de pai.
• No entanto, a reparação civil do dano atinge a herança, mas nunca o patrimônio pessoal dos herdeiros (limite do valor transferido).''',
    ),
    QuestaoModel(
      id: 210,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Crimes a Bordo de Embarcações',
      enunciado: 'Para os efeitos da aplicação da lei penal brasileira, consideram-se como extensão do território nacional as embarcações e aeronaves brasileiras de natureza pública ou a serviço do governo brasileiro, onde quer que se encontrem.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FUNDAMENTAÇÃO LEGAL (Art. 5º, § 1º, do CP):
• As embarcações e aeronaves públicas brasileiras (ou a serviço do governo) carregam o princípio da extraterritorialidade absoluta da soberania (território ficto por equiparação): onde quer que estejam no mundo (em alto-mar, no espaço aéreo de outro país ou atracadas em porto estrangeiro), aplica-se a lei brasileira!
• Já as embarcações e aeronaves privadas só são território brasileiro se estiverem em alto-mar ou no espaço aéreo internacional correspondente.''',
    ),
    QuestaoModel(
      id: 211,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Escrivão de Polícia',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Lei Excepcional e Temporária',
      enunciado: 'As leis temporárias e as leis excepcionais possuem como característica dogmática a autorrevogabilidade e a ultratividade gravosa, aplicando-se aos fatos cometidos sob a sua vigência mesmo após decorrido o seu período de duração.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 LITERALIDADE DO ART. 3º DO CÓDIGO PENAL:
"A lei excepcional ou temporária, embora decorrido o período de sua duração ou cessadas as circunstâncias que a determinaram, aplica-se ao fato praticado durante sua vigência."

• Trata-se de uma exceção expressa à retroatividade da lei benéfica: se não fossem ultrativas, as leis da Copa do Mundo ou de calamidade não teriam eficácia intimidatória nos últimos dias de vigência. Portanto, possuem ultratividade gravosa!''',
    ),
    QuestaoModel(
      id: 212,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Culpabilidade',
      enunciado: 'O princípio da culpabilidade veda peremptoriamente no Direito Penal moderno a:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Responsabilidade penal subjetiva.',
        'B': 'Punibilidade do dolo eventual.',
        'C': 'Responsabilidade penal objetiva (punição sem dolo ou culpa).',
        'D': 'Adoção da teoria da equivalência das condições.',
        'E': 'Aplicação de medidas de segurança a inimputáveis.',
      },
      gabaritoOficial: 'C',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: C (Responsabilidade Objetiva)

🔍 ANÁLISE DOUTRINÁRIA:
• Nullum crimen sine culpa: Não há crime sem dolo ou culpa. O Direito Penal brasileiro adota a responsabilidade penal subjetiva (Art. 18 do CP).
• É terminantemente vedada a responsabilidade penal objetiva (punir alguém pelo mero resultado causal sem dolo ou culpa do agente). A única exceção histórica residual é discutida em crimes ambientais de pessoa jurídica, mas para a pessoa física a proibição é absoluta!''',
    ),
    QuestaoModel(
      id: 213,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Contagem de Prazo Penal',
      enunciado: 'Na contagem dos prazos penais, inclui-se o dia do começo e computam-se os dias, os meses e os anos pelo calendário comum, não se prorrogando o prazo para o primeiro dia útil subsequente caso o termo final recaia em domingo ou feriado.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 DIFERENÇA CRUCIAL: PRAZO PENAL VS PRAZO PROCESSUAL:
• Prazo Penal (Art. 10 do CP): Favorece a liberdade. INCLUI o dia do começo e NÃO se prorroga se cair em final de semana ou feriado (o preso sai no domingo se a pena vencer no domingo!).
• Prazo Processual (Art. 798 do CPP): EXCLUI o dia do começo, inclui o do vencimento e prorroga-se para o primeiro dia útil. O item versa sobre o prazo PENAL e está certíssimo!''',
    ),
    QuestaoModel(
      id: 214,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia Civil',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Princípio da Confiança',
      enunciado: 'O princípio da confiança, derivado da teoria da imputação objetiva, estabelece que quem atua em estrita conformidade com as regras de cuidado exigidas pela ordem jurídica pode confiar legitimamente que os demais partícipes sociais também as cumprirão.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 TEORIA DA IMPUTAÇÃO OBJETIVA (Claus Roxin):
• Quem trafega na velocidade permitida e no sinal verde pode confiar que os pedestres não atravessarão repentinamente fora da faixa. Não há criação de risco juridicamente proibido, afastando a imputação objetiva e a tipicidade do crime culposo. Gabarito CERTO!''',
    ),
    QuestaoModel(
      id: 215,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Direito Penal',
      assunto: 'Frações Não Computáveis da Pena',
      enunciado: 'De acordo com o Código Penal brasileiro (Art. 11), desprezam-se nas penas privativas de liberdade e nas restritivas de direitos:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'As frações de dia e, na pena de multa, as frações de cruzeiro (moeda corrente).',
        'B': 'As horas e os minutos em qualquer caso de execução penal.',
        'C': 'Apenas os centavos da condenação em custas processuais.',
        'D': 'Os dias cumpridos em regime semiaberto.',
        'E': 'As frações de semana em regimes abertos.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (Frações de dia e de moeda)

🔍 LITERALIDADE DO ART. 11 DO CP:
"Desprezam-se, nas penas privativas de liberdade e nas restritivas de direitos, as frações de dia, e, na pena de multa, as frações de cruzeiro."
• Se a pena for fixada em 1 ano e 10 horas, o réu cumpre 1 ano (despreza-se a fração de dia). Na multa, desprezam-se os centavos residuais. Questão literal clássica de concurso!''',
    ),
  ],
);
