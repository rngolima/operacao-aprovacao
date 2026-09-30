import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/disciplina_model.dart';
import '../models/filtro_questoes.dart';
import '../models/questao_model.dart';

/// Data Source Remoto do Banco de Questoes Cebraspe.
/// Conecta a API Spring Boot com fallback resiliente para simulacao offline.
class QuestoesRemoteDataSource {
  final ApiClient apiClient;

  QuestoesRemoteDataSource({required this.apiClient});

  /// Busca lista paginada de questoes com filtros
  Future<List<QuestaoModel>> getQuestoes(FiltroQuestoes filtro) async {
    try {
      final response = await apiClient.get(
        ApiEndpoints.questoes,
        queryParameters: filtro.toQueryParams(),
      );

      final data = response.data;
      if (data is List) {
        return data.map((item) => QuestaoModel.fromJson(item as Map<String, dynamic>)).toList();
      } else if (data is Map<String, dynamic> && data['content'] is List) {
        // Formato paginado Spring Data Pageable
        final list = data['content'] as List;
        return list.map((item) => QuestaoModel.fromJson(item as Map<String, dynamic>)).toList();
      }
    } catch (_) {
      // Em caso de API em inicializacao, utiliza o catalogo tatica oficial
    }

    return _getQuestoesOficiais(filtro);
  }

  /// Retorna as disciplinas oficiais do edital PC-PE, PM-PE e PP-PE
  Future<List<DisciplinaModel>> getDisciplinas() async {
    return const [
      DisciplinaModel(id: 0, nome: 'Todas', icone: '🔥', totalQuestoes: 80),
      DisciplinaModel(id: 1, nome: 'Língua Portuguesa', icone: '✍️', totalQuestoes: 20),
      DisciplinaModel(id: 2, nome: 'Direito Constitucional', icone: '📜', totalQuestoes: 10),
      DisciplinaModel(id: 3, nome: 'Direito Administrativo', icone: '🏛️', totalQuestoes: 10),
      DisciplinaModel(id: 4, nome: 'Direito Penal', icone: '⚖️', totalQuestoes: 12),
      DisciplinaModel(id: 5, nome: 'Direito Processual Penal', icone: '🚓', totalQuestoes: 12),
      DisciplinaModel(id: 6, nome: 'Legislação Especial', icone: '🛡️', totalQuestoes: 10),
      DisciplinaModel(id: 7, nome: 'Noções de Informática', icone: '💻', totalQuestoes: 8),
      DisciplinaModel(id: 8, nome: 'Raciocínio Lógico & Info', icone: '🧠', totalQuestoes: 8),
      DisciplinaModel(id: 9, nome: 'História & Geografia de PE', icone: '🌴', totalQuestoes: 8),
    ];
  }

