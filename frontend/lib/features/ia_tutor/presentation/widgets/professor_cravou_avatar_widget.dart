import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget de Avatar do Professor CRAVOU AI.
/// Exibe a imagem oficial da Coruja Mentora Tática com óculos laranjas e farda.
/// Possui fallback elegante para ícone vetorial estilizado e ponto pulsante de status online.
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
            border: showBorder
                ? Border.all(
                    color: AppColors.brandOrange,
                    width: 2.0,
                  )
                : null,
            boxShadow: [
              BoxShadow(
                color: AppColors.brandNavy.withValues(alpha: 0.18),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/professor_cravou_avatar.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => _buildFallbackVectorAvatar(),
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

  Widget _buildFallbackVectorAvatar() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1E3A8A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.psychology_rounded,
          color: AppColors.brandOrange,
          size: size * 0.55,
        ),
      ),
    );
  }
}
