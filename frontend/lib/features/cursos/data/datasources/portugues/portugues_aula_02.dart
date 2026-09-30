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
      comentarioDidatico: 'CRAVOU NA B! Os vocábulos "tático" e "específico" são proparoxítonos. A alternativa B traz estritamente palavras proparoxítonas: "re-lâm-pa-go", "es-crú-pu-lo", "in-qué-ri-to", todas obrigatoriamente acentuadas.',
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
      comentarioDidatico: 'CRAVOU NA B! Com o Novo Acordo, os ditongos abertos "ei" e "oi" em palavras PAROXÍTONAS perderam o acento gráfico. Logo, escreve-se "ideia", "geleia", "heroico" sem acento. "Herói" e "papéis" continuam acentuados por serem oxítonas.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! "Po-lí-cia" possui a penúltima sílaba tônica terminando em ditongo crescente (-ia), justificando seu acento pelas regras das paroxítonas (doutrina tradicional e AOCP).',
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
      comentarioDidatico: 'CRAVOU NA A! Regra dos iguais: vogais iguais se repelem pelo hífen ("anti-inflamatório", "micro-ondas"). Vogais diferentes se juntam sem hífen ("autoescola"). Consoantes R e S após vogal dobram-se ("minissaia", "ultrassom").',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Trata-se do acento diferencial de número: "ele tem" (singular, sem acento) vs "eles têm" (plural, com acento circunflexo). O mesmo ocorre com "vem" / "vêm".',
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
      comentarioDidatico: 'CRAVOU NO CERTO! É a clássica regra do hiato: sa-ú-de, ju-í-zes, ba-ú. Todas têm "i" ou "u" tônicos formando sílaba sozinhos.',
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
      comentarioDidatico: 'CRAVOU NA E! O vocábulo correto é "espontaneidade" (com "s", derivado de espontâneo), e nunca "expontaneidade".',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Paroxítonas terminadas em -ens não levam acento (ex: hifens, polens, jovens, nuvens). Já no singular terminado em -n levam acento (hífen, pólen). Pegadinha clássica!',
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
      comentarioDidatico: 'CRAVOU NO CERTO! O acento diferencial de tempo em "pôde" (pretérito perfeito do indicativo) foi mantido para evitar ambiguidade com "pode" (presente do indicativo).',
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
      comentarioDidatico: 'CRAVOU NA B! "Por quê" separado e com acento circunflexo é empregado no final de frases interrogativas ou antes de pontuação terminal. Na A deveria ser "o porquê" (substantivado). Na C segunda ocorrência deveria ser "porque" explicativo. Na E "por isso" é grafado separado.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! As terceiras pessoas do plural com hiato duplicado "ee" do mnemônico CRE-DE-LE-VE deixaram de ter acento gráfico.',
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
      comentarioDidatico: 'CRAVOU NA A! "Analisar" (análise), "pesquisar" (pesquisa) e "paralisar" (paralisia) mantêm o radical com "S". "Civilizar", "deslizar", "amenizar" e "batizar" grafam-se com Z.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Prefixos como ex-, sem-, além-, aquém-, vice-, pós-, pré- e pró- exigem hífen de forma constante diante de qualquer vocábulo (ex: ex-governador, vice-presidente, pós-graduação).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Regra pura dos monossílabos tônicos: acentuam-se os terminados em A, E, O seguidos ou não de S.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Discrição = ser discreto, comedido, prudente. Não confundir com descrição = ato de descrever detalhadamente.',
    ),
  ],
);

