import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Card Editorial Clean com borda sutil de 1px e sombra suave profissional (Estilo QConcursos).
class TacticalCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;

  const TacticalCard({
    super.key,
    required this.child,
    this.padding = AppSpacing.cardPadding,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: AppSpacing.borderRadiusMd,
        border: Border.all(
          color: borderColor ?? AppColors.surfaceBorder,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
