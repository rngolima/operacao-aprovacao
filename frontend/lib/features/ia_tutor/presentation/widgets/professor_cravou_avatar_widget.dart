import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';

/// Widget de Avatar Oficial do Professor CRAVOU AI.
/// Renderiza exatamente o bonequinho mascote da nossa marca (TacticalOwlLogo)
/// com capelo de formatura azul, óculos laranjas e farda tática.
class ProfessorCravouAvatarWidget extends StatelessWidget {
  final double size;
  final bool showOnlineDot;
  final bool showBorder;

  const ProfessorCravouAvatarWidget({
    super.key,
    this.size = 44,
    this.showOnlineDot = true,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFF0F7FF),
            border: showBorder
                ? Border.all(
                    color: AppColors.brandOrange,
                    width: 2.0,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: AppColors.brandNavy.withValues(alpha: 0.16),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipOval(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: size * 0.05),
                child: TacticalOwlLogo(size: size * 0.72),
              ),
            ),
          ),
        ),
        if (showOnlineDot)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size * 0.28,
              height: size * 0.28,
              decoration: BoxDecoration(
                color: const Color(0xFF16A34A),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.8),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF16A34A).withValues(alpha: 0.5),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
