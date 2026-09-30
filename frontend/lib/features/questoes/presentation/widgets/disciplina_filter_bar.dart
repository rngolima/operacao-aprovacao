import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
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

  void _abrirSeletorDisciplinas(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Disciplinas do Concurso',
                      style: AppTypography.heading3.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: disciplinas.length,
                  itemBuilder: (context, index) {
                    final item = disciplinas[index];
                    final bool isSelected = item.nome == disciplinaSelecionada;
                    return ListTile(
                      leading: Text(item.icone, style: const TextStyle(fontSize: 20)),
                      title: Text(
                        item.nome,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                          color: isSelected ? AppColors.brandCobalt : AppColors.textPrimary,
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.brandCobalt.withValues(alpha: 0.1)
                              : AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${item.totalQuestoes} itens',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? AppColors.brandCobalt : AppColors.textSecondary,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(ctx);
                        onSelecionar(item.nome);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: [
          // Botão Rápido de Menu Completo de Disciplinas
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _abrirSeletorDisciplinas(context),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 38,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.surfaceBorder),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.tune_rounded, size: 16, color: AppColors.brandNavy),
                      const SizedBox(width: 4),
                      Text(
                        'Matérias',
                        style: AppTypography.tagLabel.copyWith(
                          color: AppColors.brandNavy,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 8),

          // Chips com Rolagem Horizontal Suave
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(right: 16),
              itemCount: disciplinas.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final item = disciplinas[index];
                final bool isSelected = item.nome == disciplinaSelecionada;

                return GestureDetector(
                  onTap: () => onSelecionar(item.nome),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.brandOrange.withValues(alpha: 0.15)
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? AppColors.brandOrange : AppColors.surfaceBorder,
                        width: isSelected ? 1.8 : 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(item.icone, style: const TextStyle(fontSize: 13)),
                        const SizedBox(width: 6),
                        Text(
                          item.nome,
                          style: AppTypography.bodySmall.copyWith(
                            color: isSelected ? AppColors.brandOrange : AppColors.textSecondary,
                            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
