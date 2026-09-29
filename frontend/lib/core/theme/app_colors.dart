import 'package:flutter/material.dart';

/// Design Tokens de Cores da Operacao Aprovacao.
/// Paleta Tatica Operacional focada em ergonomia de leitura prolongada (sessoes de 4h30min).
abstract class AppColors {
  // --- Backgrounds & Superficies de Profundidade ---
  static const Color background = Color(0xFF0B0F19); // Deep Slate Charcoal (Evita o preto puro amador)
  static const Color surface = Color(0xFF131B2E); // Superficie principal de cards e modais
  static const Color surfaceElevated = Color(0xFF1E293B); // Superficie com elevacao sutil
  static const Color surfaceBorder = Color(0xFF1E293B); // Contorno discreto de 1px
  static const Color surfaceBorderSubtle = Color(0xFF334155); // Borda com hover/foco

  // --- Identidade Tatica Institucional (Seguranca Publica / Policia Civil) ---
  static const Color primary = Color(0xFF2563EB); // Navy Blue Operacional
  static const Color primaryDark = Color(0xFF1E3A8A); // Azul Policial Profundo
  static const Color primaryLight = Color(0xFF60A5FA); // Azul de Realce
  static const Color primaryGlow = Color(0x332563EB); // Glow sutil para selecao

  // --- Semantica Cebraspe (Aprovacao, Penalidade e Telemetria) ---
  static const Color success = Color(0xFF059669); // Esmeralda Tatica (Item Certo / Acerto)
  static const Color successBackground = Color(0xFF064E3B);
  static const Color successBorder = Color(0xFF10B981);

  static const Color error = Color(0xFFDC2626); // Rubi Tatico (Item Errado / Penalidade)
  static const Color errorBackground = Color(0xFF7F1D1D);
  static const Color errorBorder = Color(0xFFEF4444);

  static const Color warning = Color(0xFFD97706); // Ambar de Telemetria (Cronometro / Revisao)
  static const Color warningBackground = Color(0xFF78350F);
  static const Color warningBorder = Color(0xFFF59E0B);

  // --- Tipografia e Contrastes de Texto ---
  static const Color textPrimary = Color(0xFFF8FAFC); // Branco Gelo de Alta Legibilidade
  static const Color textSecondary = Color(0xFF94A3B8); // Cinza Neutro para Metadados e Tags
  static const Color textMuted = Color(0xFF64748B); // Cinza Escuro para Numeracoes e Divisores
  static const Color textDisabled = Color(0xFF475569);

  // --- Estados de Botoes e Interacoes ---
  static const Color buttonBlank = Color(0xFF1E293B); // Opcao "Deixar em Branco"
  static const Color buttonBlankText = Color(0xFFCBD5E1);

  // --- Identidade Oficial da Marca (Coruja Aprovada & Co-Branding) ---
  static const Color brandOrange = Color(0xFFF97316); // Laranja Quente Original (Oculos, Bico e Ponta do Peito)
  static const Color brandCobalt = Color(0xFF2563EB); // Azul Cobalto Vibrante (Capelo de Formatura e Botoes Eletricos)
  static const Color brandNavy = Color(0xFF1E3A8A); // Azul Marinho Profundo (Asas e Contorno Corporal)
  static const Color brandWhite = Color(0xFFFFFFFF); // Branco Puro (Olhos, Plumagem Central e Pingente do Capelo)
  static const Color pcpeGold = Color(0xFFD4AF37); // Dourado do Distintivo PC-PE

  // --- Aliases de Conveniência Tática ---
  static const Color border = surfaceBorder;
  static const Color accentOrange = brandOrange;
  static const Color secondary = primaryLight;
}