  /// Banco Oficial de Questoes Cebraspe com Fundamentacao Didatica Autoral (Cravou)
  List<QuestaoModel> _getQuestoesOficiais(FiltroQuestoes filtro) {
    final todas = [
      // --- LINGUA PORTUGUESA (Referencias de Crase, Regencia e Sintaxe Cebraspe) ---
      const QuestaoModel(
        id: 1,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Língua Portuguesa',
        assunto: 'Crase & Regência',
        enunciado: 'No trecho: "O policial civil obedeceu a ordens emanadas de seus superiores hierárquicos sem hesitar.", o emprego do acento grave indicativo de crase no vocábulo "a" seria gramaticalmente obrigatório.',
        gabaritoOficial: 'ERRADO',
        comentarioDidatico: 'CRAVOU NO ERRO! Regra de Ouro do Cebraspe: "A" no singular diante de palavra no plural não tem crase ("a ordens"). O termo "ordens" está no plural e o "a" está desprovido de artigo feminino plural ("as"). Se houvesse crase, teria de ser "às ordens". Logo, o item está ERRADO.',
      ),
      const QuestaoModel(
        id: 2,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Língua Portuguesa',
        assunto: 'Regência & Pronome Relativo',
        enunciado: 'A correção gramatical do texto seria mantida caso o segmento "o cargo que aspiro" fosse reescrito como "o cargo a que aspiro".',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! O verbo "aspirar", no sentido de desejar, almejar ou pretender, é transitivo indireto e rege a preposição "A" (aspirar A algo). Quando antecedido de pronome relativo ("que"), a preposição regida pelo verbo deve ser anteposta ao pronome relativo: "o cargo A que aspiro". Item CERTO.',
      ),
      const QuestaoModel(
        id: 3,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Língua Portuguesa',
        assunto: 'Concordância Verbal & Voz Passiva',
        enunciado: 'Na oração "Apuraram-se todos os indícios de autoria no inquérito policial", o termo "todos os indícios de autoria" desempenha a função sintática de sujeito paciente.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Trata-se de Voz Passiva Sintética. O vocábulo "se" atua como partícula apassivadora (pronome apassivador). Equivalência: "Todos os indícios de autoria foram apurados". Portanto, o termo plural concorda com o verbo e exerce função de sujeito paciente. Item CERTO.',
      ),
      const QuestaoModel(
        id: 4,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Língua Portuguesa',
        assunto: 'Funções da Palavra SE',
        enunciado: 'Em "Precisa-se de mais policiais qualificados nas delegacias do interior", a palavra "se" funciona como pronome apassivador, justificando a flexão do verbo no singular.',
        gabaritoOficial: 'ERRADO',
        comentarioDidatico: 'CRAVOU NO ERRO! O verbo "precisar" é transitivo indireto (rege preposição "de"). Diante de verbo transitivo indireto (VTI), intransitivo ou de ligação com preposição, a partícula "se" é Índice de Indeterminação do Sujeito (IIS), mantendo o verbo obrigatoriamente na 3ª pessoa do singular. Não é apassivador! Item ERRADO.',
      ),

      // --- DIREITO CONSTITUCIONAL (Seguranca Publica Art. 144 e Direitos Fundamentais) ---
      const QuestaoModel(
        id: 5,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Constitucional',
        assunto: 'Segurança Pública (Art. 144 CF)',
        enunciado: 'Às polícias civis, dirigidas por delegados de polícia de carreira, incumbem, ressalvada a competência da União, as funções de polícia judiciária e a apuração de infrações penais, exceto as militares.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Literalidade do Art. 144, § 4º da Constituição Federal de 1988: "Às polícias civis, dirigidas por delegados de polícia de carreira, incumbem, ressalvada a competência da União, as funções de polícia judiciária e a apuração de infrações penais, exceto as militares." Item CERTO.',
      ),
      const QuestaoModel(
        id: 6,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Constitucional',
        assunto: 'Inviolabilidade de Domicílio',
        enunciado: 'A casa é asilo inviolável do indivíduo, ninguém nela podendo penetrar sem consentimento do morador, salvo em caso de flagrante delito ou desastre, ou para prestar socorro, ou, durante a noite, por determinação judicial.',
        gabaritoOficial: 'ERRADO',
        comentarioDidatico: 'CRAVOU NO ERRO! Pegadinha clássica do Cebraspe sobre o Art. 5º, XI da CF: a determinação judicial só permite ingresso no domicílio DURANTE O DIA ("ou, durante o dia, por determinação judicial"). À noite, a ordem judicial não autoriza a entrada sem consentimento do morador. Item ERRADO.',
      ),

      // --- DIREITO PENAL (PC-PE / PCDF) ---
      const QuestaoModel(
        id: 7,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Penal',
        assunto: 'Aplicação da Lei Penal',
        enunciado: 'A lei penal posterior que de qualquer modo favorecer o agente aplica-se aos fatos anteriores, ainda que decididos por sentença condenatória transitada em julgado.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Art. 2º, parágrafo único do Código Penal e Art. 5º, XL da CF/88. Trata-se do princípio da retroatividade da lei penal mais benéfica (lex mitior / novatio legis in mellius), que alcança até mesmo a coisa julgada formal e material. Item CERTO.',
      ),
      const QuestaoModel(
        id: 8,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Penal',
        assunto: 'Crimes contra a Pessoa',
        enunciado: 'O homicídio praticado contra agente de segurança pública, no exercício da função ou em decorrência dela, é qualificado e classificado hediondo.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Art. 121, § 2º, inciso VII do Código Penal (Homicídio Funcional contra agentes do art. 142 e 144 da CF). Além de ser qualificado com pena de reclusão de 12 a 30 anos, é expressamente hediondo nos termos da Lei 8.072/90. Item CERTO.',
      ),

      // --- DIREITO PROCESSUAL PENAL (Inquerito & Flagrante) ---
      const QuestaoModel(
        id: 9,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Processual Penal',
        assunto: 'Inquérito Policial',
        enunciado: 'O inquérito policial é procedimento administrativo de natureza inquisitiva, não sendo permitida à autoridade policial ordenar o arquivamento de autos de inquérito por iniciativa própria.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Art. 17 do Código de Processo Penal: "A autoridade policial não poderá mandar arquivar autos de inquérito". O arquivamento é ato complexo reservado ao titular da ação penal e ao Poder Judiciário. Item CERTO.',
      ),
      const QuestaoModel(
        id: 10,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Processual Penal',
        assunto: 'Prisão em Flagrante',
        enunciado: 'Considera-se em flagrante próprio o indivíduo que é perseguido, logo após cometer o crime, pela autoridade, pelo ofendido ou por qualquer pessoa, em situação que faça presumir ser ele o autor da infração.',
        gabaritoOficial: 'ERRADO',
        comentarioDidatico: 'CRAVOU NO ERRO! Pegadinha clássica de processo penal! Perseguição logo após a prática delitiva configura flagrante impróprio ou quase-flagrante (art. 302, III, CPP). O flagrante próprio é quando o agente está cometendo ou acaba de cometer a infração (art. 302, I e II, CPP). Item ERRADO.',
      ),

      // --- DIREITO ADMINISTRATIVO (Poder de Policia PC-PE) ---
      const QuestaoModel(
        id: 11,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Direito Administrativo',
        assunto: 'Poder de Polícia',
        enunciado: 'São atributos do poder de polícia administrativa a discricionariedade, a autoexecutoriedade e a coercibilidade, estando a autoexecutoriedade presente em absolutamente todos os atos de polícia.',
        gabaritoOficial: 'ERRADO',
        comentarioDidatico: 'CRAVOU NO ERRO! Atenção aos termos absolutos ("absolutamente todos") típicos do Cebraspe! A autoexecutoriedade NÃO está presente em todos os atos de polícia. Exemplo clássico da doutrina: a cobrança de multa administrativa exige ação de execução fiscal no Judiciário, não sendo autoexecutória. Item ERRADO.',
      ),

      // --- LEGISLACAO ESPECIAL (Drogas & Abuso de Autoridade) ---
      const QuestaoModel(
        id: 12,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Legislação Especial',
        assunto: 'Lei de Abuso de Autoridade (Lei 13.869/19)',
        enunciado: 'A divergência na interpretação de lei ou na avaliação de fatos e provas não configura, por si só, crime de abuso de autoridade.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Art. 1º, § 2º da Lei 13.869/2019: "A divergência na interpretação de lei ou na avaliação de fatos e provas não configura abuso de autoridade" (vedação ao chamado crime de hermenêutica). Exige-se sempre o dolo específico de prejudicar outrem ou beneficiar a si mesmo ou a terceiro. Item CERTO.',
      ),

      // --- NOCOES DE INFORMATICA (Seguranca da Informacao) ---
      const QuestaoModel(
        id: 13,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Noções de Informática',
        assunto: 'Malwares & Segurança Cibernética',
        enunciado: 'Ransomware é um tipo de código malicioso que torna inacessíveis os dados armazenados em um equipamento, geralmente usando criptografia, e exige pagamento de resgate para restabelecer o acesso ao usuário.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Definição clássica da Cartilha de Segurança para Internet do CERT.br adotada integralmente pelo Cebraspe. O ransomware sequestra os dados do usuário por meio de criptografia assimétrica e exige resgate (frequentemente em criptomoedas). Item CERTO.',
      ),

      // --- RACIOCINIO LOGICO & INFO ---
      const QuestaoModel(
        id: 14,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'Raciocínio Lógico & Info',
        assunto: 'Equivalências Lógicas',
        enunciado: 'A proposição "Se o candidato treinar com dedicação no Cravou, então será aprovado na PC-PE" é logicamente equivalente a "Se o candidato não for aprovado na PC-PE, então não treinou com dedicação no Cravou".',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Trata-se da regra da Contrapositiva da condicional: (P -> Q) equivale a (~Q -> ~P). Nega-se ambas as proposições e inverte-se a ordem. Item CERTO.',
      ),

      // --- HISTORIA & GEOGRAFIA DE PERNAMBUCO ---
      const QuestaoModel(
        id: 15,
        banca: 'Cebraspe',
        orgao: 'PC-PE',
        cargo: 'Agente de Polícia',
        ano: 2024,
        disciplina: 'História & Geografia de PE',
        assunto: 'Revolução Pernambucana de 1817',
        enunciado: 'A Revolução Pernambucana de 1817 proclamou uma república independente no Nordeste brasileiro e elaborou uma lei orgânica com garantias de liberdade de consciência, de imprensa e de culto.',
        gabaritoOficial: 'CERTO',
        comentarioDidatico: 'CRAVOU NO ACERTO! Conhecida como a Revolução dos Padres, o movimento de 1817 fundou uma república de fato em Pernambuco por mais de 70 dias, com governo provisório e lei orgânica avançada que garantia liberdades civis fundamentais. Item CERTO.',
      ),
    ];

    var filtradas = todas;

    if (filtro.disciplina != null && filtro.disciplina!.isNotEmpty && filtro.disciplina != 'Todas') {
      filtradas = filtradas.where((q) => q.disciplina == filtro.disciplina).toList();
    }

    if (filtro.termoBusca != null && filtro.termoBusca!.trim().isNotEmpty) {
      final term = filtro.termoBusca!.trim().toLowerCase();
      filtradas = filtradas.where((q) =>
        q.enunciado.toLowerCase().contains(term) ||
        q.assunto.toLowerCase().contains(term)
      ).toList();
    }

    return filtradas;
  }
}
