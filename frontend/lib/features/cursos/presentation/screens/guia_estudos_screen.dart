import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../questoes/data/models/questao_model.dart';
import 'aula_detalhe_screen.dart';

/// Tela do Guia de Estudos Oficial (Inspirada na arquitetura do QConcursos).
/// Exibe a trilha por disciplinas do edital com aulas em síntese didática e questões práticas.
class GuiaEstudosScreen extends StatefulWidget {
  final String? concursoNome;
  final List<String>? disciplinasFoco;

  const GuiaEstudosScreen({
    super.key,
    this.concursoNome,
    this.disciplinasFoco,
  });

  @override
  State<GuiaEstudosScreen> createState() => _GuiaEstudosScreenState();
}

class _GuiaEstudosScreenState extends State<GuiaEstudosScreen> {
  final Map<String, bool> _moduloAberto = {};
  bool _mostrarApenasFoco = true;

  @override
  void initState() {
    super.initState();
    _mostrarApenasFoco = widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty;
  }

  bool _deveExibirModulo(String nomeModulo) {
    if (!_mostrarApenasFoco || widget.disciplinasFoco == null || widget.disciplinasFoco!.isEmpty) {
      return true;
    }
    final modLower = nomeModulo.toLowerCase();
    return widget.disciplinasFoco!.any((foco) {
      final fLower = foco.toLowerCase();
      return modLower.contains(fLower) || fLower.contains(modLower);
    });
  }

