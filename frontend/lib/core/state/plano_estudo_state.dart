import 'package:flutter/foundation.dart';

class MetaDiaEstudo {
  final String diaSemana;
  final String disciplina1;
  final String topico1;
  final String disciplina2;
  final String topico2;
  final int metaQuestoes;
  final bool isSimulado;

  const MetaDiaEstudo({
    required this.diaSemana,
    required this.disciplina1,
    required this.topico1,
    required this.disciplina2,
    required this.topico2,
    required this.metaQuestoes,
    this.isSimulado = false,
  });
}

/// Estado Global de Planejamento Tático de Estudos do Aluno CRAVOU.
/// Controla o concurso alvo único ativo, o edital processado e a trilha de hoje.
class PlanoEstudoState extends ChangeNotifier {
  static final PlanoEstudoState instance = PlanoEstudoState._internal();
  PlanoEstudoState._internal() {
    _inicializarPadrao();
  }

  // Dados do Concurso Alvo Ativo (Edital Oficial PM-PE 2026/2027 - Instituto AOCP)
  String _concursoAlvo = 'PM-PE (Polícia Militar de Pernambuco)';
  String _cargoAlvo = 'Soldado da Polícia Militar';
  String _banca = 'Instituto AOCP';
  String _vagas = '1.250 Vagas';
  String _remuneracao = 'R\$ 5.617,92';
  String _numeroInscricao = '2026-PMPE-08942';
  String _dataProva = '21 de Fevereiro de 2027';
  int _diasAteProva = 144;
  int _semanasAteProva = 21;
  String? _nomeArquivoEdital;
  String? _tamanhoArquivoEdital;
  int _horasPorDia = 3;
  bool _temCronogramaAtivo = true;
  List<String> _disciplinas = [];
  List<MetaDiaEstudo> _trilhaSemanal = [];

  // Getters
  String get concursoAlvo => _concursoAlvo;
  String get cargoAlvo => _cargoAlvo;
  String get banca => _banca;
  String get vagas => _vagas;
  String get remuneracao => _remuneracao;
  String get numeroInscricao => _numeroInscricao;
  String get dataProva => _dataProva;
  int get diasAteProva => _diasAteProva;
  int get semanasAteProva => _semanasAteProva;
  String? get nomeArquivoEdital => _nomeArquivoEdital;
  String? get tamanhoArquivoEdital => _tamanhoArquivoEdital;
  int get horasPorDia => _horasPorDia;
  bool get temCronogramaAtivo => _temCronogramaAtivo;
  List<String> get disciplinas => List.unmodifiable(_disciplinas);
  List<MetaDiaEstudo> get trilhaSemanal => List.unmodifiable(_trilhaSemanal);

  void _inicializarPadrao() {
    _concursoAlvo = 'PM-PE (Polícia Militar de Pernambuco)';
    _cargoAlvo = 'Soldado da Polícia Militar';
    _banca = 'Instituto AOCP';
    _vagas = '1.250 Vagas';
    _remuneracao = 'R\$ 5.617,92';
    _numeroInscricao = '2026-PMPE-08942';
    _dataProva = '21 de Fevereiro de 2027';
    _diasAteProva = 144;
    _semanasAteProva = 21;
    _nomeArquivoEdital = 'Edital_Oficial_PMPE_AOCP_2026.pdf';
    _tamanhoArquivoEdital = '2.4 MB';
    _disciplinas = [
      'Língua Portuguesa (10 questões)',
      'História de Pernambuco (10 questões)',
      'Raciocínio Lógico Matemático (10 questões)',
      'Noções de Informática (10 questões)',
      'Direito Constitucional (10 questões)',
      'Direitos Humanos e Legislação Extravagante (10 questões)',
      'Prova Discursiva (Redação - 40 pontos)',
    ];
    _gerarTrilhaPadrao();
  }

