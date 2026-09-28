import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Grade compacta horizontal ou em grid para salto rapido entre as questoes da prova.
class QuestionNavigatorGrid extends StatelessWidget {
  final int totalQuestions;
  final int currentIndex;
  final Set<int> answeredIndices;
  final Function(int index) onSelectQuestion;

  const QuestionNavigatorGrid({
    super.key,
    required this.totalQuestions,
    required this.currentIndex,
    required this.answeredIndices,
    required this.onSelectQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: totalQuestions,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final isCurrent = index == currentIndex;
          final isAnswered = answeredIndices.contains(index);

          Color bgColor = AppColors.surface;
          Color borderColor = AppColors.surfaceBorder;
          Color textColor = AppColors.textSecondary;

          if (isCurrent) {
            borderColor = AppColors.primaryLight;
            textColor = Colors.white;
            bgColor = AppColors.primaryDark;
          } else if (isAnswered) {
            bgColor = AppColors.successBackground.withValues(alpha: 0.4);
            borderColor = AppColors.successBorder;
            textColor = AppColors.successBorder;
          }

          return InkWell(
            onTap: () => onSelectQuestion(index),
            borderRadius: AppSpacing.borderRadiusSm,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: AppSpacing.borderRadiusSm,
                border: Border.all(
                  color: borderColor,
                  width: isCurrent ? 2.0 : 1.0,
                ),
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: AppTypography.questionNumber.copyWith(
                    color: textColor,
                    fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
