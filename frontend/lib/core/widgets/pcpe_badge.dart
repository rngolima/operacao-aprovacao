import 'package:flutter/material.dart';
import '../theme/app_typography.dart';

/// Distintivo Tatico Vetorial da Policia Civil de Pernambuco (PC-PE).
/// 
/// Renderiza o escudo dourado oficial da corporacao com inscricao
/// "POLICIA CIVIL PE" e brasao central de alto contraste.
class PcpeBadge extends StatelessWidget {
  final double size;

  const PcpeBadge({
    super.key,
    this.size = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 1.15,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(size, size * 1.15),
            painter: _PcpeBadgePainter(),
          ),
          Positioned(
            top: size * 0.14,
            child: Text(
              'POLÍCIA',
              style: AppTypography.caption.copyWith(
                fontSize: size * 0.11,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1E293B),
                letterSpacing: 1.2,
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.22,
            child: Text(
              'CIVIL',
              style: AppTypography.caption.copyWith(
                fontSize: size * 0.12,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF1E293B),
                letterSpacing: 1.5,
              ),
            ),
          ),
          Positioned(
            bottom: size * 0.10,
            child: Text(
              'PE',
              style: AppTypography.caption.copyWith(
                fontSize: size * 0.09,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF334155),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PcpeBadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Escudo Dourado Policial
    final goldGradient = const LinearGradient(
      colors: [
        Color(0xFFFFDF7A),
        Color(0xFFD4AF37),
        Color(0xFF996515),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Rect.fromLTWH(0, 0, w, h));

    final badgePaint = Paint()
      ..shader = goldGradient
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = const Color(0xFF5A3E08)
      ..strokeWidth = w * 0.03
      ..style = PaintingStyle.stroke;

    final badgePath = Path();
    badgePath.moveTo(w * 0.10, h * 0.12);
    badgePath.quadraticBezierTo(w * 0.50, h * 0.02, w * 0.90, h * 0.12);
    badgePath.lineTo(w * 0.95, h * 0.55);
    badgePath.cubicTo(w * 0.95, h * 0.80, w * 0.55, h * 0.95, w * 0.50, h * 0.98);
    badgePath.cubicTo(w * 0.45, h * 0.95, w * 0.05, h * 0.80, w * 0.05, h * 0.55);
    badgePath.close();

    canvas.drawPath(badgePath, badgePaint);
    canvas.drawPath(badgePath, borderPaint);

    // Circulo interno do Brasao do Estado
    final centerShieldPaint = Paint()
      ..color = const Color(0xFF1E3A8A)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(w * 0.50, h * 0.48), w * 0.20, centerShieldPaint);

    final innerRingPaint = Paint()
      ..color = const Color(0xFFFFDF7A)
      ..strokeWidth = w * 0.025
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(w * 0.50, h * 0.48), w * 0.18, innerRingPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
