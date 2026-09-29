import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../controllers/auth_controller.dart';

/// Tela de Alistamento Operacional de Novos Candidatos.
/// Permite selecao escalonada: primeiro o CONCURSO ALVO (PC-PE, PM-PE, PP-PE)
/// e em seguida o CARGO ALVO especifico do certame selecionado.
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
  
  // Mapa de Concursos Alvo e seus respectivos Cargos Oficiais
  static const Map<String, List<String>> _cargosPorConcurso = {
    'PC-PE': ['Agente de Polícia', 'Escrivão de Polícia', 'Delegado de Polícia'],
    'PM-PE': ['Soldado da PM', 'Oficial da PM'],
    'PP-PE': ['Policial Penal'],
  };

  String _selectedConcurso = 'PC-PE';
  String _selectedCargo = 'Agente de Polícia';
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onConcursoChanged(String concurso) {
    setState(() {
      _selectedConcurso = concurso;
      // Define automaticamente o primeiro cargo do concurso selecionado
      _selectedCargo = _cargosPorConcurso[concurso]!.first;
    });
  }

  void _handleSubmit() async {
    HapticFeedback.lightImpact();
    if (!_formKey.currentState!.validate()) return;

    if (widget.controller != null) {
      final success = await widget.controller!.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        targetCargo: '$_selectedCargo - $_selectedConcurso',
      );
      if (success && mounted) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => DashboardScreen(
              userName: _nameController.text.trim().isNotEmpty ? _nameController.text.trim() : 'Candidato CRAVOU',
              concursoAlvo: '$_selectedConcurso ($_selectedCargo)',
            ),
          ),
          (route) => false,
        );
      }
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => DashboardScreen(
            userName: _nameController.text.trim().isNotEmpty ? _nameController.text.trim() : 'Candidato CRAVOU',
            concursoAlvo: '$_selectedConcurso ($_selectedCargo)',
          ),
        ),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;
    final cargosDisponiveis = _cargosPorConcurso[_selectedConcurso] ?? [];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Alistamento de Candidato', style: AppTypography.heading3),
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
                    const Center(
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
                      'Cadastre suas credenciais para liberar simulados e treinos táticos.',
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

                          // 1º PASSO DE SELEÇÃO: CONCURSO ALVO (3 GRANDES DE PE)
                          Text(
                            'CONCURSO ALVO (PERNAMBUCO):',
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.brandOrange,
                              letterSpacing: 0.8,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Row(
                            children: [
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PC-PE',
                                  nome: 'Polícia Civil',
                                  isSelected: _selectedConcurso == 'PC-PE',
                                  onSelected: () => _onConcursoChanged('PC-PE'),
                                ),
                              ),
                              SizedBox(width: AppSpacing.xs),
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PM-PE',
                                  nome: 'Polícia Militar',
                                  isSelected: _selectedConcurso == 'PM-PE',
                                  onSelected: () => _onConcursoChanged('PM-PE'),
                                ),
                              ),
                              SizedBox(width: AppSpacing.xs),
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PP-PE',
                                  nome: 'Polícia Penal',
                                  isSelected: _selectedConcurso == 'PP-PE',
                                  onSelected: () => _onConcursoChanged('PP-PE'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: AppSpacing.md),

                          // 2º PASSO DE SELEÇÃO: CARGO ALVO DINÂMICO
                          Text(
                            'CARGO ALVO NA $_selectedConcurso:',
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          SizedBox(height: AppSpacing.xs),
                          Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.xs,
                            children: cargosDisponiveis.map((cargo) {
                              final isSelected = _selectedCargo == cargo;
                              return ChoiceChip(
                                label: Text(
                                  cargo,
                                  style: AppTypography.bodySmall.copyWith(
                                    color: isSelected ? AppColors.brandOrange : AppColors.textSecondary,
                                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (_) => setState(() => _selectedCargo = cargo),
                                backgroundColor: AppColors.background,
                                selectedColor: AppColors.brandOrange.withValues(alpha: 0.15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                  side: BorderSide(
                                    color: isSelected ? AppColors.brandOrange : AppColors.surfaceBorder,
                                    width: isSelected ? 1.8 : 1.0,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: AppSpacing.xl),

                          // Botao Primario de Acao Limpo: CONCLUIR ALISTAMENTO
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
                                      'CONCLUIR ALISTAMENTO',
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

/// Chip de Seleção de Concurso Alvo (PC-PE, PM-PE, PP-PE)
class _ConcursoChoiceChip extends StatelessWidget {
  final String sigla;
  final String nome;
  final bool isSelected;
  final VoidCallback onSelected;

  const _ConcursoChoiceChip({
    required this.sigla,
    required this.nome,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onSelected();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(vertical: AppSpacing.sm, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandOrange.withValues(alpha: 0.15) : AppColors.background,
          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
          border: Border.all(
            color: isSelected ? AppColors.brandOrange : AppColors.surfaceBorder,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              sigla,
              style: AppTypography.bodyMedium.copyWith(
                color: isSelected ? AppColors.brandOrange : AppColors.textPrimary,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              nome,
              style: AppTypography.caption.copyWith(
                fontSize: 10,
                color: isSelected ? AppColors.brandOrange : AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
