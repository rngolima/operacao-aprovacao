import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../data/models/item_resposta_simulado.dart';
import '../../data/models/resultado_simulado_model.dart';
import '../../data/models/simulado_model.dart';

/// Tela de Revisão Analítica e Gabarito Comentado do Simulado Oficial (Passo 5 da Sprint 5).
/// Permite ao aluno dissecar cada um dos 60 itens com a fórmula Cebraspe (C - E),
/// visualizando sua resposta vs gabarito oficial e a fundamentação didática autoral CRAVOU.
class SimuladoRevisaoScreen extends StatefulWidget {
  final ResultadoSimuladoModel resultado;
  final List<ItemSimuladoModel> itens;
  final Map<int, ItemRespostaSimulado> respostas;

  const SimuladoRevisaoScreen({
    super.key,
    required this.resultado,
    required this.itens,
    required this.respostas,
  });

  @override
  State<SimuladoRevisaoScreen> createState() => _SimuladoRevisaoScreenState();
}

class _SimuladoRevisaoScreenState extends State<SimuladoRevisaoScreen> {
  String _filtroStatus = 'Todos'; // 'Todos', 'Acertos', 'Erros', 'Em Branco'
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isAcerto(ItemSimuladoModel item, ItemRespostaSimulado? resp) {
    if (resp == null || resp.respostaMarcada == null || resp.respostaMarcada!.isEmpty) {
      return false;
    }
    final gabarito = item.gabaritoOficial?.toUpperCase().trim() ?? 'C';
    final marcacao = resp.respostaMarcada!.toUpperCase().trim();
    // Suporta tanto 'C'/'E' quanto 'CERTO'/'ERRADO'
    if (marcacao == gabarito) return true;
    if (marcacao == 'C' && gabarito == 'CERTO') return true;
    if (marcacao == 'E' && gabarito == 'ERRADO') return true;
    return false;
  }

  bool _isEmBranco(ItemRespostaSimulado? resp) {
    return resp == null || resp.respostaMarcada == null || resp.respostaMarcada!.isEmpty;
  }

