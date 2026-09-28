import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

/// Badge de Cronometro Regressivo com tipografia monoespacada tabular.
/// Impede que os numeros "pulem" na tela a cada segundo.
class TimerBadge extends StatelessWidget {
  final String formattedTime;
  final bool isCritical;

  const TimerBadge({
    super.key,
    required this.formattedTime,
    this.isCritical = false,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isCritical ? AppColors.errorBorder : AppColors.warningBorder;
    final backgroundColor = isCritical ? AppColors.errorBackground.withValues(alpha: 0.3) : AppColors.warningBackground.withValues(alpha: 0.3);
    final textColor = isCritical ? AppColors.error : AppColors.warning;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppSpacing.borderRadiusSm,
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, size: 16, color: textColor),
          const SizedBox(width: AppSpacing.xs),
          Text(
            formattedTime,
            style: AppTypography.timerCountdown.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