  void _gerarTrilhaPadrao() {
    final isPmpe = _concursoAlvo.toUpperCase().contains('MILITAR') || _concursoAlvo.toUpperCase().contains('PM-PE') || _concursoAlvo.toUpperCase().contains('PMPE');
    final isPppe = _concursoAlvo.toUpperCase().contains('PENAL') || _concursoAlvo.toUpperCase().contains('PP-PE') || _concursoAlvo.toUpperCase().contains('PPPE');

    if (isPmpe) {
      _trilhaSemanal = [
        MetaDiaEstudo(
          diaSemana: 'Segunda-feira',
          disciplina1: 'Língua Portuguesa',
          topico1: 'Compreensão & Interpretação de Texto • Padrão AOCP',
          disciplina2: 'Noções de Informática',
          topico2: 'Segurança da Informação, Vírus, Malware & Backup',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Terça-feira',
          disciplina1: 'História de Pernambuco',
          topico1: 'Ocupação Holandesa & Governo Nassau (1637-1644)',
          disciplina2: 'Raciocínio Lógico Matemático',
          topico2: 'Lógica Proposicional, Conectivos e Tabelas-Verdade',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quarta-feira',
          disciplina1: 'Direito Constitucional',
          topico1: 'Art. 5º da CF/88 (Direitos e Garantias Individuais)',
          disciplina2: 'Língua Portuguesa',
          topico2: 'Sintaxe da Oração, Regência e Crase • Regra AOCP',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quinta-feira',
          disciplina1: 'Direitos Humanos e Legislação',
          topico1: 'Declaração Universal dos Direitos Humanos & Estatuto PMPE',
          disciplina2: 'Raciocínio Lógico Matemático',
          topico2: 'Equivalências Lógicas, Leis de Morgan & Negações',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sexta-feira',
          disciplina1: 'Noções de Informática',
          topico1: 'Sistemas Operacionais (Windows/Linux) & Pacote Office',
          disciplina2: 'História de Pernambuco',
          topico2: 'Revolução de 1817 & Confederação do Equador (1824)',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sábado',
          disciplina1: 'Simulado Oficial PMPE AOCP (60 Questões)',
          topico1: 'Caderno 60 Questões A-E + Redação Discursiva',
          disciplina2: 'Auditoria de Acertos e Erros',
          topico2: 'Caderno de Erros das 6 Disciplinas do Edital',
          metaQuestoes: 60,
          isSimulado: true,
        ),
        MetaDiaEstudo(
          diaSemana: 'Domingo',
          disciplina1: 'Revisão Ativa & Flashcards',
          topico1: 'Memorização de Leis, Fórmulas e Marcos Históricos de PE',
          disciplina2: 'Planejamento da Próxima Semana',
          topico2: 'Ajuste de Cargas e Metas no CRAVOU IA',
          metaQuestoes: 15,
        ),
      ];
    } else if (isPppe) {
      _trilhaSemanal = [
        MetaDiaEstudo(
          diaSemana: 'Segunda-feira',
          disciplina1: 'Língua Portuguesa',
          topico1: 'Tipologia Textual & Equivalência de Estruturas Cebraspe',
          disciplina2: 'Legislação Penitenciária (LEP)',
          topico2: 'Direitos e Deveres do Preso (Lei 7.210/84)',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Terça-feira',
          disciplina1: 'Direito Penal',
          topico1: 'Crimes Praticados por Funcionário Público contra a Adm.',
          disciplina2: 'Direitos Humanos',
          topico2: 'Regras de Mandela e Convenção Americana (Pacto de San José)',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quarta-feira',
          disciplina1: 'Direito Processual Penal',
          topico1: 'Prisões Cautelares, Flagrante e Liberdade Provisória',
          disciplina2: 'Direito Administrativo',
          topico2: 'Regime Disciplinar & Poder de Polícia',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quinta-feira',
          disciplina1: 'Legislação Penitenciária (LEP)',
          topico1: 'Regime Disciplinar Diferenciado (RDD) e Faltas Disciplinares',
          disciplina2: 'Direito Constitucional',
          topico2: 'Garantias Penais no Art. 5º da CF',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sexta-feira',
          disciplina1: 'Língua Portuguesa',
          topico1: 'Pontuação & Reescrita de Frases Cebraspe',
          disciplina2: 'Legislação Especial',
          topico2: 'Lei de Tortura (Lei 9.455) e Abuso de Autoridade',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sábado',
          disciplina1: 'Simulado Cebraspe Polícia Penal (60 Itens C/E)',
          topico1: 'Cronômetro real e cálculo Certo menos Errado',
          disciplina2: 'Revisão dos Erros',
          topico2: 'Caderno de Erros das matérias específicas',
          metaQuestoes: 60,
          isSimulado: true,
        ),
        MetaDiaEstudo(
          diaSemana: 'Domingo',
          disciplina1: 'Revisão Rápida',
          topico1: 'Leitura seca de artigos da Lei de Execução Penal',
          disciplina2: 'Descanso Tático',
          topico2: 'Recuperação para a próxima semana operacional',
          metaQuestoes: 10,
        ),
      ];
    } else {
      // PC-PE (Agente / Escrivão)
      _trilhaSemanal = [
        MetaDiaEstudo(
          diaSemana: 'Segunda-feira',
          disciplina1: 'Língua Portuguesa',
          topico1: 'Crase & Regência Verbal • Regra de Ouro Cebraspe',
          disciplina2: 'Direito Penal',
          topico2: 'Teoria do Crime, Tipicidade & Ilicitude',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Terça-feira',
          disciplina1: 'Direito Processual Penal',
          topico1: 'Inquérito Policial (Art. 17 CPP) & Valor Probatório',
          disciplina2: 'Direito Constitucional',
          topico2: 'Segurança Pública (Art. 144 CF) & Polícia Judiciária',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quarta-feira',
          disciplina1: 'Direito Administrativo',
          topico1: 'Poder de Polícia & Responsabilidade Civil do Estado',
          disciplina2: 'Língua Portuguesa',
          topico2: 'Funções da partícula SE & Vozes Verbais',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Quinta-feira',
          disciplina1: 'Direito Penal',
          topico1: 'Crimes contra a Vida & Lesões Corporais',
          disciplina2: 'Direito Processual Penal',
          topico2: 'Provas Ilícitas por Derivação & Prisão Preventiva',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sexta-feira',
          disciplina1: 'Legislação Especial & Direitos Humanos',
          topico1: 'Abuso de Autoridade (Lei 13.869) & Lei de Drogas',
          disciplina2: 'Noções de Informática',
          topico2: 'Segurança da Informação, Ransomware & Redes',
          metaQuestoes: _horasPorDia * 8,
        ),
        MetaDiaEstudo(
          diaSemana: 'Sábado',
          disciplina1: 'Simulado Oficial Cebraspe PC-PE (60 Itens C/E)',
          topico1: 'Caderno 60 itens com cronômetro real de 4h30min',
          disciplina2: 'Auditoria de Saldo Líquido',
          topico2: 'Cálculo de uma errada anula uma certa (C - E)',
          metaQuestoes: 60,
          isSimulado: true,
        ),
        MetaDiaEstudo(
          diaSemana: 'Domingo',
          disciplina1: 'Revisão Ativa dos Erros',
          topico1: 'Caderno de Erros dos simulados anteriores',
          disciplina2: 'Descanso Tático',
          topico2: 'Recuperação para a próxima semana operacional',
          metaQuestoes: 10,
        ),
      ];
    }
  }

