import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Design Tokens de Tipografia da Operacao Aprovacao.
/// Escala tipografica tecnica com Inter para enunciados e JetBrains Mono para cronometro.
abstract class AppTypography {
  // --- Titulos & Headlines ---
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
        height: 1.3,
      );

  // --- Subtitulos & Metadados ---
  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get tagLabel => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryLight,
        letterSpacing: 0.8,
      );

  // --- Corpo de Texto (Enunciados Longos de 4h30min de Prova) ---
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.6, // Altura de linha ergonômica para evitar cansaço visual
        letterSpacing: -0.1,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.4,
      );

  // --- Botoes de Acao ---
  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.5,
      );

  // --- Tipografia Monoespacada Tabular (Cronometro & Telemetria) ---
  // Impede que os algarismos fiquem "dançando" na tela a cada segundo
  static TextStyle get timerCountdown => GoogleFonts.jetBrainsMono(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: AppColors.warning,
        letterSpacing: 0.5,
      );

  static TextStyle get questionNumber => GoogleFonts.jetBrainsMono(
        fontSize: 13,
        fontWeight: FontWeight.w600,
      );

  // --- Aliases Semanticos de Conveniencia ---
  static TextStyle get heading1 => headlineLarge;
  static TextStyle get heading2 => headlineMedium;
  static TextStyle get heading3 => titleMedium;
  static TextStyle get caption => bodySmall;
  static TextStyle get button => buttonText;
}
