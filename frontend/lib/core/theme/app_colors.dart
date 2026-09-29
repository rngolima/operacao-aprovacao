import 'package:flutter/material.dart';

/// Design Tokens de Cores do CRAVOU.
/// Paleta Editorial Clean inspirada nas melhores plataformas educacionais (QConcursos).
/// Fundo limpo, alta legibilidade e elementos da marca CRAVOU (Azul Cobalto e Laranja Quente).
abstract class AppColors {
  // --- Backgrounds & Superfícies Editoriais Limpas (Estilo QConcursos) ---
  static const Color background = Color(0xFFF8F9FA); // Off-White / Slate Suave (Conforto visual prolongado)
  static const Color surface = Color(0xFFFFFFFF); // Branco Puro para cards e áreas de conteúdo
  static const Color surfaceElevated = Color(0xFFF1F5F9); // Cinza muito claro para filtros e inputs
  static const Color surfaceBorder = Color(0xFFE2E8F0); // Borda sutil de 1px
  static const Color surfaceBorderSubtle = Color(0xFFCBD5E1); // Borda de foco

  // --- Identidade Oficial CRAVOU (Azul Institucional & Laranja Quente) ---
  static const Color primary = Color(0xFF2563EB); // Azul Cobalto Vibrante
  static const Color primaryDark = Color(0xFF1E3A8A); // Azul Marinho Profundo
  static const Color primaryLight = Color(0xFF3B82F6); // Azul de Realce
  static const Color primaryGlow = Color(0x1A2563EB);

  // --- Semântica Cebraspe (Aprovação, Penalidade e Telemetria) ---
  static const Color success = Color(0xFF059669); // Esmeralda (Item Certo / Acerto)
  static const Color successBackground = Color(0xFFECFDF5); // Fundo verde suave para comentários
  static const Color successBorder = Color(0xFF10B981);

  static const Color error = Color(0xFFDC2626); // Rubi (Item Errado / Penalidade)
  static const Color errorBackground = Color(0xFFFEF2F2); // Fundo vermelho suave
  static const Color errorBorder = Color(0xFFEF4444);

  static const Color warning = Color(0xFFD97706); // Âmbar (Cronômetro / Revisão)
  static const Color warningBackground = Color(0xFFFFFBEB); // Fundo âmbar suave
  static const Color warningBorder = Color(0xFFF59E0B);

  // --- Tipografia e Contrastes de Texto Editoriais ---
  static const Color textPrimary = Color(0xFF0F172A); // Grafite Escuro de Altíssima Legibilidade
  static const Color textSecondary = Color(0xFF475569); // Cinza Médio para Metadados e Tags
  static const Color textMuted = Color(0xFF94A3B8); // Cinza Claro para Divisores
  static const Color textDisabled = Color(0xFFCBD5E1);

  // --- Estados de Botões e Interações ---
  static const Color buttonBlank = Color(0xFFF1F5F9); // Opção "Deixar em Branco"
  static const Color buttonBlankText = Color(0xFF475569);

  // --- Identidade Oficial da Marca (Coruja Aprovada & Co-Branding) ---
  static const Color brandOrange = Color(0xFFF97316); // Laranja Quente Original (Óculos, Bico e Ponta do Peito)
  static const Color brandCobalt = Color(0xFF2563EB); // Azul Cobalto Vibrante (Capelo de Formatura e Botões)
  static const Color brandNavy = Color(0xFF1E3A8A); // Azul Marinho Profundo (Asas e Contorno)
  static const Color brandWhite = Color(0xFFFFFFFF); // Branco Puro
  static const Color pcpeGold = Color(0xFFD4AF37); // Dourado do Distintivo PC-PE

  // --- Aliases de Conveniência Tática ---
  static const Color border = surfaceBorder;
  static const Color accentOrange = brandOrange;
  static const Color secondary = primaryLight;
}
