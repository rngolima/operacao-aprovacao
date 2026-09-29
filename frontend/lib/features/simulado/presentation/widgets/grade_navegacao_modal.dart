import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../controllers/simulado_controller.dart';

/// Modal Tático com a Grade de Navegação das 60 questões do Simulado Cebraspe.
class GradeNavegacaoModal extends StatelessWidget {
  final SimuladoController controller;

  const GradeNavegacaoModal({
    super.key,
    required this.controller,
  });

  static Future<void> exibir(BuildContext context, SimuladoController controller) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => GradeNavegacaoModal(controller: controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = controller.totalQuestoes;
    final answered = controller.answeredIndices;
    final reviews = controller.reviewIndices;
    final current = controller.currentIndex;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: const Border(
          top: BorderSide(color: AppColors.surfaceBorder, width: 1.5),
        ),
      ),
      child: Column(
        children: [
          // Puxador Superior
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Cabeçalho da Grade
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GRADE DE NAVEGAÇÃO',
                      style: AppTypography.tagLabel.copyWith(
                        color: AppColors.accentOrange,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '$total ITENS CEBRASPE',
                      style: AppTypography.headlineMedium.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Legenda Tática
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: AppSpacing.borderRadiusMd,
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _legendaItem(
                    cor: AppColors.success,
                    label: 'Respondida (${answered.length})',
                  ),
                  _legendaItem(
                    cor: AppColors.accentOrange,
                    label: 'Revisão (${reviews.length})',
                  ),
                  _legendaItem(
                    cor: AppColors.border,
                    label: 'Em Branco (${total - answered.length})',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          // Grade com os 60 itens
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: total,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                itemBuilder: (context, index) {
                  final isCurrent = index == current;
                  final isAnswered = answered.contains(index);
                  final isReview = reviews.contains(index);

                  Color bgColor;
                  Color borderColor;
                  Color textColor;

                  if (isCurrent) {
                    bgColor = AppColors.primary;
                    borderColor = AppColors.secondary;
                    textColor = AppColors.surface;
                  } else if (isReview) {
                    bgColor = AppColors.accentOrange.withValues(alpha: 0.25);
                    borderColor = AppColors.accentOrange;
                    textColor = AppColors.accentOrange;
                  } else if (isAnswered) {
                    bgColor = AppColors.success.withValues(alpha: 0.2);
                    borderColor = AppColors.success;
                    textColor = AppColors.success;
                  } else {
                    bgColor = AppColors.surfaceElevated;
                    borderColor = AppColors.border;
                    textColor = AppColors.textSecondary;
                  }

                  return InkWell(
                    onTap: () {
                      controller.irParaQuestao(index);
                      Navigator.of(context).pop();
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: borderColor,
                          width: isCurrent ? 2.0 : 1.0,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '${index + 1}',
                            style: AppTypography.tabularDigits.copyWith(
                              fontSize: 14,
                              fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                          if (isReview)
                            Positioned(
                              top: 2,
                              right: 2,
                              child: Container(
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppColors.brandOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // Botão Inferior de Fechar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppSpacing.borderRadiusMd,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'VOLTAR AO COCKPIT',
                  style: AppTypography.buttonLabel.copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendaItem({required Color cor, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: cor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(
            fontSize: 11,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
