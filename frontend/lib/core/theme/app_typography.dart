import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Design Tokens de Tipografia da Operacao Aprovacao / CRAVOU.
/// Escala tipografica otimizada para conforto visual, alta legibilidade em celulares
/// e sessoes longas de estudo com enunciados extensos.
abstract class AppTypography {
  // --- Titulos & Headlines ---
  static TextStyle get headlineLarge => GoogleFonts.inter(
        fontSize: 25,
        fontWeight: FontWeight.w800,
        color: AppColors.textPrimary,
        letterSpacing: -0.5,
        height: 1.3,
      );

  static TextStyle get headlineMedium => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        letterSpacing: -0.3,
        height: 1.3,
      );

  // --- Subtitulos & Metadados ---
  static TextStyle get titleMedium => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.4,
      );

  static TextStyle get tagLabel => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryLight,
        letterSpacing: 0.8,
      );

  // --- Corpo de Texto (Enunciados Longos e Leitura Confortavel) ---
  static TextStyle get bodyLarge => GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
        height: 1.6, // Altura de linha ergonômica para evitar cansaço visual
        letterSpacing: -0.1,
      );

  static TextStyle get bodyMedium => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle get bodySmall => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.45,
      );

  // --- Botoes de Acao ---
  static TextStyle get buttonText => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.5,
      );

  // --- Tipografia Monoespacada Tabular (Cronometro & Telemetria) ---
  static TextStyle get timerCountdown => GoogleFonts.jetBrainsMono(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.warning,
        letterSpacing: 0.5,
      );

  static TextStyle get questionNumber => GoogleFonts.jetBrainsMono(
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );

  // --- Aliases Semanticos de Conveniencia ---
  static TextStyle get heading1 => headlineLarge;
  static TextStyle get heading2 => headlineMedium;
  static TextStyle get heading3 => titleMedium;
  static TextStyle get caption => bodySmall;
  static TextStyle get button => buttonText;
  static TextStyle get buttonLabel => buttonText;
  static TextStyle get tabularDigits => questionNumber;
  static TextStyle get displayLarge => GoogleFonts.inter(
        fontSize: 42,
        fontWeight: FontWeight.w900,
        color: AppColors.textPrimary,
        letterSpacing: -1.0,
      );
}
