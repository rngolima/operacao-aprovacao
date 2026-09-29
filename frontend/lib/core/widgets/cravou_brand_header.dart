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
  final String? concursoSigla;
  final String? subtitulo;
  final bool isCoBranded;

  const CravouBrandHeader({
    super.key,
    this.logoSize = 84.0,
    this.concursoSigla,
    this.subtitulo,
    this.isCoBranded = false,
  });

  const CravouBrandHeader.coBranded({
    super.key,
    required this.concursoSigla,
    this.subtitulo,
    this.logoSize = 28.0,
  }) : isCoBranded = true;

  @override
  Widget build(BuildContext context) {
    if (isCoBranded) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TacticalOwlLogo(size: logoSize),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTypography.heading2.copyWith(
                        fontSize: 16,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimary,
                      ),
                      children: const [
                        TextSpan(text: 'CRA'),
                        TextSpan(
                          text: 'V',
                          style: TextStyle(color: AppColors.brandOrange),
                        ),
                        TextSpan(text: 'OU'),
                      ],
                    ),
                  ),
                  if (concursoSigla != null) ...[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: Text(
                        '✕',
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.primaryLight, width: 0.8),
                      ),
                      child: Text(
                        concursoSigla!,
                        style: AppTypography.tagLabel.copyWith(
                          fontSize: 11,
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (subtitulo != null)
                Text(
                  subtitulo!,
                  style: AppTypography.tagLabel.copyWith(
                    fontSize: 9,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
            ],
          ),
        ],
      );
    }

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