  /// Retorna a meta de estudo correspondente ao dia de hoje
  MetaDiaEstudo get metaDeHoje {
    if (_trilhaSemanal.isEmpty) {
      _gerarTrilhaPadrao();
    }
    // DateTime.weekday: 1 = Segunda, 2 = Terça, ..., 7 = Domingo
    final weekday = DateTime.now().weekday;
    final index = (weekday - 1).clamp(0, _trilhaSemanal.length - 1);
    return _trilhaSemanal[index];
  }

  /// Atualiza o plano tático do aluno após carregar ou selecionar o edital
  void atualizarPlano({
    required String concursoAlvo,
    required String cargoAlvo,
    required String banca,
    String? nomeArquivo,
    String? tamanhoArquivo,
    required int horasPorDia,
    required int semanasAteProva,
    required List<String> disciplinas,
  }) {
    _concursoAlvo = concursoAlvo;
    _cargoAlvo = cargoAlvo;
    _banca = banca;
    _nomeArquivoEdital = nomeArquivo;
    _tamanhoArquivoEdital = tamanhoArquivo;
    _horasPorDia = horasPorDia;
    _semanasAteProva = semanasAteProva;
    _disciplinas = List.from(disciplinas);
    _temCronogramaAtivo = true;

    _gerarTrilhaPadrao();
    notifyListeners();
  }
}