  List<ItemSimuladoModel> _filtrarItens() {
    return widget.itens.where((item) {
      final resp = widget.respostas[item.numeroQuestao - 1];
      if (_filtroStatus == 'Acertos') {
        return _isAcerto(item, resp);
      } else if (_filtroStatus == 'Erros') {
        return !_isAcerto(item, resp) && !_isEmBranco(resp);
      } else if (_filtroStatus == 'Em Branco') {
        return _isEmBranco(resp);
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final saldoLiquido = widget.resultado.pontuacaoLiquida;
    final aprovado = widget.resultado.aprovado;
    final itensFiltrados = _filtrarItens();

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
              'Revisão de Gabarito',
              style: AppTypography.heading3.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${widget.resultado.simuladoTitulo} • Cebraspe',
              style: AppTypography.caption.copyWith(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),
        actions: [
          // Badge da Nota Líquida no Header
          Container(
            margin: const EdgeInsets.only(right: 16, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: (aprovado ? AppColors.success : AppColors.brandOrange).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: (aprovado ? AppColors.success : AppColors.brandOrange).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  aprovado ? Icons.check_circle_rounded : Icons.info_outline_rounded,
                  size: 14,
                  color: aprovado ? AppColors.success : AppColors.brandOrange,
                ),
                const SizedBox(width: 4),
                Text(
                  '${saldoLiquido.toStringAsFixed(1)} pts',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: aprovado ? AppColors.success : AppColors.brandOrange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner de Resumo da Prova & Filtros Rápidos
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                // Filtros Rápidos com contadores de estado
                Row(
                  children: [
                    _filtroChip('Todos', '${widget.itens.length}', Colors.black87),
                    const SizedBox(width: 6),
                    _filtroChip('Acertos', '+${widget.resultado.totalAcertos}', AppColors.success),
                    const SizedBox(width: 6),
                    _filtroChip('Erros', '-${widget.resultado.totalErros}', AppColors.error),
                    const SizedBox(width: 6),
                    _filtroChip('Em Branco', '${widget.resultado.totalEmBranco}', AppColors.textMuted),
                  ],
                ),
                const SizedBox(height: 10),

                // Régua Numérica Rápida dos 60 itens
                SizedBox(
                  height: 34,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: widget.itens.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 6),
                    itemBuilder: (context, index) {
                      final item = widget.itens[index];
                      final resp = widget.respostas[index];
                      final bool acertou = _isAcerto(item, resp);
                      final bool emBranco = _isEmBranco(resp);

                      Color bg = emBranco
                          ? const Color(0xFFE2E8F0)
                          : acertou
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFFEE2E2);
                      Color text = emBranco
                          ? const Color(0xFF64748B)
                          : acertou
                              ? const Color(0xFF15803D)
                              : const Color(0xFFB91C1C);

                      return GestureDetector(
                        onTap: () {
                          // Anima scroll para posição aproximada
                          final targetIndex = widget.itens.indexOf(item);
                          if (targetIndex >= 0 && _scrollController.hasClients) {
                            _scrollController.animateTo(
                              targetIndex * 260.0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: bg,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: text.withValues(alpha: 0.3)),
                          ),
                          child: Center(
                            child: Text(
                              '${item.numeroQuestao}',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: text,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: AppColors.surfaceBorder),

          // Lista dos Itens para Revisão Detalhada
          Expanded(
            child: itensFiltrados.isEmpty
                ? Center(
                    child: Text(
                      'Nenhum item com o filtro selecionado ($_filtroStatus).',
                      style: AppTypography.bodyMedium,
                    ),
                  )
                : ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 80),
                    itemCount: itensFiltrados.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final item = itensFiltrados[index];
                      final resp = widget.respostas[item.numeroQuestao - 1];
                      final bool acertou = _isAcerto(item, resp);
                      final bool emBranco = _isEmBranco(resp);

                      return _itemRevisaoCard(item, resp, acertou, emBranco);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _filtroChip(String label, String badge, Color color) {
    final bool isSelected = _filtroStatus == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _filtroStatus = label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
          decoration: BoxDecoration(
            color: isSelected ? color.withValues(alpha: 0.12) : AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? color : AppColors.surfaceBorder,
              width: isSelected ? 1.5 : 1.0,
            ),
          ),
          child: Column(
            children: [
              Text(
                badge,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: color,
                ),
              ),
              const SizedBox(height: 1),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? color : AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemRevisaoCard(
    ItemSimuladoModel item,
    ItemRespostaSimulado? resp,
    bool acertou,
    bool emBranco,
  ) {
    final marcacao = resp?.respostaMarcada ?? 'EM BRANCO';
    final gabarito = item.gabaritoOficial ?? 'C';

    Color corStatus = emBranco
        ? AppColors.textMuted
        : acertou
            ? AppColors.success
            : AppColors.error;

    String statusTexto = emBranco
        ? 'EM BRANCO (0.0)'
        : acertou
            ? 'CRAVOU! ACERTO (+1.0)'
            : 'ERRO (-1.0 PT CEBRASPE)';

    return TacticalCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header com Número, Disciplina e Badge de Pontuação
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.brandNavy,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'ITEM #${item.numeroQuestao}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: [
                    Text(
                      item.disciplinaNome,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.brandCobalt,
                      ),
                    ),
                    Text(
                      '• ${item.assuntoNome}',
                      style: AppTypography.caption.copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: corStatus.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: corStatus.withValues(alpha: 0.3)),
                ),
                child: Text(
                  statusTexto,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: corStatus,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Texto Base (se houver)
          if (item.textoBase != null && item.textoBase!.trim().isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Text(
                item.textoBase!,
                style: AppTypography.bodySmall.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 11.5,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],

          // Enunciado
          Text(
            item.enunciado,
            style: AppTypography.bodyLarge.copyWith(
              height: 1.6,
              fontSize: 14.5,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 14),

          // Comparação: Sua Marcação vs Gabarito Oficial
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceElevated,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.surfaceBorder),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Text(
                        'Sua Resposta: ',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: corStatus.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          marcacao == 'C'
                              ? 'CERTO'
                              : marcacao == 'E'
                                  ? 'ERRADO'
                                  : marcacao,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: corStatus,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Gabarito: ',
                        style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          gabarito == 'C' ? 'CERTO' : gabarito == 'E' ? 'ERRADO' : gabarito,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Resolução Didática Cravou!
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFF86EFAC)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.lightbulb_outline_rounded, color: Color(0xFF15803D), size: 16),
                    SizedBox(width: 6),
                    Text(
                      'Fundamentação Didática Cravou! (Cebraspe)',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF15803D),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.explicacaoDidatica?.isNotEmpty == true
                      ? item.explicacaoDidatica!
                      : 'Item corrigido conforme o espelho oficial e padrões consolidados da banca Cebraspe para o concurso da Polícia Civil de Pernambuco.',
                  style: const TextStyle(
                    fontSize: 12.5,
                    height: 1.5,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
