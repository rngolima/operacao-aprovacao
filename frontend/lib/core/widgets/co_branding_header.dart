import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'pcpe_badge.dart';
import 'tactical_owl_logo.dart';

/// Header Institucional de Co-Branding Dinamico.
/// 
/// Apresenta a Logo da Operacao Aprovacao (Coruja Tatica Oficial Aprovada)
/// combinada ao distintivo do orgao alvo (PC-PE), com o separador '✕'
/// e a tipografia institucional de simulacao de concursos policiais.
class CoBrandingHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double logoSize;

  const CoBrandingHeader({
    super.key,
    this.title = 'OPERAÇÃO APROVAÇÃO',
    this.subtitle = 'Plataforma Tática de Simulação • Edital PC-PE',
    this.logoSize = 72.0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Linha com os dois logos e o separador
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TacticalOwlLogo(size: logoSize),
            SizedBox(width: AppSpacing.lg),
            Text(
              '✕',
              style: TextStyle(
                color: AppColors.textMuted.withValues(alpha: 0.6),
                fontSize: logoSize * 0.35,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(width: AppSpacing.lg),
            PcpeBadge(size: logoSize),
          ],
        ),
        SizedBox(height: AppSpacing.lg),
        
        // Titulo Master em Caixa Alta
        Text(
          title,
          style: AppTypography.heading1.copyWith(
            letterSpacing: 2.0,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppSpacing.xs),

        // Pill / Badge de Subtitulo Operacional
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: AppColors.brandOrange.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            border: Border.all(
              color: AppColors.brandOrange.withValues(alpha: 0.35),
              width: 1.0,
            ),
          ),
          child: Text(
            subtitle,
            style: AppTypography.caption.copyWith(
              color: AppColors.brandOrange,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
