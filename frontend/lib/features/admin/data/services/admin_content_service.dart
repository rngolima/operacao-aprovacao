import 'package:flutter/foundation.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../questoes/data/datasources/questoes_remote_data_source.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../models/admin_models.dart';

/// Estrutura para material didático de aula customizado pelo Administrador
class AulaCustomizada {
  final String id;
  final String disciplina;
  final String titulo;
  final String tempoLeitura;
  final String conteudoTeorico;
  final bool destaque;
  final String dataCadastro;
  final Uint8List? pdfBytes;
  final String? nomeArquivo;

  const AulaCustomizada({
    required this.id,
    required this.disciplina,
    required this.titulo,
    required this.tempoLeitura,
    required this.conteudoTeorico,
    this.destaque = false,
    required this.dataCadastro,
    this.pdfBytes,
    this.nomeArquivo,
  });
}

/// Serviço Central de Gerenciamento e Publicação de Conteúdo do Administrador (QG CRAVOU).
/// Gerencia em tempo real o banco de editais carregados em PDF, materiais didáticos,
/// apostilas teóricas e novas questões oficiais/inéditas prontas para produção.
class AdminContentService extends ChangeNotifier {
  AdminContentService._();
  static final AdminContentService instance = AdminContentService._();

  // --------------------------------------------------------------------------
  // LISTA DE EDITAIS PUBLICADOS
  // --------------------------------------------------------------------------
  final List<EditalAdminModel> _editais = [
    const EditalAdminModel(
      id: 'edital-pmpe-2024',
      concurso: 'PM-PE (Polícia Militar de Pernambuco)',
      cargo: 'Soldado da Polícia Militar',
      banca: 'Instituto AOCP',
      vagas: '1.250 Vagas',
      remuneracao: 'R\$ 5.617,92',
      dataPublicacao: '2024 / Vigente 2026',
      dataProva: '21/02/2027',
      nomeArquivo: 'Edital_Oficial_PMPE_AOCP_2026_Completo.pdf',
      tamanhoArquivo: '3.8 MB',
      status: 'PUBLICADO',
      questoesProva: 60,
      disciplinas: [
        'Língua Portuguesa (10 questões)',
        'História de Pernambuco (10 questões)',
        'Raciocínio Lógico Matemático (10 questões)',
        'Noções de Informática (10 questões)',
        'Direito Constitucional (10 questões)',
        'Direitos Humanos e Legislação Extravagante (10 questões)',
      ],
    ),
    const EditalAdminModel(
      id: 'edital-pcpe-2024',
      concurso: 'PC-PE (Polícia Civil de Pernambuco)',
      cargo: 'Agente de Polícia Civil',
      banca: 'Cebraspe',
      vagas: '250 Vagas',
      remuneracao: 'R\$ 6.800,00',
      dataPublicacao: '2024 / Vigente',
      dataProva: '25/02/2024',
      nomeArquivo: 'Edital_PCPE_Agente_Cebraspe.pdf',
      tamanhoArquivo: '4.2 MB',
      status: 'PUBLICADO',
      questoesProva: 60,
      disciplinas: [
        'Língua Portuguesa',
        'Noções de Direito Constitucional',
        'Noções de Direito Administrativo',
        'Noções de Direito Penal',
        'Noções de Direito Processual Penal',
        'Legislação Especial',
        'Noções de Informática',
      ],
    ),
  ];

  // --------------------------------------------------------------------------
  // LISTA DE MATERIAIS DIDÁTICOS E AULAS
  // --------------------------------------------------------------------------
  final List<MaterialDidaticoModel> _materiais = [
    const MaterialDidaticoModel(
      id: 'mat-01',
      disciplina: 'Língua Portuguesa',
      titulo: 'Síntese Tática: Crase & Regência Sem Mistério (Padrão AOCP/Cebraspe)',
      tipo: 'AULA_RESUMO',
      dataUpload: 'Ontem às 18:30',
      autor: 'Prof. Rudson Lima (CRAVOU)',
      visualizacoes: 482,
    ),
    const MaterialDidaticoModel(
      id: 'mat-02',
      disciplina: 'História de Pernambuco',
      titulo: 'Invasões Holandesas & Governo Maurício de Nassau Esquematizado',
      tipo: 'AULA_RESUMO',
      dataUpload: 'Hoje às 09:15',
      autor: 'Prof. Rudson Lima (CRAVOU)',
      visualizacoes: 320,
    ),
    const MaterialDidaticoModel(
      id: 'mat-03',
      disciplina: 'Direito Constitucional',
      titulo: 'Vade Mecum Constitucional Art. 5º ao 17 Esquematizado (PDF)',
      tipo: 'LEGISLACAO',
      dataUpload: 'Hoje às 11:00',
      autor: 'Equipe Tática CRAVOU',
      visualizacoes: 195,
    ),
  ];

  // Aulas detalhadas adicionadas pelo Admin
  final List<AulaCustomizada> _aulasCustomizadas = [];

  // Questões cadastradas pelo Admin
  final List<QuestaoModel> _questoesCustomizadas = [];

  // Getters
  List<EditalAdminModel> get editais => List.unmodifiable(_editais);
  List<MaterialDidaticoModel> get materiais => List.unmodifiable(_materiais);
  List<AulaCustomizada> get aulasCustomizadas => List.unmodifiable(_aulasCustomizadas);
  List<QuestaoModel> get questoesCustomizadas => List.unmodifiable(_questoesCustomizadas);

