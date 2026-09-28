import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../data/models/questao_model.dart';

/// Card Tatico de Resolucao de Questao Cebraspe (Modo Treino do CRAVOU).
class QuestaoCardWidget extends StatelessWidget {
  final QuestaoModel questao;
  final int index;
  final String? respostaSelecionada;
  final bool gabaritoRevelado;
  final Function(String resposta) onResponder;

  const QuestaoCardWidget({
    super.key,
    required this.questao,
    required this.index,
    required this.respostaSelecionada,
    required this.gabaritoRevelado,
    required this.onResponder,
  });

  @override
  Widget build(BuildContext context) {
    final bool foiRespondida = gabaritoRevelado && respostaSelecionada != null;
    final bool acertou = foiRespondida &&
        (respostaSelecionada!.toUpperCase() == questao.gabaritoOficial.toUpperCase());

    return TacticalCard(
      padding: EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header com Tags: Disciplina, Assunto, Orgao e Banca
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.xs,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Badge de Numero da Questao
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                  border: Border.all(color: AppColors.surfaceBorderSubtle),
                ),
                child: Text(
                  'ITEM #$index',
                  style: AppTypography.questionNumber.copyWith(
                    color: AppColors.brandOrange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              // Tag da Disciplina
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.brandCobalt.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppSpacing.radiusXs),
                  border: Border.all(color: AppColors.brandCobalt.withValues(alpha: 0.4)),
                ),
                child: Text(
                  questao.disciplina,
                  style: AppTypography.tagLabel.copyWith(
                    color: AppColors.primaryLight,
                    fontSize: 11,
                  ),
                ),
              ),

              // Tag do Assunto
              Text(
                '• ${questao.assunto}',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.md),

          // Enunciado Cebraspe de Leitura Prolongada
          Text(
            questao.enunciado,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              height: 1.6,
            ),
          ),
          SizedBox(height: AppSpacing.lg),

          // Botoes Taticos [ CERTO ] e [ ERRADO ]
          Row(
            children: [
              Expanded(
                child: _OptionButton(
                  label: '[ CERTO ]',
                  isSelected: respostaSelecionada == 'CERTO',
                  isCorrect: questao.gabaritoOficial == 'CERTO',
                  gabaritoRevelado: gabaritoRevelado,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onResponder('CERTO');
                  },
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: _OptionButton(
                  label: '[ ERRADO ]',
                  isSelected: respostaSelecionada == 'ERRADO',
                  isCorrect: questao.gabaritoOficial == 'ERRADO',
                  gabaritoRevelado: gabaritoRevelado,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onResponder('ERRADO');
                  },
                ),
              ),
            ],
          ),

          // Gabarito Comentado e Didatico (Revelado apos o clique)
          if (foiRespondida) ...[
            SizedBox(height: AppSpacing.md),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: acertou
                    ? AppColors.successBackground.withValues(alpha: 0.3)
                    : AppColors.errorBackground.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                border: Border.all(
                  color: acertou ? AppColors.successBorder : AppColors.errorBorder,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        acertou ? Icons.check_circle_rounded : Icons.cancel_rounded,
                        color: acertou ? AppColors.successBorder : AppColors.errorBorder,
                        size: 20,
                      ),
                      SizedBox(width: AppSpacing.sm),
                      Text(
                        acertou ? 'CRAVOU! VOCÊ ACERTOU!' : 'ERRADA! ATENÇÃO AO DETALHE:',
                        style: AppTypography.bodyMedium.copyWith(
                          color: acertou ? AppColors.successBorder : AppColors.errorBorder,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.xs),
                  Text(
                    questao.comentarioDidatico,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isCorrect;
  final bool gabaritoRevelado;
  final VoidCallback onTap;

  const _OptionButton({
    required this.label,
    required this.isSelected,
    required this.isCorrect,
    required this.gabaritoRevelado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.surfaceElevated;
    Color borderColor = AppColors.surfaceBorder;
    Color textColor = AppColors.textPrimary;

    if (gabaritoRevelado) {
      if (isCorrect) {
        backgroundColor = AppColors.successBackground.withValues(alpha: 0.4);
        borderColor = AppColors.successBorder;
        textColor = AppColors.successBorder;
      } else if (isSelected && !isCorrect) {
        backgroundColor = AppColors.errorBackground.withValues(alpha: 0.4);
        borderColor = AppColors.errorBorder;
        textColor = AppColors.errorBorder;
      }
    } else if (isSelected) {
      backgroundColor = AppColors.brandCobalt.withValues(alpha: 0.25);
      borderColor = AppColors.brandCobalt;
      textColor = AppColors.brandWhite;
    }

    return GestureDetector(
      onTap: gabaritoRevelado ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.buttonText.copyWith(
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
