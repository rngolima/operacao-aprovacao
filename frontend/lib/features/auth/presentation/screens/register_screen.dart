import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../simulado/presentation/screens/simulado_cockpit_screen.dart';
import '../controllers/auth_controller.dart';

/// Tela de Cadastro Operacional de Novos Candidatos.
/// Permite selecao de cargo alvo (Agente vs Escrivao PC-PE) e registro de conta.
class RegisterScreen extends StatefulWidget {
  final AuthController? controller;

  const RegisterScreen({
    super.key,
    this.controller,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _selectedCargo = 'Agente de Polícia';
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSubmit() async {
    HapticFeedback.lightImpact();
    if (!_formKey.currentState!.validate()) return;

    if (widget.controller != null) {
      final success = await widget.controller!.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        targetCargo: _selectedCargo,
      );
      if (success && mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const SimuladoCockpitScreen(),
          ),
          (route) => false,
        );
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const SimuladoCockpitScreen(),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Cadastro Operacional', style: AppTypography.heading3),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.md,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Icone da Marca Centralizado
                    Center(
                      child: TacticalOwlLogo(size: 64.0),
                    ),
                    SizedBox(height: AppSpacing.md),

                    Text(
                      'ALISTAMENTO DE CANDIDATO',
                      style: AppTypography.heading2.copyWith(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSpacing.xs),
                    Text(
                      'Preencha seus dados para liberar acesso aos simulados oficiais PC-PE.',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: AppSpacing.xl),

                    // Card de Cadastro
                    TacticalCard(
                      padding: EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Nome Completo
                          TextFormField(
                            controller: _nameController,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'Nome Completo do Aluno',
                              labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.badge_outlined, color: AppColors.textSecondary, size: 20),
                              filled: true,
                              fillColor: AppColors.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe seu nome completo.' : null,
                          ),
                          SizedBox(height: AppSpacing.md),

                          // E-mail
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'E-mail Operacional',
                              labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.textSecondary, size: 20),
                              filled: true,
                              fillColor: AppColors.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || !v.contains('@')) ? 'Informe um e-mail valido.' : null,
                          ),
                          SizedBox(height: AppSpacing.md),

                          // Senha
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: AppTypography.bodyMedium,
                            decoration: InputDecoration(
                              labelText: 'Criar Senha de Acesso (min 6 digitos)',
                              labelStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.textSecondary, size: 20),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              filled: true,
                              fillColor: AppColors.background,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || v.length < 6) ? 'A senha deve ter no minimo 6 caracteres.' : null,
                          ),
                          SizedBox(height: AppSpacing.lg),

                          // Seletor de Cargo Alvo (PC-PE)
                          Text(
                            'CARGO ALVO:',
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Row(
                            children: [
                              Expanded(
                                child: _CargoChoiceChip(
                                  label: 'Agente PC-PE',
                                  isSelected: _selectedCargo == 'Agente de Polícia',
                                  onSelected: () => setState(() => _selectedCargo = 'Agente de Polícia'),
                                ),
                              ),
                              SizedBox(width: AppSpacing.sm),
                              Expanded(
                                child: _CargoChoiceChip(
                                  label: 'Escrivão PC-PE',
                                  isSelected: _selectedCargo == 'Escrivão de Polícia',
                                  onSelected: () => setState(() => _selectedCargo = 'Escrivão de Polícia'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSpacing.xl),

                          // Botao [ CRIAR CREDENCIAL ]
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
                                      '[ CRIAR CREDENCIAL ]',
                                      style: AppTypography.button.copyWith(
                                        color: AppColors.brandWhite,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
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

class _CargoChoiceChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const _CargoChoiceChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandOrange.withValues(alpha: 0.15) : AppColors.background,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.brandOrange : AppColors.surfaceBorder,
            width: isSelected ? 1.8 : 1.0,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTypography.bodySmall.copyWith(
              color: isSelected ? AppColors.brandOrange : AppColors.textSecondary,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