  // Mock de Questões Didáticas Vinculadas para a Aula de Crase
  final List<QuestaoModel> _questoesCrase = const [
    QuestaoModel(
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
    QuestaoModel(
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
  ];

  // Mock de Questões da PMPE (História de PE)
  final List<QuestaoModel> _questoesHistoriaPe = const [
    QuestaoModel(
      id: 3,
      banca: 'IAUPE',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Invasões Holandesas',
      enunciado: 'Durante o domínio holandês em Pernambuco sob a administração de Maurício de Nassau (1637-1644), a política de tolerância religiosa e os investimentos urbanísticos na Cidade Maurícia marcaram o apogeu da presença neerlandesa no Nordeste açucareiro.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O governo de Maurício de Nassau notabilizou-se pela liberdade de culto (concedida a católicos, calvinistas e judeus), embelezamento do Recife, saneamento e estímulo às artes e ciências, sendo considerado o período de ouro da ocupação holandesa.',
    ),
    QuestaoModel(
      id: 4,
      banca: 'IAUPE',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Revolução Pernambucana de 1817',
      enunciado: 'A Revolução Pernambucana de 1817 instaurou uma república independente de caráter provisório em Pernambuco, motivada pela insatisfação com os altos impostos cobrados pela Coroa portuguesa sediada no Rio de Janeiro e pelas secas no Nordeste.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O movimento de 1817 proclamou a República de Pernambuco, com liberdade de imprensa e culto, opondo-se ao absolutismo monárquico joanino e à pesada carga tributária que financiava a corte no Rio.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final plano = PlanoEstudoState.instance;
    final String concursoAtivo = widget.concursoNome ?? plano.concursoAlvo;
    final bool isPmpe = concursoAtivo.toUpperCase().contains('MILITAR') ||
        concursoAtivo.toUpperCase().contains('PMPE') ||
        concursoAtivo.toUpperCase().contains('PM-PE');

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guia de Estudos do Edital',
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              isPmpe ? 'PM-PE — Soldado da Polícia Militar' : 'PC-PE — Agente de Polícia',
              style: AppTypography.caption.copyWith(fontSize: 12, color: AppColors.brandOrange, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Principal do Curso
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: isPmpe ? const Color(0xFF15803D) : AppColors.brandNavy,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.school, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isPmpe ? 'Curso Reta Final PM-PE (Edital Publicado)' : 'Curso Reta Final PC-PE (Cebraspe)',
                              style: AppTypography.titleMedium.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              isPmpe
                                  ? 'Banca IAUPE/AOCP • 2.400 Vagas • Material Autoral + Questões'
                                  : 'Banca Cebraspe • Material Autoral + Questões do Edital',
                              style: AppTypography.caption.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Barra de Progresso do Curso
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Progresso do Guia', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                      Text('18% concluído', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.18,
                      minHeight: 6,
                      backgroundColor: AppColors.surfaceElevated,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandCobalt),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Banner de Modo Foco (Meta de Hoje)
            if (widget.disciplinasFoco != null && widget.disciplinasFoco!.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Row(
                  children: [
                    const Text('🎯', style: TextStyle(fontSize: 18)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'MODO FOCO • METAS DO DIA',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF92400E),
                              letterSpacing: 0.4,
                            ),
                          ),
                          Text(
                            _mostrarApenasFoco
                                ? 'Exibindo apenas as disciplinas do seu treino de hoje.'
                                : 'Exibindo todas as disciplinas do edital completo da PM-PE.',
                            style: const TextStyle(fontSize: 10.5, color: Color(0xFFB45309)),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() => _mostrarApenasFoco = !_mostrarApenasFoco),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        _mostrarApenasFoco ? 'VER TODAS' : 'SÓ DO DIA',
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: Color(0xFF92400E)),
                      ),
                    ),
                  ],
                ),
              ),

            // Título da Seção de Disciplinas
            Text(
              _mostrarApenasFoco ? 'DISCIPLINAS DO DIA (FOCO 100%)' : 'DISCIPLINAS DO EDITAL OFICIAL',
              style: AppTypography.tagLabel.copyWith(
                color: AppColors.textPrimary,
                letterSpacing: 0.8,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),

            if (isPmpe) ...[
              // MÓDULO 1 PM-PE: LÍNGUA PORTUGUESA (AOCP)
              if (_deveExibirModulo('Língua Portuguesa')) ...[
                _moduloCard(
                  nome: 'Língua Portuguesa (Instituto AOCP)',
                  icone: '✍️',
                  totalAulas: 3,
                  totalQuestoes: 18,
                  corBadge: AppColors.brandCobalt,
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Compreensão, Interpretação e Tipologia Textual AOCP',
                      detalhes: '12 min • Síntese Didática • 10 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('Língua Portuguesa', 'Aula 01: Interpretação de Texto AOCP'),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Acento Indicativo de Crase & Regência Verbal e Nominal',
                      detalhes: '15 min • Síntese Didática • 15 questões',
                      concluida: false,
                      onTap: () => _abrirAula('Língua Portuguesa', 'Aula 02: Crase e Regência para PM-PE', questoes: _questoesCrase),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],

              // MÓDULO 2 PM-PE: NOÇÕES DE INFORMÁTICA
              if (_deveExibirModulo('Noções de Informática')) ...[
                _moduloCard(
                  nome: 'Noções de Informática',
                  icone: '💻',
                  totalAulas: 2,
                  totalQuestoes: 14,
                  corBadge: const Color(0xFF0284C7),
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Segurança da Informação: Vírus, Ransomware, Phishing & Backup',
                      detalhes: '14 min • Resumo com Casos Práticos • 12 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('Noções de Informática', 'Aula 01: Segurança da Informação e Ameaças'),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Sistemas Operacionais Windows 10/11 & Conceitos de Linux',
                      detalhes: '10 min • Comandos e Atalhos • 10 questões',
                      concluida: false,
                      onTap: () => _abrirAula('Noções de Informática', 'Aula 02: Sistemas Operacionais'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],

              // MÓDULO 3 PM-PE: HISTÓRIA DE PERNAMBUCO
              if (_deveExibirModulo('História de Pernambuco')) ...[
                _moduloCard(
                  nome: 'História de Pernambuco',
                  icone: '⚔️',
                  totalAulas: 3,
                  totalQuestoes: 15,
                  corBadge: const Color(0xFF15803D),
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Invasões Holandesas & Governo de Maurício de Nassau (1637-1644)',
                      detalhes: '14 min • Síntese Didática • 8 questões',
                      concluida: true,
                      onTap: () => _abrirAula('História de Pernambuco', 'Aula 01: Invasões Holandesas em PE', questoes: _questoesHistoriaPe),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Insurreição Pernambucana & Guerra dos Mascates (1710)',
                      detalhes: '12 min • Síntese Didática • 10 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('História de Pernambuco', 'Aula 02: Insurreição e Mascates', questoes: _questoesHistoriaPe),
                    ),
                    _aulaItem(
                      numero: '03',
                      titulo: 'Revolução de 1817 & Confederação do Equador (1824)',
                      detalhes: '15 min • Síntese Didática • 12 questões',
                      concluida: false,
                      onTap: () => _abrirAula('História de Pernambuco', 'Aula 03: Movimentos Revolucionários de PE', questoes: _questoesHistoriaPe),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],

              // MÓDULO 4 PM-PE: RACIOCÍNIO LÓGICO MATEMÁTICO
              if (_deveExibirModulo('Raciocínio Lógico')) ...[
                _moduloCard(
                  nome: 'Raciocínio Lógico Matemático',
                  icone: '📐',
                  totalAulas: 2,
                  totalQuestoes: 12,
                  corBadge: const Color(0xFF6366F1),
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Lógica Proposicional: Conectivos, Tabela-Verdade e Negações',
                      detalhes: '14 min • Macetes Práticos • 12 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('RLM', 'Aula 01: Lógica Proposicional'),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Equivalências Lógicas & Leis de De Morgan',
                      detalhes: '10 min • Fórmulas • 10 questões',
                      concluida: false,
                      onTap: () => _abrirAula('RLM', 'Aula 02: Equivalências e Negações'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],

              // MÓDULO 5 PM-PE: DIREITO CONSTITUCIONAL
              if (_deveExibirModulo('Direito Constitucional')) ...[
                _moduloCard(
                  nome: 'Direito Constitucional',
                  icone: '🏛️',
                  totalAulas: 2,
                  totalQuestoes: 14,
                  corBadge: const Color(0xFFB45309),
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Art. 5º da CF/88: Direitos e Garantias Individuais e Coletivos',
                      detalhes: '16 min • Letra de Lei Explicada • 15 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('Direito Constitucional', 'Aula 01: Art. 5º da CF/88'),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Da Segurança Pública (Art. 144 da CF/88) & Atribuições da PM',
                      detalhes: '12 min • Síntese Didática • 10 questões',
                      concluida: false,
                      onTap: () => _abrirAula('Direito Constitucional', 'Aula 02: Art. 144 - Segurança Pública'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],

              // MÓDULO 6 PM-PE: DIREITOS HUMANOS E LEGISLAÇÃO
              if (_deveExibirModulo('Direitos Humanos') || _deveExibirModulo('Legislação')) ...[
                _moduloCard(
                  nome: 'Direitos Humanos & Legislação da PMPE',
                  icone: '⚖️',
                  totalAulas: 2,
                  totalQuestoes: 12,
                  corBadge: const Color(0xFFDC2626),
                  aulas: [
                    _aulaItem(
                      numero: '01',
                      titulo: 'Declaração Universal dos DH (1948) & Pacto de San José',
                      detalhes: '12 min • Princípios Fundamentais • 10 questões',
                      concluida: false,
                      onTap: () => _abrirAula('Direitos Humanos', 'Aula 01: DUDH e Pacto de San José'),
                    ),
                    _aulaItem(
                      numero: '02',
                      titulo: 'Estatuto dos Policiais Militares de PE (Lei nº 6.783/74) & Maria da Penha',
                      detalhes: '15 min • Letra da Lei • 12 questões',
                      concluida: false,
                      destaque: true,
                      onTap: () => _abrirAula('Legislação PMPE', 'Aula 02: Estatuto dos Militares de PE'),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ] else ...[
              // MÓDULOS PADRÃO PC-PE
              _moduloCard(
                nome: 'Língua Portuguesa',
                icone: '✍️',
                totalAulas: 4,
                totalQuestoes: 20,
                corBadge: AppColors.brandCobalt,
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Compreensão, Coesão & Conectivos no Cebraspe',
                    detalhes: '12 min • Síntese Didática • 10 questões',
                    concluida: true,
                    onTap: () => _abrirAula('Língua Portuguesa', 'Aula 01: Compreensão e Coesão Textual'),
                  ),
                  _aulaItem(
                    numero: '02',
                    titulo: 'Acento Indicativo de Crase & Regências Perigosas',
                    detalhes: '15 min • Síntese Didática • 15 questões',
                    concluida: false,
                    destaque: true,
                    onTap: () => _abrirAula('Língua Portuguesa', 'Aula 02: Crase & Regência sem Mistério', questoes: _questoesCrase),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _moduloCard(
                nome: 'Noções de Direito Penal',
                icone: '⚖️',
                totalAulas: 2,
                totalQuestoes: 12,
                corBadge: const Color(0xFF15803D),
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Aplicação da Lei Penal & Retroatividade Benéfica',
                    detalhes: '12 min • Síntese Didática • 8 questões',
                    concluida: false,
                    onTap: () => _abrirAula('Direito Penal', 'Aula 01: Aplicação da Lei Penal'),
                  ),
                ],
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _abrirAula(String disciplina, String titulo, {List<QuestaoModel>? questoes}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AulaDetalheScreen(
          disciplina: disciplina,
          tituloAula: titulo,
          questoesVinculadas: questoes ?? _questoesCrase,
        ),
      ),
    );
  }

  Widget _moduloCard({
    required String nome,
    required String icone,
    required int totalAulas,
    required int totalQuestoes,
    required Color corBadge,
    required List<Widget> aulas,
  }) {
    final isOpen = _moduloAberto[nome] ?? true;

    return TacticalCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _moduloAberto[nome] = !isOpen),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(icone, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nome,
                          style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$totalAulas aulas • $totalQuestoes questões oficiais',
                          style: AppTypography.caption.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (isOpen) ...[
            const Divider(height: 1, color: AppColors.surfaceBorder),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: aulas.length,
              separatorBuilder: (_, _) => const Divider(height: 1, color: AppColors.surfaceBorder),
              itemBuilder: (context, i) => aulas[i],
            ),
          ],
        ],
      ),
    );
  }

  Widget _aulaItem({
    required String numero,
    required String titulo,
    required String detalhes,
    required bool concluida,
    bool destaque = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: concluida
                    ? AppColors.success.withValues(alpha: 0.15)
                    : destaque
                        ? AppColors.brandOrange.withValues(alpha: 0.15)
                        : AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: concluida
                    ? const Icon(Icons.check, color: AppColors.success, size: 16)
                    : Text(
                        numero,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: destaque ? FontWeight.bold : FontWeight.w600,
                      color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detalhes,
                    style: AppTypography.caption.copyWith(fontSize: 10.5),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
