import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cravou_brand_header.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../simulado/presentation/screens/simulado_cockpit_screen.dart';
import '../controllers/auth_controller.dart';
import 'register_screen.dart';

/// Tela de Autenticacao Oficial do Aplicativo "CRAVOU".
/// Implementa a identidade master com a Coruja Oficial e marca viral para lojas Google/Apple.
class LoginScreen extends StatefulWidget {
  final AuthController? controller;

  const LoginScreen({
    super.key,
    this.controller,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    HapticFeedback.lightImpact();
    if (!_formKey.currentState!.validate()) return;

    if (widget.controller != null) {
      final success = await widget.controller!.login(
        _emailController.text,
        _passwordController.text,
      );
      if (success && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => const SimuladoCockpitScreen(),
          ),
        );
      }
    } else {
      // Modo de demonstracao direta caso controller nao esteja injetado
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const SimuladoCockpitScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.lg,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header Oficial CRAVOU com a Coruja Aprovada
                    const CravouBrandHeader(logoSize: 84.0),
                    SizedBox(height: AppSpacing.xl),

                    // Exibicao de Erro da API, se houver
                    if (controller?.errorMessage != null) ...[
                      Container(
                        padding: EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.errorBackground.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                          border: Border.all(color: AppColors.errorBorder),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.error_outline_rounded,
                              color: AppColors.errorBorder,
                              size: 20,
                            ),
                            SizedBox(width: AppSpacing.sm),
                            Expanded(
                              child: Text(
                                controller!.errorMessage!,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.lg),
                    ],

                    // Card Tatico de Entrada de Credenciais
                    TacticalCard(
                      padding: EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Campo: E-mail ou Matricula
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'E-mail ou Matrícula',
                              labelStyle: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              prefixIcon: const Icon(
                                Icons.person_outline_rounded,
                                color: AppColors.textSecondary,
                                size: 20,
                              ),
                              filled: true,
                              fillColor: AppColors.background,
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
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Informe o e-mail cadastrado.';
                              }
                              if (!value.contains('@')) {
                                return 'Informe um e-mail valido.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppSpacing.lg),

                          // Campo: Senha
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'Senha de Acesso',
                              labelStyle: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.textSecondary,
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: AppColors.background,
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
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Informe sua senha de acesso.';
                              }
                              if (value.length < 6) {
                                return 'A senha deve ter no minimo 6 caracteres.';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: AppSpacing.xl),

                          // Botao Primario de Alto Contraste: [ ACESSAR COCKPIT ]
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: controller?.isLoading == true ? null : _handleSubmit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.brandCobalt,
                                foregroundColor: AppColors.brandWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                ),
                                elevation: 0,
                              ),
                              child: controller?.isLoading == true
                                  ? const SizedBox(
                                      width: 22,
                                      height: 22,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.2,
                                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.brandWhite),
                                      ),
                                    )
                                  : Text(
                                      '[ ENTRAR NO CRAVOU ]',
                                      style: AppTypography.button.copyWith(
                                        color: AppColors.brandWhite,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                            ),
                          ),
                          SizedBox(height: AppSpacing.md),

                          // Link Esqueci minha senha
                          Center(
                            child: TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Procedimento de recuperacao enviado para a central.'),
                                  ),
                                );
                              },
                              child: Text(
                                'Esqueci minha senha',
                                style: AppTypography.caption.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: AppSpacing.xl),

                    // Rodape: Link para Registro com Wrap responsivo
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          'Ainda não é aluno? ',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(controller: widget.controller),
                              ),
                            );
                          },
                          child: Text(
                            'Criar Conta Grátis',
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.brandOrange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
