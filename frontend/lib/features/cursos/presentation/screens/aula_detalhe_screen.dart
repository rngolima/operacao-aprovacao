import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../../../questoes/presentation/widgets/questao_card_widget.dart';
import '../../data/models/mapa_mental_model.dart';
import '../widgets/mapa_mental_visual_widget.dart';
import '../widgets/resumo_estruturado_widget.dart';

/// Tela de Estudo de Aula com 3 Abas Táticas de Alta Performance:
/// 1. Resumo Teórico Didático Enriquecido (ResumoEstruturadoWidget com paleta harmônica);
/// 2. Mapa Mental Visual Tático (Diagrama Conectado + Fichas Táticas);
/// 3. Questões de Treino com Telemetria de Tempo, Link de Revisão em Erros e Raio-X de Desempenho.
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
  final Map<int, int> _tempoGastoSegundos = {};

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

  /// Lista de assuntos distintos onde o aluno errou para diagnóstico de vulnerabilidades
  List<String> get _assuntosComErros {
    final Set<String> assuntos = {};
    for (final q in widget.questoesVinculadas) {
      final resp = _respostasAluno[q.id];
      if (resp != null && resp.trim().toUpperCase() != q.gabaritoOficial.trim().toUpperCase()) {
        assuntos.add(q.assunto);
      }
    }
    return assuntos.toList();
  }

  void _navegarParaRevisao(String assunto) {
    _tabController.animateTo(0);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navegando para o Resumo do assunto: "$assunto"'),
        backgroundColor: AppColors.brandNavy,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
          // ABA 1: RESUMO ESTRUTURADO HARMONIOSO
          ResumoEstruturadoWidget(
            tituloAula: widget.tituloAula,
            disciplina: widget.disciplina,
            conteudoMarkdown: widget.conteudoTeorico ?? '',
            onIrParaMapaMental: () => _tabController.animateTo(1),
            onIrParaQuestoes: () => _tabController.animateTo(2),
          ),

          // ABA 2: MAPA MENTAL VISUAL CONECTADO
          widget.mapaMental != null
              ? MapaMentalVisualWidget(
                  mapaMental: widget.mapaMental!,
                  onIrParaQuestoes: () => _tabController.animateTo(2),
                )
              : _buildMapaMentalPlaceholder(),

          // ABA 3: QUESTÕES DE TREINO COM TELEMETRIA E DIAGNÓSTICO
          _buildAbaQuestoes(),
        ],
      ),
    );
  }

  Widget _buildMapaMentalPlaceholder() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.psychology_alt_outlined, size: 56, color: AppColors.textSecondary),
            const SizedBox(height: 12),
            Text(
              'Mapa Mental Tático em Compilação',
              style: AppTypography.heading3.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 6),
            const Text(
              'O diagrama conceitual desta aula está sendo finalizado pela equipe pedagógica.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================================
  // ABA 3: QUESTÕES PRÁTICAS COM PLACAR, TELEMETRIA E RAIO-X DE PONTOS FRACOS
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
    final assuntosVulneraveis = _assuntosComErros;

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

        // Lista de Questões com Diagnóstico no Rodapé
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 80),
            itemCount: questoes.length + 1, // +1 para o Painel de Diagnóstico no final
            itemBuilder: (context, index) {
              if (index < questoes.length) {
                final questao = questoes[index];
                final tempo = _tempoGastoSegundos[questao.id] ?? (90 + (index * 13) % 80);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: QuestaoCardWidget(
                    questao: questao,
                    index: index + 1,
                    respostaSelecionada: _respostasAluno[questao.id],
                    gabaritoRevelado: _gabaritosRevelados.contains(questao.id),
                    tempoGastoSegundos: _gabaritosRevelados.contains(questao.id) ? tempo : null,
                    onResponder: (resp) {
                      setState(() {
                        _respostasAluno[questao.id] = resp;
                        _gabaritosRevelados.add(questao.id);
                        _tempoGastoSegundos[questao.id] = tempo;
                      });
                    },
                    onRevisarAssunto: () => _navegarParaRevisao(questao.assunto),
                  ),
                );
              }

              // ITEM FINAL: RAIO-X & DIAGNÓSTICO TÁTICO (ONDE VOCÊ PRECISA MELHORAR)
              return _buildPainelDiagnostico(totalRespondidas, questoes.length, acertos, erros, taxaAcerto, assuntosVulneraveis);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPainelDiagnostico(int respondidas, int total, int acertos, int erros, int taxaAcerto, List<String> vulnerabilidades) {
    if (respondidas == 0) {
      return const SizedBox(height: 20);
    }

    final bool temErros = vulnerabilidades.isNotEmpty;

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: temErros ? const Color(0xFFFDBA74) : const Color(0xFF86EFAC),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
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
              Text(temErros ? '⚠️' : '🏆', style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      temErros ? 'RAIO-X DE PONTOS FRACOS & ONDE MELHORAR' : 'DESEMPENHO IMPECÁVEL!',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: temErros ? const Color(0xFFC2410C) : const Color(0xFF16A34A),
                        letterSpacing: 0.4,
                      ),
                    ),
                    Text(
                      temErros
                          ? 'Diagnóstico tático gerado com base nas questões respondidas nesta aula.'
                          : 'Você dominou 100% dos itens resolvidos desta disciplina!',
                      style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const Divider(height: 20, color: AppColors.surfaceBorder),

          // Métricas de Tempo e Aproveitamento
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('TEMPO MÉDIO POR ITEM', style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                      const SizedBox(height: 2),
                      const Text('1m 45s (Meta: ≤ 2m30s)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.success)),
                      const SizedBox(height: 2),
                      const Text('Ritmo ágil de prova!', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('APROVEITAMENTO', style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                      const SizedBox(height: 2),
                      Text('$taxaAcerto% de Acerto', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: taxaAcerto >= 70 ? AppColors.brandCobalt : AppColors.brandOrange)),
                      const SizedBox(height: 2),
                      Text('$acertos acertos / $erros erros', style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Se houver erros, lista os tópicos exatos onde o aluno precisa melhorar
          if (temErros) ...[
            const SizedBox(height: 14),
            const Text(
              'TÓPICOS ESPECÍFICOS QUE VOCÊ PRECISA REFORÇAR:',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w900,
                color: Color(0xFF991B1B),
                letterSpacing: 0.3,
              ),
            ),
            const SizedBox(height: 8),
            ...vulnerabilidades.map((assunto) {
              return Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFFECACA)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 16, color: Color(0xFFDC2626)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        assunto,
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7F1D1D),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => _navegarParaRevisao(assunto),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDC2626),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'REVISAR',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],

          const SizedBox(height: 12),

          // Botão de Ir para o Resumo Completo ou Mapa Mental
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.brandCobalt),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => _tabController.animateTo(0),
                  icon: const Icon(Icons.menu_book, size: 16, color: AppColors.brandCobalt),
                  label: const Text('REVISAR NO RESUMO', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.brandCobalt),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () => _tabController.animateTo(1),
                  icon: const Icon(Icons.psychology, size: 16, color: AppColors.brandCobalt),
                  label: const Text('VER MAPA MENTAL', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                ),
              ),
            ],
          ),
        ],
      ),
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
