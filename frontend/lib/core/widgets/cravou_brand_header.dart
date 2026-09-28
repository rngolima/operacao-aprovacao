import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'tactical_owl_logo.dart';

/// Header Oficial da Marca Comercial e Viral "CRAVOU".
/// 
/// Apresenta a Coruja Tatica Oficial Aprovada centralizada,
/// a marca CRAVOU com tipografia moderna de alto impacto,
/// e a assinatura de produto "Treinador Tatico de Concursos".
class CravouBrandHeader extends StatelessWidget {
  final double logoSize;

  const CravouBrandHeader({
    super.key,
    this.logoSize = 84.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Coruja Tatica Oficial Hero
        TacticalOwlLogo(size: logoSize),
        SizedBox(height: AppSpacing.md),

        // Nome Comercial e Viral: CRAVOU
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppTypography.heading1.copyWith(
              fontSize: 34,
              letterSpacing: 3.0,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
            ),
            children: [
              const TextSpan(text: 'CRA'),
              TextSpan(
                text: 'V',
                style: TextStyle(
                  color: AppColors.brandOrange,
                ),
              ),
              const TextSpan(text: 'OU'),
            ],
          ),
        ),
        SizedBox(height: AppSpacing.xxs),

        // Assinatura do Treinador Tatico
        Text(
          'Treinador Tático de Concursos',
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.sm),

        // Pill / Badge de Alta Performance
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(
              color: AppColors.surfaceBorderSubtle,
              width: 1.0,
            ),
          ),
          child: Text(
            'Simulados & Questões de Alta Performance',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
