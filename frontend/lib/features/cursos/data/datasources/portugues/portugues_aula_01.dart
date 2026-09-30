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
      comentarioDidatico: 'CRAVOU NA B! O texto relata ações encadeadas no tempo ("avançou", "sentia", "avistou"), com personagem (o soldado), espaço (viela) e tempo, configurando nitidamente a tipologia narrativa (PENTE).',
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
      comentarioDidatico: 'CRAVOU NA C! Textos injuntivos ou prescritivos trazem instruções de conduta, comandos e orientações com verbos no imperativo ("Mantenha", "Verifique").',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Perfeita distinção doutrinária: a compreensão é explícita (está na superfície do texto), enquanto a interpretação exige inferência lógica autorizada pelas pistas deixadas pelo autor.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A argumentação tem compromisso com a persuasão e a tese; a exposição apenas transmite conteúdo ou fatos de forma neutra.',
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
      comentarioDidatico: 'CRAVOU NO ERRO! Erro clássico de extrapolação. O candidato deve julgar exclusivamente com base nas ideias e limites do texto apresentado pela banca examinadora, nunca sobrepondo opiniões pessoais.',
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
      comentarioDidatico: 'CRAVOU NA B! A descrição é a "fotografia" em palavras: retrata um momento estático mediante abundante adjetivação e caracterização sensorial.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A anáfora retoma elemento anterior ("O cabo chegou. Ele assumiu o posto") e a catáfora antecipa elemento posterior ("Só desejo isto: a sua aprovação"). Ambas mantêm a coesão referencial.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Inferência textual é a dedução legítima de uma ideia não dita de forma explícita, mas necessariamente decorrente do raciocínio lógico do texto.',
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
      comentarioDidatico: 'CRAVOU NA C! Regulamentos, normas, leis e instruções de serviço têm finalidade prescritiva e reguladora de conduta, caracterizando a injunção.',
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
      comentarioDidatico: 'CRAVOU NA C! Extrapolação ocorre quando a alternativa acrescenta informações, especulações ou desdobramentos que o texto não autoriza.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A narrativa é caracterizada pela sucessão temporal dos acontecimentos (início, meio e fim de uma conduta).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Todas essas locuções e conectivos expressam relação lógico-semântica de causa ou explicação fundamental na tessitura textual.',
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
      comentarioDidatico: 'CRAVOU NA B! O "tipo textual" é a estrutura composicional (dissertativo-argumentativo, narrativo, descritivo, etc.), e o "gênero textual" é a manifestação sociocultural concreta no cotidiano (editorial, notícia, romance, bula, portaria).',
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
      comentarioDidatico: 'CRAVOU NO CERTO! Marcas linguísticas como "voltar a", "novamente", "deixar de" acionam pressupostos textuais inquestionáveis decorrentes da semântica verbal.',
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
      comentarioDidatico: 'CRAVOU NO CERTO! A não contradição e a pertinência argumentativa são pilares da coerência textual.',
    ),
  ],
);

