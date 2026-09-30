import 'package:flutter/material.dart';
import '../../../../questoes/data/models/questao_model.dart';
import '../../models/aula_guia_model.dart';
import '../../models/mapa_mental_model.dart';

/// AULA 02: Ortografia Oficial, Acentuação Gráfica e Emprego do Hífen (Novo Acordo)
final AulaGuiaItem portuguesAula02 = AulaGuiaItem(
  numero: '02',
  titulo: 'Ortografia Oficial, Acentuação Gráfica e Emprego do Hífen (Novo Acordo)',
  detalhes: '16 min • Método CRAVOU • 15 questões comentadas',
  concluida: false,
  conteudoTeorico: '''# ACENTUAÇÃO GRÁFICA, ORTOGRAFIA E HÍFEN (NOVO ACORDO)

## 1. REGRAS GERAIS DE ACENTUAÇÃO GRÁFICA
1. **Proparoxítonas**:
   - REGRA ABSOLUTA: **Todas** são acentuadas sem exceção!
   - Exemplos: *cânone*, *tático*, *público*, *viúva*, *álbum* (atenção: paroxítona!), *relâmpago*, *militaríssimo*.
2. **Oxítonas**:
   - Acentuam-se as terminadas em: **A(s), E(s), O(s), EM / ENS**.
   - Exemplos: *crachá*, *você*, *cipó*, *alguém*, *armazéns*, *parabéns*.
   - ATENÇÃO: Oxítonas terminadas em I ou U NÃO levam acento pela regra geral (ex: *Recife*, *Rubi*, *urubu*, *caju*).
3. **Paroxítonas**:
   - Mnemônico das terminações: **R-O-U-X-I-N-O-L** + **L-I-N-U-S-P-S** + Ditongos orais + Ditongos crescentes.
   - Exemplos: *revólver*, *fácil*, *hífen*, *álbum*, *bênção*, *órfão*, *júri*, *vírus*, *bíceps*, *polícia*, *inquérito* (proparoxítona), *estratégia*.
   - **CUIDADO com o Plural**: *hífen* tem acento, mas *hifens* NÃO tem! *Pólen* tem acento, mas *polens* NÃO tem!

---

## 2. REGRAS ESPECIAIS E MUDANÇAS DO NOVO ACORDO
1. **Ditongos Abertos ÉI e ÓI em Paroxítonas PERDERAM O ACENTO**:
   - Antes: *idéia*, *geléia*, *apóio*, *bóia*.
   - Agora (SEM ACENTO): **ideia**, **geleia**, **apoio**, **boia**, **heroico**, **jiboia**, **paranoico**.
   - ATENÇÃO: Nas oxítonas e monossílabos tônicos, O ACENTO CONTINUA!
   - Exemplos: *herói*, *pastéis*, *dói*, *céu*, *chapéu*, *troféu*.
2. **Hiato I e U Tônicos**:
   - Acentua-se I e U tônicos, sozinhos na sílaba ou com "S", formando hiato: *sa-í-da*, *ba-ú*, *pa-ís*, *e-go-ís-ta*.
   - NÃO se acentua se seguido de "NH": *ra-i-nha*, *mo-i-nho*.
   - NÃO se acentua se precedido de ditongo decrescente em palavra paroxítona: *fei-u-ra*, *bai-u-ca*.
3. **Fim do Trema**:
   - Não se usa mais trema em palavras de língua portuguesa (*linguiça*, *consequência*, *cinquenta*), mantendo-se apenas em nomes próprios estrangeiros (*Müller*).
4. **Verbos Crer, Dar, Ler, Ver (Mnemônico CRE-DE-LE-VE)**:
   - Formas dobradas EE perderam acento circunflexo: *creem*, *deem*, *leem*, *veem*.
   - As formas de terceira pessoa do plural com O-O também perderam: *voo*, *enjoo*, *perdoo*.

---

## 3. REGRA DE OURO DO HÍFEN (NOVO ACORDO)
- **Regra dos Iguais se Repelem / Diferentes se Atraem**:
  - Letras IGUAIS: **Usa hífen** -> *anti-inflamatório*, *micro-ondas*, *super-resistente*.
  - Letras DIFERENTES: **Junta tudo sem hífen** -> *autoestrada*, *infraestrutura*, *semicírculo*.
  - Se a segunda palavra começar com R ou S: **Dobra o R ou S e junta** -> *antirreflexo*, *ultrassom*, *minissaia*.
  - Com prefixo **SUB** + R ou B: usa hífen (*sub-região*, *sub-bibliotecário*).
  - Com prefixos **EX, SEM, ALÉM, AQUÉM, PRÉ, PÓS, PRÓ**: SEMPRE com hífen (*ex-policial*, *sem-teto*, *pré-militar*).''',
  mapaMental: const MapaMentalData(
    titulo: 'Mapa Mental: Acentuação Gráfica e Hífen',
    conceitoCentral: 'Regras Oficiais de Acentuação e Ortografia',
    regraDeOuro: 'Proparoxítona sempre tem acento; paroxítona com ÉI/ÓI perdeu acento; iguais se hifenizam!',
    ramos: [
      MapaMentalRamo(
        tituloRamo: 'Regras Gerais',
        subtitulo: 'Posição da sílaba tônica',
        corRamo: Color(0xFF2563EB),
        icone: Icons.format_size,
        itens: [
          MapaMentalItem(
            titulo: 'Proparoxítonas',
            descricao: '100% acentuadas sem exceção.',
            exemplo: 'tático, relâmpago, escrúpulo, inquérito.',
          ),
          MapaMentalItem(
            titulo: 'Oxítonas',
            descricao: 'Terminadas em A(s), E(s), O(s), EM, ENS.',
            exemplo: 'crachá, rapé, avô, porém, vinténs.',
          ),
          MapaMentalItem(
            titulo: 'Paroxítonas',
            descricao: 'Terminações ROUXINOL + LINUSPS + Ditongos.',
            exemplo: 'revólver, tórax, júri, fácil, polícia.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Novo Acordo (Pegadinhas)',
        subtitulo: 'Mudanças mais cobradas em prova',
        corRamo: Color(0xFFDC2626),
        icone: Icons.edit_off,
        itens: [
          MapaMentalItem(
            titulo: 'Ditongos ÉI e ÓI em Paroxítonas',
            descricao: 'Perderam o acento! Mas oxítonas continuam acentuadas.',
            mnemonico: 'ideia, heroico, plateia (sem) vs herói, papéis (com)',
          ),
          MapaMentalItem(
            titulo: 'Hiato duplicado EE / OO',
            descricao: 'CRE-DE-LE-VE e OO perderam o acento circunflexo.',
            exemplo: 'eles leem, eles veem, o voo, o enjoo.',
          ),
          MapaMentalItem(
            titulo: 'Hiato I e U pós-ditongo',
            descricao: 'Paroxítonas perdem acento: feiura, baiuca.',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Acentos Diferenciais',
        subtitulo: 'Distingue classe ou tempo',
        corRamo: Color(0xFFD97706),
        icone: Icons.difference,
        itens: [
          MapaMentalItem(
            titulo: 'PÔDE vs PODE',
            descricao: 'Pôde (pretérito perfeito) vs Pode (presente). Mantido!',
          ),
          MapaMentalItem(
            titulo: 'PÔR vs POR',
            descricao: 'Pôr (verbo) vs Por (preposição). Mantido!',
          ),
          MapaMentalItem(
            titulo: 'TEM/VÊM vs TÊM/VÊM',
            descricao: 'Singular (ele tem/vem) vs Plural com circunflexo (eles têm/vêm).',
          ),
        ],
      ),
      MapaMentalRamo(
        tituloRamo: 'Regras do Hífen',
        subtitulo: 'Iguais se repelem, diferentes se atraem',
        corRamo: Color(0xFF059669),
        icone: Icons.link,
        itens: [
          MapaMentalItem(
            titulo: 'Vogais Iguais',
            descricao: 'Exige hífen: micro-ondas, anti-inflamatório.',
          ),
          MapaMentalItem(
            titulo: 'Vogais Diferentes',
            descricao: 'Junta sem hífen: autoestrada, infraestrutura.',
          ),
          MapaMentalItem(
            titulo: 'Dobra de R e S',
            descricao: 'Se o prefixo termina em vogal: minissaia, antirreflexo.',
          ),
        ],
      ),
    ],
  ),
  questoes: const [
    QuestaoModel(
      id: 201,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica',
      enunciado: 'Assinale a alternativa em que todos os vocábulos são acentuados pela mesma regra gramatical de "tático" e "específico":',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'revólver, caráter, açúcar.',
        'B': 'relâmpago, escrúpulo, inquérito.',
        'C': 'herói, troféu, chapéu.',
        'D': 'café, dominó, armazém.',
        'E': 'país, saúde, baú.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (Proparoxítonas)

🔍 DESTRINCHANDO ALTERNATIVA POR ALTERNATIVA:
• Termos do Enunciado: "tá-ti-co" e "es-pe-cí-fi-co" são palavras PROPAROXÍTONAS (a sílaba tônica é a antepenúltima). Na língua portuguesa, a regra é absoluta e sem exceções: TODAS AS PROPAROXÍTONAS SÃO ACENTUADAS.
• A) INCORRETA. "revólver", "caráter" e "açúcar" são PAROXÍTONAS terminadas em "-r" (regra das paroxítonas: L, N, R, X, PS, ã, ão, i, is, us, um, uns, ditongo).
• B) CORRETA. Todas são proparoxítonas puras: "re-lâm-pa-go" (antepenúltima tônica), "es-crú-pu-lo" (antepenúltima tônica) e "in-qué-ri-to" (antepenúltima tônica). Compartilham exatamente o mesmo princípio fonético e normativo de "tático" e "específico".
• C) INCORRETA. "herói", "troféu" e "chapéu" são OXÍTONAS terminadas em ditongos abertos tônicos ("-ói", "-éu", seguidos ou não de "-s").
• D) INCORRETA. "café", "dominó" e "armazém" são OXÍTONAS terminadas em "-e", "-o" e "-em".
• E) INCORRETA. "pa-ís", "sa-ú-de" e "ba-ú" são acentuadas pela REGRA DO HIATO (o "i" e o "u" tônicos formam sílaba sozinhos ou com "-s", não seguidos de "-nh").

💡 O PULO DO GATO / PEGADINHA DA AOCP:
Cuidado para não confundir proparoxítonas com as chamadas "paroxítonas terminadas em ditongo crescente" (como "in-dú-stria", "po-lí-cia", "sê-rie"), que alguns gramáticos chamam de "proparoxítonas aparentes ou relativas". Se a banca der uma alternativa com proparoxítonas reais ("relâmpago"), priorize-a imediatamente!''',
    ),
    QuestaoModel(
      id: 202,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica (Novo Acordo)',
      enunciado: 'De acordo com o Acordo Ortográfico vigente, assinale a opção em que a palavra destacada NÃO deve receber acento gráfico:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O policial agiu como um verdadeiro HEROI.',
        'B': 'O comandante aprovou a nova IDEIA de patrulha.',
        'C': 'Todos ouviram o eco nos PAPEIS apreendidos.',
        'D': 'O motorista foi multado pelo DETRAN.',
        'E': 'Os suspeitos estao no INTERIOR do imovel.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B (ideia - sem acento)

🔍 ANÁLISE DETALHADA E REGRA DO NOVO ACORDO:
• A) INCORRETA (Recebe acento). "Herói" (he-rói) é uma palavra OXÍTONA terminada em ditongo aberto tônico "-ói". O Novo Acordo Ortográfico NÃO aboliu o acento dos ditongos abertos em oxítonas ou monossílabos tônicos (ex: herói, constrói, troféu, papéis, dói, céu).
• B) CORRETA (NÃO recebe acento). "Ideia" (i-dei-a) é uma palavra PAROXÍTONA com ditongo aberto "-ei-". O Acordo Ortográfico de 1990 eliminou sumariamente o acento gráfico dos ditongos abertos tônicos "EI" e "OI" exclusivamente nas palavras PAROXÍTONAS! Logo: ideia, geleia, plateia, colmeia, estreia, heroico, jiboia, paranoia, assembleia perderam o acento!
• C) INCORRETA (Recebe acento). "Papéis" (pa-péis) é OXÍTONA terminada em "-éis", mantendo integralmente o acento.
• D e E) Distratores contextuais neutros.

💡 MNEMÔNICO TÁTICO CRAVOU:
"Se for OXÍTONA no fim: MANTÉM O ACENTO (Herói, Chapéu, Anéis)!
Se for PAROXÍTONA no meio: PERDEU O ACENTO (Ideia, Jiboia, Heroico)!"''',
    ),
    QuestaoModel(
      id: 203,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica',
      enunciado: 'O vocábulo "polícia" é acentuado graficamente por ser uma paroxítona terminada em ditongo crescente.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE FONÉTICA E DOUTRINÁRIA:
• Divisão Silábica Oficial: po-LÍ-cia.
• Análise da Tonicidade: A penúltima sílaba ("LÍ") é a tônica, o que classifica o vocábulo como PAROXÍTONO.
• Terminação Fonética: Termina no encontro da semivogal "i" com a vogal aberta "a" (-ia), que configura um Ditongo Oral Crescente (semivogal + vogal).
• Regra Geral: Acentuam-se todas as paroxítonas terminadas em ditongo oral, seja crescente ou decrescente, seguido ou não de "-s" (ex: po-lí-cia, vi-a-tu-ra [sem acento], prá-tia, cá-rie, his-tó-ria, mé-dia).
• Posição do Instituto AOCP e Cebraspe: Ambas as bancas cobram sistematicamente essa justificativa clássica em provas policiais militares e civis.

💡 OBSERVAÇÃO DE ALTO NÍVEL:
Alguns foneticistas consideram esses termos como "proparoxítonos eventuais/relativos" (po-lí-ci-a), mas quando o enunciado afirma categoricamente "paroxítona terminada em ditongo", a assertiva está 100% CORRETA perante o padrão tradicional!''',
    ),
    QuestaoModel(
      id: 204,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Hífen (Novo Acordo)',
      enunciado: 'Assinale a opção que apresenta grafia correta quanto ao emprego do hífen:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'anti-inflamatório e micro-ondas.',
        'B': 'antiinflamatório e microondas.',
        'C': 'auto-escola e semi-círculo.',
        'D': 'contra-regra e super-homem (com hífen facultativo).',
        'E': 'mini-saia e ultra-som.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A

🔍 DESTRINCHANDO AS REGRAS DO NOVO ACORDO PARA O HÍFEN:
1. Regra dos Opostos / Polos Magnéticos:
   • Vogais IGUAIS SE REPELEM (exigem hífen): "an-ti-in-fla-ma-tó-rio" (i + i), "mi-cro-on-das" (o + o), "ar-qui-i-ni-mi-go" (i + i).
   • Vogais DIFERENTES SE ATRAEM (juntam-se sem hífen): "autoescola" (o + e), "infraestrutura" (a + e), "semianalfabeto" (i + a).
2. Regra da Dobra de R e S:
   • Se o prefixo termina em vogal e a segunda palavra inicia por "R" ou "S", o hífen cai e a consoante DOBRA para manter o som original: "minissaia", "ultrassom", "antirreflexo", "contrarregra".
3. Prefixos com "H":
   • Diante da letra "H", o uso do hífen é SEMPRE OBRIGATÓRIO: "super-homem", "anti-higiênico", "pré-história" (nunca facultativo!).

Análise das alternativas:
• A) CORRETA: "anti-inflamatório" (vogais iguais "i-i") e "micro-ondas" (vogais iguais "o-o") possuem hífen obrigatório.
• B) INCORRETA: Grafadas sem hífen indevidamente.
• C) INCORRETA: O correto é "autoescola" (vogais diferentes) e "semicírculo" (sem hífen antes de consoante diferente de r/s).
• D) INCORRETA: O correto é "contrarregra" (dobra o r) e em "super-homem" o hífen é OBRIGATÓRIO (não facultativo).
• E) INCORRETA: O correto é "minissaia" e "ultrassom" (consoantes dobradas sem hífen).''',
    ),
    QuestaoModel(
      id: 205,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Diferencial',
      enunciado: 'Na frase: "Eles têm compromisso com a disciplina militar", o acento circunflexo na forma verbal "têm" é de uso obrigatório para diferenciar o plural da terceira pessoa do singular ("tem").',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ANÁLISE DO ACENTO DIFERENCIAL DE NÚMERO:
O Acordo Ortográfico aboliu quase todos os acentos diferenciais (como pára/para, pêlo/pelo, pólo/polo), mas MANTEVE expressamente os seguintes:
1. Verbos TER e VIR (e seus derivados):
   • Singular (3ª pessoa): Ele TEM / Ele VEM (sem acento gráfico).
   • Plural (3ª pessoa): Eles TÊM / Eles VÊM (acento circunflexo obrigatório!).
2. Verbos Derivados (Manter, Reter, Conter, Intervir):
   • Singular: Ele manTÉM / Ele conTÉM (oxítona terminada em -em, acento agudo).
   • Plural: Eles manTÊM / Eles conTÊM (plural, acento circunflexo diferencial).
3. Verbo PODER no passado:
   • Ele PÔDE (pretérito perfeito, fechado) vs. Ele PODE (presente, aberto).
4. Verbo PÔR (verbo) vs. POR (preposição):
   • "Vou pôr a farda" (verbo com circunflexo) vs. "Caminhou por ali" (preposição sem acento).

Portanto, "eles têm" leva acento circunflexo obrigatório para sinalizar a concordância no plural com o sujeito "eles".''',
    ),
    QuestaoModel(
      id: 206,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Hiato e Acentuação',
      enunciado: 'As palavras "saúde", "juízes" e "baú" são acentuadas pela regra do hiato, na qual as vogais "i" e "u" tônicas ficam isoladas na sílaba ou seguidas de "s".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 REGRA DE OURO DO HIATO:
Acentuam-se as letras "I" e "U" quando atenderem cumulativamente aos seguintes requisitos:
1. Sejam as vogais TÔNICAS da palavra;
2. Formem HIATO com a vogal anterior (isto é, fiquem em sílabas separadas);
3. Fiquem SOZINHAS na sílaba ou acompanhadas unicamente da letra "S".
4. NÃO sejam seguidas por "NH" na sílaba seguinte (ex: ra-i-nha, ba-i-nha não têm acento).

Aplicação aos vocábulos do item:
• sa-Ú-de: "u" tônico em hiato, sozinho na sílaba -> ACENTUA.
• ju-Í-zes: "i" tônico em hiato, sozinho na sílaba -> ACENTUA (atenção: ju-iz no singular não acentua porque termina com "z").
• ba-Ú: "u" tônico em hiato, sozinho na sílaba -> ACENTUA.
Todos os vocábulos submetem-se rigorosamente à mesma regra do hiato!''',
    ),
    QuestaoModel(
      id: 207,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Ortografia Oficial',
      enunciado: 'Assinale a alternativa que contém erro de ortografia segundo a norma culta:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'O flagrante foi lavrado com extrema agilidade.',
        'B': 'O policial agiu com discernimento e bom senso.',
        'C': 'Houve hesitação na abordagem dos suspeitos armados.',
        'D': 'A paralisia do trânsito dificultou o resgate da vítima.',
        'E': 'O escrivão fez a descrição do fato com muita expontaneidade.',
      },
      gabaritoOficial: 'E',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: E (expontaneidade)

🔍 DESTRINCHANDO AS GRAFIAS:
• A) CORRETA. "Agilidade" com "g" (família de ágil, agir). "Flagrante" (ato no momento do fato; não confundir com fragrante = perfumado).
• B) CORRETA. "Discernimento" grafa-se com "sc". "Bom senso" é composto separado e senso com "s" (juízo claro; censo com "c" é o recenseamento demográfico do IBGE).
• C) CORRETA. "Hesitação" inicia-se com "h" mudo e grafa-se com "s" (do verbo hesitar).
• D) CORRETA. "Paralisia" grafa-se com "s" (assim como paralisar, paralisado, paralisante). O radical grego é com "s", nunca com "z".
• E) INCORRETA (Gabarito da questão). O vocábulo grafa-se com "S": ESPONTANEIDADE (derivado do latim spontaneus, espontâneo). A grafia com "x" ("expontaneidade") é erro ortográfico grosseiro e frequente em provas.

