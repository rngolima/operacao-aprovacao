import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Widget Vetorial de Alta Precisao da Logo Oficial da Operacao Aprovacao.
/// 
/// Renderiza a Coruja Minimalista Geometrica Aprovada (Opcao 1):
/// - Capelo de Formatura em Azul Cobalto Vibrante ([AppColors.brandCobalt]).
/// - Pingente / Borla do Capelo em Branco Puro ([AppColors.brandWhite]).
/// - Armacao dos Oculos Tatica em Laranja Quente Original ([AppColors.brandOrange]).
/// - Olhos Focados com Esclera em Branco Puro e Pupila Escura.
/// - Peito Central / Plumagem em Branco Puro.
/// - Ponta Inferior do Peito em Laranja Quente.
/// - Corpo e Asas em Azul Marinho Profundo ([AppColors.brandNavy]).
class TacticalOwlLogo extends StatelessWidget {
  final double size;

  const TacticalOwlLogo({
    super.key,
    this.size = 80.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 1.15,
      child: CustomPaint(
        painter: _TacticalOwlPainter(),
      ),
    );
  }
}

class _TacticalOwlPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final navyPaint = Paint()
      ..color = AppColors.brandNavy
      ..style = PaintingStyle.fill;

    final cobaltPaint = Paint()
      ..color = AppColors.brandCobalt
      ..style = PaintingStyle.fill;

    final orangePaint = Paint()
      ..color = AppColors.brandOrange
      ..style = PaintingStyle.fill;

    final whitePaint = Paint()
      ..color = AppColors.brandWhite
      ..style = PaintingStyle.fill;

    final darkEyePaint = Paint()
      ..color = const Color(0xFF070B14)
      ..style = PaintingStyle.fill;

    // 1. Corpo e Asas (Base da Coruja - Formato escudo/silhueta)
    final bodyPath = Path();
    bodyPath.moveTo(w * 0.15, h * 0.40);
    bodyPath.cubicTo(w * 0.05, h * 0.60, w * 0.10, h * 0.85, w * 0.50, h * 0.98);
    bodyPath.cubicTo(w * 0.90, h * 0.85, w * 0.95, h * 0.60, w * 0.85, h * 0.40);
    bodyPath.close();
    canvas.drawPath(bodyPath, navyPaint);

    // Detalhe das asas externas em Azul Cobalto
    final leftWingPath = Path()
      ..moveTo(w * 0.15, h * 0.45)
      ..cubicTo(w * 0.08, h * 0.65, w * 0.18, h * 0.80, w * 0.32, h * 0.88)
      ..cubicTo(w * 0.22, h * 0.75, w * 0.20, h * 0.60, w * 0.25, h * 0.48)
      ..close();
    canvas.drawPath(leftWingPath, cobaltPaint);

    final rightWingPath = Path()
      ..moveTo(w * 0.85, h * 0.45)
      ..cubicTo(w * 0.92, h * 0.65, w * 0.82, h * 0.80, w * 0.68, h * 0.88)
      ..cubicTo(w * 0.78, h * 0.75, w * 0.80, h * 0.60, w * 0.75, h * 0.48)
      ..close();
    canvas.drawPath(rightWingPath, cobaltPaint);

    // 2. Peito Central / Plumagem em Branco Puro
    final chestPath = Path();
    chestPath.moveTo(w * 0.35, h * 0.52);
    chestPath.lineTo(w * 0.65, h * 0.52);
    chestPath.lineTo(w * 0.50, h * 0.88);
    chestPath.close();
    canvas.drawPath(chestPath, whitePaint);

    // 3. Pontinha do Final do Peito em Laranja Quente (Decisao do Fundador)
    final chestTipPath = Path();
    chestTipPath.moveTo(w * 0.44, h * 0.80);
    chestTipPath.lineTo(w * 0.56, h * 0.80);
    chestTipPath.lineTo(w * 0.50, h * 0.92);
    chestTipPath.close();
    canvas.drawPath(chestTipPath, orangePaint);

    // 4. Armacao dos Oculos Tatica em Laranja Quente (Aro duplo marcante)
    final leftEyeCenter = Offset(w * 0.34, h * 0.42);
    final rightEyeCenter = Offset(w * 0.66, h * 0.42);
    final eyeRadius = w * 0.16;

    // Aro Laranja
    canvas.drawCircle(leftEyeCenter, eyeRadius, orangePaint);
    canvas.drawCircle(rightEyeCenter, eyeRadius, orangePaint);

    // Ponte dos oculos conectando os dois olhos
    final bridgePaint = Paint()
      ..color = AppColors.brandOrange
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(leftEyeCenter, rightEyeCenter, bridgePaint);

    // 5. Olhos em Branco Puro (Esclera)
    final innerEyeRadius = eyeRadius * 0.76;
    canvas.drawCircle(leftEyeCenter, innerEyeRadius, whitePaint);
    canvas.drawCircle(rightEyeCenter, innerEyeRadius, whitePaint);

    // Pupilas Negras Focadas no Concurso
    final pupilRadius = innerEyeRadius * 0.55;
    canvas.drawCircle(leftEyeCenter, pupilRadius, darkEyePaint);
    canvas.drawCircle(rightEyeCenter, pupilRadius, darkEyePaint);

    // Brilho nos olhos (Spotlight de atencao)
    final shineRadius = pupilRadius * 0.35;
    canvas.drawCircle(
      Offset(leftEyeCenter.dx + pupilRadius * 0.3, leftEyeCenter.dy - pupilRadius * 0.3),
      shineRadius,
      whitePaint,
    );
    canvas.drawCircle(
      Offset(rightEyeCenter.dx + pupilRadius * 0.3, rightEyeCenter.dy - pupilRadius * 0.3),
      shineRadius,
      whitePaint,
    );

    // 6. Bico da Coruja em Laranja Quente
    final beakPath = Path();
    beakPath.moveTo(w * 0.45, h * 0.46);
    beakPath.lineTo(w * 0.55, h * 0.46);
    beakPath.lineTo(w * 0.50, h * 0.55);
    beakPath.close();
    canvas.drawPath(beakPath, orangePaint);

    // 7. Capelo de Formatura (Mortarboard) em Azul Cobalto
    final capPath = Path();
    capPath.moveTo(w * 0.50, h * 0.05); // Topo
    capPath.lineTo(w * 0.90, h * 0.18); // Direita
    capPath.lineTo(w * 0.50, h * 0.28); // Fundo
    capPath.lineTo(w * 0.10, h * 0.18); // Esquerda
    capPath.close();
    canvas.drawPath(capPath, cobaltPaint);

    // Base inferior do capelo (Aba que encaixa na cabeca)
    final capBase = Path();
    capBase.moveTo(w * 0.28, h * 0.23);
    capBase.quadraticBezierTo(w * 0.50, h * 0.30, w * 0.72, h * 0.23);
    capBase.lineTo(w * 0.70, h * 0.28);
    capBase.quadraticBezierTo(w * 0.50, h * 0.34, w * 0.30, h * 0.28);
    capBase.close();
    canvas.drawPath(capBase, navyPaint);

    // 8. Pingente / Borla (Tassel) Pendurada do Capelo em Branco Puro
    final tasselStringPaint = Paint()
      ..color = AppColors.brandWhite
      ..strokeWidth = w * 0.025
      ..strokeCap = StrokeCap.round;

    // Fio da borla descendo pelo lado esquerdo
    final tasselPath = Path();
    tasselPath.moveTo(w * 0.50, h * 0.17); // Centro do losango
    tasselPath.lineTo(w * 0.14, h * 0.19); // Borda esquerda
    tasselPath.lineTo(w * 0.12, h * 0.32); // Caindo
    canvas.drawPath(tasselPath, tasselStringPaint);

    // Franja / Pingente da borla em Branco Puro
    final tasselDropPath = Path();
    tasselDropPath.moveTo(w * 0.09, h * 0.32);
    tasselDropPath.lineTo(w * 0.15, h * 0.32);
    tasselDropPath.lineTo(w * 0.17, h * 0.40);
    tasselDropPath.lineTo(w * 0.07, h * 0.40);
    tasselDropPath.close();
    canvas.drawPath(tasselDropPath, whitePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
