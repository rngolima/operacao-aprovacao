import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/models/disciplina_model.dart';

/// Barra de Filtros de Disciplinas do CRAVOU.
class DisciplinaFilterBar extends StatelessWidget {
  final List<DisciplinaModel> disciplinas;
  final String disciplinaSelecionada;
  final Function(String disciplina) onSelecionar;

  const DisciplinaFilterBar({
    super.key,
    required this.disciplinas,
    required this.disciplinaSelecionada,
    required this.onSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        itemCount: disciplinas.length,
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) {
          final item = disciplinas[index];
          final bool isSelected = item.nome == disciplinaSelecionada;

          return GestureDetector(
            onTap: () => onSelecionar(item.nome),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.xs,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.brandOrange.withValues(alpha: 0.15)
                    : AppColors.surface,
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                border: Border.all(
                  color: isSelected ? AppColors.brandOrange : AppColors.surfaceBorder,
                  width: isSelected ? 1.8 : 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.icone, style: const TextStyle(fontSize: 14)),
                  SizedBox(width: AppSpacing.xs),
                  Text(
                    item.nome,
                    style: AppTypography.bodySmall.copyWith(
                      color: isSelected ? AppColors.brandOrange : AppColors.textSecondary,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
