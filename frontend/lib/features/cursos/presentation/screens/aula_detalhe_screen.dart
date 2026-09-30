import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../../../questoes/presentation/widgets/questao_card_widget.dart';
import '../../data/models/mapa_mental_model.dart';

/// Tela de Estudo de Aula com 3 Abas Táticas:
/// 1. Resumo Teórico Didático Enriquecido (Método CRAVOU);
/// 2. Mapa Mental Tático Interativo (Conceito Central + Regra de Ouro + Ramos);
/// 3. Questões de Treino Vinculadas (Mínimo de 15) com placar de desempenho em tempo real.
class AulaDetalheScreen extends StatefulWidget {
  final String disciplina;
  final String tituloAula;
  final String tempoLeitura;
  final List<QuestaoModel> questoesVinculadas;
  final String? conteudoTeorico;
  final MapaMentalData? mapaMental;

  const AulaDetalheScreen({
    super.key,
    required this.disciplina,
    required this.tituloAula,
    this.tempoLeitura = '15 min de leitura',
    required this.questoesVinculadas,
    this.conteudoTeorico,
    this.mapaMental,
  });

  @override
  State<AulaDetalheScreen> createState() => _AulaDetalheScreenState();
}

class _AulaDetalheScreenState extends State<AulaDetalheScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Map<int, String> _respostasAluno = {};
  final Set<int> _gabaritosRevelados = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int get _totalAcertos {
    int acertos = 0;
    for (final q in widget.questoesVinculadas) {
      final resp = _respostasAluno[q.id];
      if (resp != null && resp.trim().toUpperCase() == q.gabaritoOficial.trim().toUpperCase()) {
        acertos++;
      }
    }
    return acertos;
  }

  int get _totalErros {
    int erros = 0;
    for (final q in widget.questoesVinculadas) {
      final resp = _respostasAluno[q.id];
      if (resp != null && resp.trim().toUpperCase() != q.gabaritoOficial.trim().toUpperCase()) {
        erros++;
      }
    }
    return erros;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tituloAula,
              style: AppTypography.heading3.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${widget.disciplina} • ${widget.tempoLeitura}',
              style: AppTypography.caption.copyWith(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.brandCobalt,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.brandCobalt,
          indicatorWeight: 3,
          labelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          tabs: [
            const Tab(
              icon: Icon(Icons.menu_book_outlined, size: 18),
              text: 'Resumo',
            ),
            const Tab(
              icon: Icon(Icons.psychology_outlined, size: 18),
              text: 'Mapa Mental',
            ),
            Tab(
              icon: const Icon(Icons.quiz_outlined, size: 18),
              text: 'Questões (${widget.questoesVinculadas.length})',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ABA 1: RESUMO TEÓRICO ENRIQUECIDO
          _buildAbaResumo(),

          // ABA 2: MAPA MENTAL TÁTICO
          _buildAbaMapaMental(),

          // ABA 3: QUESTÕES DE TREINO COM PLACAR
          _buildAbaQuestoes(),
        ],
      ),
    );
  }

  // ========================================================================
  // ABA 1: RESUMO TEÓRICO DIDÁTICO
  // ========================================================================
  Widget _buildAbaResumo() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card de Cabeçalho do Conteúdo Oficial
          TacticalCard(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.brandOrange.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'METODOLOGIA TÁTICA CRAVOU',
                        style: TextStyle(color: AppColors.brandOrange, fontWeight: FontWeight.w800, fontSize: 10),
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.verified, color: AppColors.brandCobalt, size: 18),
                    const SizedBox(width: 4),
                    const Text('100% Autoral', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.brandCobalt)),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.tituloAula,
                  style: AppTypography.headlineMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  'Síntese estratégica com regras, mnemônicos e pegadinhas de bancas policiais.',
                  style: AppTypography.caption.copyWith(fontSize: 11.5, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Texto do Resumo Teórico
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.surfaceBorder),
            ),
            child: Text(
              widget.conteudoTeorico != null && widget.conteudoTeorico!.isNotEmpty
                  ? widget.conteudoTeorico!
                  : 'Conteúdo programático oficial em síntese didática. Consulte os mapas mentais e resolva as questões da aula.',
              style: AppTypography.bodyMedium.copyWith(fontSize: 13.5, height: 1.6, color: AppColors.textPrimary),
            ),
          ),

          const SizedBox(height: 20),

          // Ações Rápidas de Navegação Tática
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppColors.brandCobalt),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => _tabController.animateTo(1),
                  icon: const Icon(Icons.psychology, size: 18, color: AppColors.brandCobalt),
                  label: const Text(
                    'VER MAPA MENTAL',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.brandCobalt),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brandCobalt,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => _tabController.animateTo(2),
                  icon: const Icon(Icons.play_circle_fill, size: 18),
                  label: const Text(
                    'TREINAR QUESTÕES',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // ========================================================================
  // ABA 2: MAPA MENTAL TÁTICO
  // ========================================================================
  Widget _buildAbaMapaMental() {
    final mapa = widget.mapaMental;

    if (mapa == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.psychology_alt_outlined, size: 56, color: AppColors.textSecondary),
              const SizedBox(height: 12),
              Text(
                'Mapa Mental em Renderização Tática',
                style: AppTypography.heading3.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 6),
              const Text(
                'O mapa visual desta aula está sendo compilado pelo núcleo pedagógico CRAVOU.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. CONCEITO CENTRAL
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.hub_rounded, color: Colors.white, size: 20),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'CONCEITO CENTRAL DO MAPA',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF93C5FD),
                              letterSpacing: 0.6,
                            ),
                          ),
                          Text(
                            mapa.conceitoCentral,
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 2. REGRA DE OURO DA BANCA
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7ED),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFED7AA), width: 1.2),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('🎯', style: TextStyle(fontSize: 22)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'REGRA DE OURO DA BANCA',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFC2410C),
                          letterSpacing: 0.4,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mapa.regraDeOuro,
                        style: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF7C2D12),
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 3. RAMIFICAÇÕES ESTRUTURADAS (RAMOS)
          ...mapa.ramos.map((ramo) => _buildRamoCard(ramo)),

          const SizedBox(height: 20),

          // Botão Direto para Treino de Questões
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandNavy,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => _tabController.animateTo(2),
              icon: const Icon(Icons.quiz_outlined, size: 20),
              label: Text(
                'TESTAR APRENDIZADO NAS ${widget.questoesVinculadas.length} QUESTÕES',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 12.5),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildRamoCard(MapaMentalRamo ramo) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ramo.corRamo.withValues(alpha: 0.3), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header do Ramo
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: ramo.corRamo.withValues(alpha: 0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
            ),
            child: Row(
              children: [
                Icon(ramo.icone, color: ramo.corRamo, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ramo.tituloRamo,
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: ramo.corRamo,
                        ),
                      ),
                      Text(
                        ramo.subtitulo,
                        style: TextStyle(
                          fontSize: 11,
                          color: AppColors.textSecondary.withValues(alpha: 0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Itens do Ramo
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: ramo.itens.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.surfaceBorder),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: ramo.corRamo,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item.titulo,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: Text(
                          item.descricao,
                          style: const TextStyle(fontSize: 12, color: AppColors.textPrimary, height: 1.35),
                        ),
                      ),
                      if (item.mnemonico != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          margin: const EdgeInsets.only(left: 14),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFFDE68A)),
                          ),
                          child: Text(
                            '💡 Mnemônico: ${item.mnemonico}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF92400E),
                            ),
                          ),
                        ),
                      ],
                      if (item.exemplo != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          margin: const EdgeInsets.only(left: 14),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '📌 Exemplo: ${item.exemplo}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // ABA 3: QUESTÕES PRÁTICAS COM PLACAR DE TELEMETRIA
  // ========================================================================
  Widget _buildAbaQuestoes() {
    final questoes = widget.questoesVinculadas;

    if (questoes.isEmpty) {
      return const Center(child: Text('Nenhuma questão cadastrada para esta aula.'));
    }

    final totalRespondidas = _respostasAluno.length;
    final acertos = _totalAcertos;
    final erros = _totalErros;
    final taxaAcerto = totalRespondidas > 0 ? (acertos / totalRespondidas * 100).toInt() : 0;

    return Column(
      children: [
        // Barra Superior de Telemetria da Aula
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(bottom: BorderSide(color: AppColors.surfaceBorder)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _metricPill('TOTAL', '${questoes.length}', Colors.grey),
              _metricPill('RESPONDIDAS', '$totalRespondidas', AppColors.brandCobalt),
              _metricPill('ACERTOS', '$acertos', AppColors.success),
              _metricPill('ERROS', '$erros', AppColors.error),
              _metricPill('APROVEIT.', '$taxaAcerto%', AppColors.brandOrange),
            ],
          ),
        ),

        // Lista de Questões
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 80),
            itemCount: questoes.length,
            separatorBuilder: (_, _) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final questao = questoes[index];
              return QuestaoCardWidget(
                questao: questao,
                index: index + 1,
                respostaSelecionada: _respostasAluno[questao.id],
                gabaritoRevelado: _gabaritosRevelados.contains(questao.id),
                onResponder: (resp) {
                  setState(() {
                    _respostasAluno[questao.id] = resp;
                    _gabaritosRevelados.add(questao.id);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _metricPill(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