💡 DICA DE GRAFIA:
Substantivos e adjetivos derivados de espontâneo sempre mantêm a letra "S": espontâneo, espontaneidade, espontaneamente.''',
    ),
    QuestaoModel(
      id: 208,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica',
      enunciado: 'O vocábulo "hífen" recebe acento gráfico na forma singular por ser paroxítona terminada em "n", ao passo que sua forma plural "hifens" não deve ser acentuada.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PEGADINHA CLÁSSICA DAS BANCAS (HÍFEN VS HIFENS):
1. No Singular ("hí-fen"):
   • Classificação: PAROXÍTONA terminada na consoante "N".
   • Regra: As paroxítonas terminadas em "-n" SÃO ACENTUADAS (ex: hífen, pólen, próton, elétron, líquen).
2. No Plural ("hi-fens"):
   • Classificação: PAROXÍTONA terminada em "-ENS".
   • Regra: As paroxítonas terminadas em "-ens" NÃO RECEBEM ACENTO GRÁFICO! Observe os paralelos perfeitos: jovens, homens, imagens, nuvens, ordens. Nenhuma delas leva acento! Portanto, no plural: "hifens", "polens", "liquens" NÃO TÊM ACENTO!

💡 ATENÇÃO EXTREMA:
Se a forma plural fosse proparoxítona ("hifenes", "pólenes"), teria acento. Mas a forma plural comum "hifens" perde o acento por terminar em "-ens".''',
    ),
    QuestaoModel(
      id: 209,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica',
      enunciado: 'Os termos "pôde" (passado) e "pode" (presente) permanecem com o acento gráfico diferencial mantido expressamente pelo Novo Acordo Ortográfico.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 ACENTO DIFERENCIAL TEMPORAL:
O Acordo Ortográfico da Língua Portuguesa manteve obrigatoriamente a distinção gráfica entre as formas verbais do verbo PODER:
• "Pôde" (com acento circunflexo): 3ª pessoa do singular do PRETÉRITO PERFEITO do modo indicativo (vogal tônica fechada /ô/). Exemplo: "Ontem o agente não pôde comparecer à delegacia."
• "Pode" (sem acento): 3ª pessoa do singular do PRESENTE do indicativo (vogal tônica aberta /ó/). Exemplo: "Hoje o agente pode participar da operação."

A manutenção do acento é indispensável, pois sem ele haveria ambiguidade temporal insolúvel no contexto da frase.''',
    ),
    QuestaoModel(
      id: 210,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Emprego do Porquê',
      enunciado: 'Assinale a frase em que o uso do "porquê" está inteiramente correto:',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'Não entendi o por que de tanta confusão.',
        'B': 'Você faltou ao plantão por quê?',
        'C': 'Por que você não compareceu, por que estava cansado.',
        'D': 'Ele não foi promovido por que cometeu infração.',
        'E': 'Os motivos por que lutamos são nobres, porisso vencemos.',
      },
      gabaritoOficial: 'B',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: B

🔍 DESTRINCHANDO OS 4 TIPOS DE PORQUÊ:
1. POR QUE (separado e sem acento):
   • Interrogativo direto/indireto no início/meio de frase (= Por qual razão): "Por que você chegou atrasado?"
   • Pronome relativo (= Pelo qual, pelos quais): "Os ideais por que luto são eternos."
2. POR QUÊ (separado e com circunflexo):
   • No final de frases ou isolado antes de sinal de pontuação (ponto final, interrogação, exclamação). A proximidade da pausa atrai a tonicidade: "Você não comeu nada. Por quê?"
3. PORQUE (junto e sem acento):
   • Conjunção causal ou explicativa (= Pois, já que, visto que): "Venci porque estudei muito."
4. PORQUÊ (junto e com circunflexo):
   • Substantivo (= O motivo, a razão). Vem precedido de artigo, pronome ou numeral: "Não entendi o porquê de tanta revolta."

Análise das alternativas:
• A) INCORRETA: Vem precedido do artigo "o", logo é substantivo: "o porquê".
• B) CORRETA: Encontra-se no término da oração interrogativa, junto ao ponto: "por quê?".
• C) INCORRETA: A segunda oração expressa causa/resposta, exigindo "porque estava cansado".
• D) INCORRETA: Indica causa da não promoção: "porque cometeu infração".
• E) INCORRETA: A expressão "por isso" escreve-se sempre separada em duas palavras.''',
    ),
    QuestaoModel(
      id: 211,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Acentuação Gráfica',
      enunciado: 'As palavras "veem", "leem", "creem" e "deem" perderam o acento circunflexo com o Acordo Ortográfico.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 FIM DO ACENTO NO HIATO "EE" (MNEMÔNICO CRE-DE-LE-VE):
Antes do Acordo Ortográfico, as formas verbais da 3ª pessoa do plural dos verbos Crer, Dar, Ler e Ver (e seus derivados) recebiam acento circunflexo no primeiro "e": crêem, dêem, lêem, vêem.
• Com a vigência do Novo Acordo: O acento nos hiatos formados por vogais dobradas "EE" e "OO" foi COMPLETAMENTE EXTINTO!
• Como se grafa hoje:
  - Eles creem
  - Que eles deem
  - Eles leem
  - Eles veem
  - Eles preveem / releem / descreem
  - E também as com "OO": voo, enjoo, perdoo, abençoo (todas sem acento!).

Portanto, o item está rigorosamente certo.''',
    ),
    QuestaoModel(
      id: 212,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Ortografia Oficial',
      enunciado: 'Assinale a alternativa em que todos os vocábulos estão grafados com a letra "S":',
      tipoQuestao: 'MULTIPLA_ESCOLHA',
      alternativas: {
        'A': 'analisar, pesquisar, paralisar.',
        'B': 'sintetizar, catequizar, civilisar.',
        'C': 'canalisar, improvisar, agonisar.',
        'D': 'alisar, deslisar, amenizar.',
        'E': 'batisar, frisar, cicatriçar.',
      },
      gabaritoOficial: 'A',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: A (analisar, pesquisar, paralisar)

🔍 REGRA DE FORMAÇÃO DE VERBOS COM "-ISAR" VS "-IZAR":
1. Se a palavra primitiva já possuir "S" no radical: O verbo derivado MANTÉM a letra "S" (-isar):
   • análise -> analiSar
   • pesquisa -> pesquiSar
   • paralisia -> paraliSar
   • liso -> aliSar
   • improviso -> improviSar
   • friso -> friSar
2. Se a palavra primitiva NÃO possuir "S" no radical: O verbo é formado com o sufixo formador de verbos "-izar" (com Z):
   • síntese -> sintetiZar
   • canal -> canaliZar
   • catequese -> catequiZar
   • civil -> civiliZar
   • ameno -> ameniZar
   • agonia -> agoniZar
   • cicatriz -> cicatriZar (e com Z, nunca com cedilha!)
   • batismo -> batiZar
   • deslize -> desliZar

Análise das opções:
• A) CORRETA: Todas derivam de primitivas com "S" (análise, pesquisa, paralisia).
• B) INCORRETA: "civilizar" e "sintetizar" grafam-se com Z.
• C) INCORRETA: "canalizar" e "agonizar" grafam-se com Z.
• D) INCORRETA: "deslizar" e "amenizar" grafam-se com Z.
• E) INCORRETA: "batizar" e "cicatrizar" grafam-se com Z.''',
    ),
    QuestaoModel(
      id: 213,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Hífen com Prefixos',
      enunciado: 'Com os prefixos "ex-", "sem-", "vice-" e "pós-", o uso do hífen é sempre obrigatório na língua culta.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 CASOS DE HÍFEN SEMPRE OBRIGATÓRIO COM PREFIXOS ESPECÍFICOS:
De acordo com o Acordo Ortográfico, os seguintes prefixos e elementos pré-positivos EXIGEM SEMPRE HÍFEN, independentemente de a palavra seguinte começar por vogal ou consoante:
1. "EX-" (com sentido de anterioridade/cessação): ex-governador, ex-diretor, ex-policial.
2. "SEM-" (com sentido de privação): sem-teto, sem-vergonha, sem-número.
3. "VICE-" e "VOTO-": vice-presidente, vice-governador, vice-prefeito.
4. "ALÉM-", "AQUÉM-", "RECÉM-": além-mar, aquém-fronteiras, recém-nascido, recém-empossado.
5. Prefixos tônicos acentuados "PÓS-", "PRÉ-" e "PRÓ-": pós-graduação, pré-militar, pró-reitoria. (Atenção: se forem átonos e aglutinados, não têm acento nem hífen: pospor, predeterminar, propor).

Como o item listou ex-, sem-, vice- e pós-, o uso do hífen é invariavelmente obrigatório.''',
    ),
    QuestaoModel(
      id: 214,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Monossílabos Tônicos',
      enunciado: 'Os monossílabos tônicos terminados em A(s), E(s) e O(s) recebem acento gráfico, como em "pá", "fé" e "dó".',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 REGRA PURA DOS MONOSSÍLABOS TÔNICOS:
Palavras monossílabas (compostas por uma única sílaba fonética) classificam-se em átonas (sem força própria, como artigos "o", "a", preposições "de", "em") e tônicas (com autonomia fonética e semântica).
• Regra de Acentuação dos Monossílabos Tônicos:
  - Acentuam-se os monossílabos tônicos terminados em:
    • "-A(s)": pá, pás, lá, chá.
    • "-E(s)": pé, pés, fé, mês, três.
    • "-O(s)": pó, pós, dó, só, nós.
  - Também se acentuam os monossílabos terminados em ditongos abertos: céu, réu, dói.
  - NÃO se acentuam os monossílabos tônicos terminados em "-I" ou "-U" (ex: ti, vi, tu, cru, nus).

Portanto, o enunciado expressa com exatidão a regra oficial da gramática normativa.''',
    ),
    QuestaoModel(
      id: 215,
      banca: 'Instituto AOCP',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Ortografia e Semântica',
      enunciado: 'Na frase: "O policial agiu com discrição durante a campana", o termo em destaque significa recato, prudência e reserva na conduta.',
      tipoQuestao: 'CERTO_ERRADO',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: '''🎯 CRAVOU NO GABARITO OFICIAL: CERTO

🔍 PARÔNIMOS EM PROVAS POLICIAIS (DISCRIÇÃO VS DESCRIÇÃO):
Parônimos são vocábulos com grafia e pronúncia parecidas, mas com significados completamente distintos:
1. DISCRIÇÃO (com "I"):
   • Qualidade de quem é discreto; atitude reservada, prudente, comedida, que não chama a atenção nem divulga segredos de uma investigação policial.
   • Exemplo na frase: O policial militar agiu com silêncio e discrição para não alertar os criminosos.
2. DESCRIÇÃO (com "E"):
   • Ato ou efeito de descrever, caracterizar detalhadamente traços físicos ou psicológicos de uma pessoa, objeto ou cena de crime.
   • Exemplo: O perito fez uma descrição minuciosa do local de homicídio.

O item contextualizou com total propriedade o vocábulo "discrição" (prudência e reserva).''',
    ),
  ],
);

