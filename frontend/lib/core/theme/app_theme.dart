import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Configuração do Tema Oficial do CRAVOU (Estilo Clean Editorial / QConcursos).
abstract class AppTheme {
  /// Tema Claro Primário: Fundo suave, cards brancos e alta ergonomia de leitura
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.brandOrange,
        surface: AppColors.surface,
        error: AppColors.error,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),

      // AppBar Editorial Limpa
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        centerTitle: false,
        scrolledUnderElevation: 0.5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.surface,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: AppTypography.headlineMedium.copyWith(
          color: AppColors.textPrimary,
        ),
      ),

      // Cards Brancos com Sombra Suave
      cardTheme: const CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          side: BorderSide(color: AppColors.surfaceBorder, width: 1.0),
        ),
      ),

      // Inputs de Formulários
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceElevated,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.surfaceBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.surfaceBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          borderSide: const BorderSide(color: AppColors.brandCobalt, width: 1.5),
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
      ),

      // Divisores Sutis
      dividerTheme: const DividerThemeData(
        color: AppColors.surfaceBorder,
        thickness: 1.0,
        space: 1.0,
      ),
    );
  }

  /// Alias de conveniência
  static ThemeData get darkTheme => lightTheme;
}
