import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../data/models/item_resposta_simulado.dart';
import '../../data/models/resultado_simulado_model.dart';
import '../../data/models/simulado_model.dart';
import 'simulado_revisao_screen.dart';

/// Modal/Tela que exibe o Relatório Executivo Cebraspe após submissão do Simulado.
class SimuladoResultadoDialog extends StatelessWidget {
  final ResultadoSimuladoModel resultado;
  final List<ItemSimuladoModel> itens;
  final Map<int, ItemRespostaSimulado> respostas;
  final VoidCallback onConcluir;

  const SimuladoResultadoDialog({
    super.key,
    required this.resultado,
    this.itens = const [],
    this.respostas = const {},
    required this.onConcluir,
  });

  static Future<void> exibir(
    BuildContext context, {
    required ResultadoSimuladoModel resultado,
    List<ItemSimuladoModel> itens = const [],
    Map<int, ItemRespostaSimulado> respostas = const {},
    required VoidCallback onConcluir,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => SimuladoResultadoDialog(
        resultado: resultado,
        itens: itens,
        respostas: respostas,
        onConcluir: onConcluir,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final saldoLiquido = resultado.pontuacaoLiquida;
    final aprovado = resultado.aprovado;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 520, maxHeight: 680),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppSpacing.borderRadiusLg,
          border: Border.all(
            color: aprovado ? AppColors.success : AppColors.accentOrange,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: (aprovado ? AppColors.success : AppColors.accentOrange).withValues(alpha: 0.15),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            // Topo com Status Oficial Cebraspe
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: (aprovado ? AppColors.success : AppColors.accentOrange).withValues(alpha: 0.12),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    aprovado ? Icons.verified : Icons.warning_amber_rounded,
                    color: aprovado ? AppColors.success : AppColors.accentOrange,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          aprovado ? 'APROVADO NA PROVA OBJETIVA' : 'ABAIXO DA NOTA DE CORTE',
                          style: AppTypography.tagLabel.copyWith(
                            color: aprovado ? AppColors.success : AppColors.accentOrange,
                            letterSpacing: 1.1,
                          ),
                        ),
                        Text(
                          resultado.simuladoTitulo,
                          style: AppTypography.headlineMedium.copyWith(fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Conteúdo Rolável
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Placar Cebraspe Master: C - E
                    TacticalCard(
                      child: Column(
                        children: [
                          Text(
                            'PONTUAÇÃO LÍQUIDA CEBRASPE',
                            style: AppTypography.tagLabel.copyWith(
                              color: AppColors.textSecondary,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                saldoLiquido.toStringAsFixed(1),
                                style: AppTypography.displayLarge.copyWith(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                  color: aprovado ? AppColors.success : AppColors.accentOrange,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '/ ${resultado.totalQuestoes}.0 pts',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Fórmula: Nota = Acertos ($resultado.totalAcertos) − Erros ($resultado.totalErros)',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.md),

                    // Grid de Métricas Táticas
                    Row(
                      children: [
                        Expanded(
                          child: _metricaCard(
                            titulo: 'ACERTOS (+1)',
                            valor: '${resultado.totalAcertos}',
                            cor: AppColors.success,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _metricaCard(
                            titulo: 'ERROS (-1)',
                            valor: '${resultado.totalErros}',
                            cor: AppColors.error,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _metricaCard(
                            titulo: 'EM BRANCO (0)',
                            valor: '${resultado.totalEmBranco}',
                            cor: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _metricaCard(
                            titulo: 'TEMPO TOTAL',
                            valor: resultado.tempoFormatado,
                            cor: AppColors.secondary,
                            isMono: true,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    // Desempenho por Disciplina
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'DESEMPENHO POR DISCIPLINA',
                        style: AppTypography.tagLabel.copyWith(
                          color: AppColors.textPrimary,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    ...resultado.desempenhoPorDisciplina.entries.map((entry) {
                      final disc = entry.value;
                      final saldo = disc.saldoLiquido;
                      final corSaldo = saldo > 0
                          ? AppColors.success
                          : (saldo == 0 ? AppColors.textSecondary : AppColors.error);

                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: AppSpacing.borderRadiusSm,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    disc.disciplina,
                                    style: AppTypography.bodyMedium.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '${disc.acertos}C • ${disc.erros}E • ${disc.emBranco}B de ${disc.totalItens} itens',
                                    style: AppTypography.bodySmall.copyWith(
                                      fontSize: 11,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: corSaldo.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${saldo >= 0 ? '+' : ''}$saldo pts',
                                style: AppTypography.tabularDigits.copyWith(
                                  color: corSaldo,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            // Ações Inferiores
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (itens.isNotEmpty) ...[
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandCobalt,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: AppSpacing.borderRadiusMd,
                          ),
                          elevation: 0,
                        ),
                        icon: const Icon(Icons.fact_check_outlined, size: 20),
                        label: const Text(
                          'REVISAR GABARITO COMPLETO',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13, letterSpacing: 0.8),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // fecha modal
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => SimuladoRevisaoScreen(
                                resultado: resultado,
                                itens: itens,
                                respostas: respostas,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.textSecondary,
                        side: const BorderSide(color: AppColors.surfaceBorder),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppSpacing.borderRadiusMd,
                        ),
                      ),
                      onPressed: onConcluir,
                      child: const Text(
                        'CONCLUIR & VOLTAR AO PAINEL',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricaCard({
    required String titulo,
    required String valor,
    required Color cor,
    bool isMono = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: AppSpacing.borderRadiusSm,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: AppTypography.tagLabel.copyWith(
              fontSize: 9,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: isMono
                ? AppTypography.tabularDigits.copyWith(
                    color: cor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  )
                : AppTypography.headlineMedium.copyWith(
                    color: cor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
          ),
        ],
      ),
    );
  }
}
