import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

enum CebraspeOptionType { certo, errado, emBranco }

/// Botao Tatico Cebraspe para marcacao rapida com feedback haptico e estado ativo.
class CebraspeButton extends StatelessWidget {
  final CebraspeOptionType type;
  final bool isSelected;
  final VoidCallback onTap;

  const CebraspeButton({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CebraspeOptionType.certo:
        return _buildButton(
          title: '[ CERTO ]',
          icon: Icons.check_circle_outline,
          baseColor: AppColors.success,
          borderColor: isSelected ? AppColors.successBorder : AppColors.success.withValues(alpha: 0.3),
          backgroundColor: isSelected ? AppColors.successBackground.withValues(alpha: 0.5) : AppColors.surface,
          glow: isSelected,
        );
      case CebraspeOptionType.errado:
        return _buildButton(
          title: '[ ERRADO ]',
          icon: Icons.cancel_outlined,
          baseColor: AppColors.error,
          borderColor: isSelected ? AppColors.errorBorder : AppColors.error.withValues(alpha: 0.3),
          backgroundColor: isSelected ? AppColors.errorBackground.withValues(alpha: 0.5) : AppColors.surface,
          glow: isSelected,
        );
      case CebraspeOptionType.emBranco:
        return _buildBlankButton();
    }
  }

  Widget _buildButton({
    required String title,
    required IconData icon,
    required Color baseColor,
    required Color borderColor,
    required Color backgroundColor,
    required bool glow,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            HapticFeedback.lightImpact();
            onTap();
          },
          borderRadius: AppSpacing.borderRadiusSm,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: AppSpacing.borderRadiusSm,
              border: Border.all(color: borderColor, width: glow ? 2.0 : 1.0),
              boxShadow: glow
                  ? [
                      BoxShadow(
                        color: baseColor.withValues(alpha: 0.2),
                        blurRadius: 8.0,
                        spreadRadius: 1.0,
                      )
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20, color: isSelected ? baseColor : AppColors.textSecondary),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  title,
                  style: AppTypography.buttonText.copyWith(
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlankButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap();
        },
        borderRadius: AppSpacing.borderRadiusSm,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.surfaceElevated : Colors.transparent,
            borderRadius: AppSpacing.borderRadiusSm,
            border: Border.all(
              color: isSelected ? AppColors.primaryLight : AppColors.surfaceBorder,
              width: 1.0,
            ),
          ),
          child: Center(
            child: Text(
              '[ Deixar em Branco / Abstenção ]',
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.primaryLight : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