  int get totalEditais => _editais.length;
  int get totalMateriais => _materiais.length;
  int get totalQuestoes => 80 + _questoesCustomizadas.length;

  /// Publica um novo Edital Oficial extraído de PDF
  void publicarEdital({
    required String concurso,
    required String cargo,
    required String banca,
    required String vagas,
    required String remuneracao,
    required String dataProva,
    required String nomeArquivo,
    required String tamanhoArquivo,
    required int questoesProva,
    required List<String> disciplinas,
    int horasPorDia = 3,
    int semanasAteProva = 21,
  }) {
    final novoEdital = EditalAdminModel(
      id: 'edital-${DateTime.now().millisecondsSinceEpoch}',
      concurso: concurso,
      cargo: cargo,
      banca: banca,
      vagas: vagas,
      remuneracao: remuneracao,
      dataPublicacao: 'Publicado Agora',
      dataProva: dataProva,
      nomeArquivo: nomeArquivo,
      tamanhoArquivo: tamanhoArquivo,
      status: 'PUBLICADO',
      questoesProva: questoesProva,
      disciplinas: disciplinas,
    );

    // Substitui se já houver um com mesmo concurso ou adiciona ao topo
    _editais.removeWhere((e) => e.concurso.toLowerCase().trim() == concurso.toLowerCase().trim());
    _editais.insert(0, novoEdital);

    // Sincroniza imediatamente com o estado do candidato (PlanoEstudoState)
    PlanoEstudoState.instance.atualizarPlano(
      concursoAlvo: concurso,
      cargoAlvo: cargo,
      banca: banca,
      nomeArquivo: nomeArquivo,
      tamanhoArquivo: tamanhoArquivo,
      horasPorDia: horasPorDia,
      semanasAteProva: semanasAteProva,
      disciplinas: disciplinas,
    );

    notifyListeners();
  }

  /// Cadastra uma nova Aula Teórica / Resumo Didático
  void cadastrarAulaDidatica({
    required String disciplina,
    required String titulo,
    required String tempoLeitura,
    required String conteudoTeorico,
    bool destaque = false,
  }) {
    final id = 'aula-${DateTime.now().millisecondsSinceEpoch}';
    final aula = AulaCustomizada(
      id: id,
      disciplina: disciplina,
      titulo: titulo,
      tempoLeitura: tempoLeitura,
      conteudoTeorico: conteudoTeorico,
      destaque: destaque,
      dataCadastro: 'Cadastrado agora',
    );
    _aulasCustomizadas.add(aula);

    final mat = MaterialDidaticoModel(
      id: id,
      disciplina: disciplina,
      titulo: titulo,
      tipo: 'AULA_RESUMO',
      dataUpload: 'Agora mesmo',
      autor: 'Prof. Rudson Lima (Admin CRAVOU)',
      visualizacoes: 1,
    );
    _materiais.insert(0, mat);

    notifyListeners();
  }

  /// Cadastra um material em PDF (Vade Mecum / Legislação Esquematizada)
  void cadastrarMaterialPdf({
    required String disciplina,
    required String titulo,
    required String nomeArquivo,
    required String tamanhoArquivo,
    Uint8List? pdfBytes,
  }) {
    final id = 'pdf-${DateTime.now().millisecondsSinceEpoch}';
    final aula = AulaCustomizada(
      id: id,
      disciplina: disciplina,
      titulo: titulo,
      tempoLeitura: 'Leitura em PDF • $tamanhoArquivo',
      conteudoTeorico: 'Documento Oficial de Apoio em formato PDF: $nomeArquivo ($tamanhoArquivo). Disponível para download e consulta off-line imediata.',
      destaque: true,
      dataCadastro: 'Upload agora',
      pdfBytes: pdfBytes,
      nomeArquivo: nomeArquivo,
    );
    _aulasCustomizadas.add(aula);

    final mat = MaterialDidaticoModel(
      id: id,
      disciplina: disciplina,
      titulo: '$titulo ($nomeArquivo)',
      tipo: 'LEGISLACAO',
      dataUpload: 'Agora mesmo',
      autor: 'Admin CRAVOU',
      visualizacoes: 1,
    );
    _materiais.insert(0, mat);

    notifyListeners();
  }

  /// Cadastra uma nova Questão Oficial ou Inédita e disponibiliza imediatamente
  /// para resolução no catálogo, guia e treinos.
  void cadastrarQuestao(QuestaoModel questao) {
    _questoesCustomizadas.add(questao);
    QuestoesRemoteDataSource.adicionarQuestaoCustomizada(questao);

    final mat = MaterialDidaticoModel(
      id: 'q-${questao.id}',
      disciplina: questao.disciplina,
      titulo: 'Questão Q${questao.id}: ${questao.assunto} (${questao.banca})',
      tipo: 'BANCO_QUESTOES',
      dataUpload: 'Agora mesmo',
      autor: 'Banca ${questao.banca} / Cravou',
      visualizacoes: 1,
    );
    _materiais.insert(0, mat);

    notifyListeners();
  }

  /// Retorna as aulas customizadas cadastradas para uma disciplina
  List<AulaCustomizada> obterAulasPorDisciplina(String disciplina) {
    final discClean = disciplina.toLowerCase().trim();
    return _aulasCustomizadas.where((a) {
      final aClean = a.disciplina.toLowerCase().trim();
      return discClean.contains(aClean) || aClean.contains(discClean);
    }).toList();
  }
}
