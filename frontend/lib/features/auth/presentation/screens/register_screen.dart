import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../controllers/auth_controller.dart';

/// Tela de Alistamento Operacional de Novos Candidatos.
/// Permite seleção direcionada: CONCURSO ALVO (com alerta máximo no edital da PM-PE)
/// e CARGO ALVO específico do certame selecionado.
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
    'PM-PE': ['Soldado da PM', 'Oficial da PM'],
    'PC-PE': ['Agente de Polícia', 'Escrivão de Polícia', 'Delegado de Polícia'],
    'PP-PE': ['Policial Penal'],
  };

  // PM-PE como concurso padrão prioritário (Edital Publicado na madrugada!)
  String _selectedConcurso = 'PM-PE';
  String _selectedCargo = 'Soldado da PM';
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
      _selectedCargo = _cargosPorConcurso[concurso]!.first;
    });
  }

  void _handleSubmit() async {
    HapticFeedback.lightImpact();
    if (!_formKey.currentState!.validate()) return;

    final alunoNome = _nameController.text.trim().isNotEmpty
        ? _nameController.text.trim()
        : 'Candidato CRAVOU';

    final isPmpe = _selectedConcurso == 'PM-PE';
    final isPppe = _selectedConcurso == 'PP-PE';

    // 1. Sincroniza o concurso alvo e cargo selecionados no estado global do aluno
    PlanoEstudoState.instance.atualizarPlano(
      concursoAlvo: isPmpe
          ? 'PM-PE (Polícia Militar de Pernambuco)'
          : isPppe
              ? 'PP-PE (Polícia Penal de Pernambuco)'
              : 'PC-PE (Polícia Civil de Pernambuco)',
      cargoAlvo: _selectedCargo,
      banca: isPmpe ? 'Instituto IAUPE / AOCP' : 'Cebraspe',
      nomeArquivo: isPmpe ? 'edital_abertura_pmpe_oficial.pdf' : null,
      tamanhoArquivo: isPmpe ? '1.8 MB' : null,
      horasPorDia: 3,
      semanasAteProva: isPmpe ? 10 : 12,
      disciplinas: isPmpe
          ? [
              'Língua Portuguesa',
              'História de Pernambuco',
              'Geografia de Pernambuco',
              'Matemática e Raciocínio Lógico',
              'Noções de Direito Constitucional & Legislação da PMPE',
            ]
          : isPppe
              ? [
                  'Língua Portuguesa',
                  'Legislação Penitenciária (LEP - Lei 7.210/84)',
                  'Direitos Humanos & Cidadania',
                  'Noções de Direito Penal & Processual Penal',
                  'Noções de Direito Administrativo',
                ]
              : [
                  'Língua Portuguesa',
                  'Noções de Direito Penal',
                  'Noções de Direito Processual Penal',
                  'Noções de Direito Constitucional',
                  'Noções de Direito Administrativo',
                  'Informática e RLM',
                ],
    );

    // 2. Tenta autenticar na API se houver backend, com fallback gracioso para não travar o teste
    if (widget.controller != null) {
      try {
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
                userName: alunoNome,
                concursoAlvo: '$_selectedConcurso ($_selectedCargo)',
              ),
            ),
            (route) => false,
          );
          return;
        }
      } catch (_) {
        // Fallback para modo offline/demonstração
      }
    }

    // Acesso direto com o curso e cargo configurados
    if (mounted) {
      widget.controller?.clearError();
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => DashboardScreen(
            userName: alunoNome,
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
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.xs,
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Logo Heroica Grandiosa (104px)
                    const Center(
                      child: TacticalOwlLogo(size: 104.0),
                    ),
                    const SizedBox(height: 12),

                    // Marca CRAVOU
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppTypography.heading1.copyWith(
                          fontSize: 32,
                          letterSpacing: 2.5,
                          fontWeight: FontWeight.w900,
                          color: AppColors.brandNavy,
                        ),
                        children: const [
                          TextSpan(text: 'CRA'),
                          TextSpan(
                            text: 'V',
                            style: TextStyle(color: AppColors.brandOrange),
                          ),
                          TextSpan(text: 'OU'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      'Alistamento de Candidato',
                      style: AppTypography.heading2.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Cadastre suas credenciais para treinar com foco 100% no seu concurso.',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Card de Cadastro
                    TacticalCard(
                      padding: EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // 1º PASSO DE SELEÇÃO: CONCURSO ALVO (COM ALERTA NOVO EDITAL PM-PE)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CONCURSO ALVO:',
                                style: AppTypography.tagLabel.copyWith(
                                  fontSize: 12,
                                  color: AppColors.brandNavy,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFEF2F2),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: const Color(0xFFEF4444)),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.notifications_active, color: Color(0xFFDC2626), size: 12),
                                    SizedBox(width: 4),
                                    Text(
                                      'EDITAL NA PRAÇA!',
                                      style: TextStyle(
                                        color: Color(0xFFDC2626),
                                        fontSize: 9.5,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          // Seletor de Concurso em Cards com Alerta na PM-PE
                          Row(
                            children: [
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PM-PE',
                                  nome: 'Polícia Militar',
                                  hasEditalAberto: true,
                                  isSelected: _selectedConcurso == 'PM-PE',
                                  onSelected: () => _onConcursoChanged('PM-PE'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PC-PE',
                                  nome: 'Polícia Civil',
                                  hasEditalAberto: false,
                                  isSelected: _selectedConcurso == 'PC-PE',
                                  onSelected: () => _onConcursoChanged('PC-PE'),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _ConcursoChoiceChip(
                                  sigla: 'PP-PE',
                                  nome: 'Polícia Penal',
                                  hasEditalAberto: false,
                                  isSelected: _selectedConcurso == 'PP-PE',
                                  onSelected: () => _onConcursoChanged('PP-PE'),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),

                          // 2º PASSO DE SELEÇÃO: CARGO ALVO DINÂMICO
                          Text(
                            'CARGO ALVO NA $_selectedConcurso:',
                            style: AppTypography.tagLabel.copyWith(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 6,
                            children: cargosDisponiveis.map((cargo) {
                              final isSelected = _selectedCargo == cargo;
                              return ChoiceChip(
                                label: Text(
                                  cargo,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: isSelected ? Colors.white : AppColors.textPrimary,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (_) => setState(() => _selectedCargo = cargo),
                                backgroundColor: AppColors.surfaceElevated,
                                selectedColor: AppColors.brandCobalt,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                    color: isSelected ? AppColors.brandCobalt : AppColors.surfaceBorder,
                                    width: isSelected ? 1.5 : 1.0,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(height: 16),
                          const Divider(height: 1, color: AppColors.surfaceBorder),
                          const SizedBox(height: 16),

                          // Nome Completo
                          TextFormField(
                            controller: _nameController,
                            style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
                            decoration: InputDecoration(
                              labelText: 'Nome Completo',
                              labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.person_outline, color: AppColors.brandCobalt, size: 20),
                              filled: true,
                              fillColor: AppColors.surfaceElevated,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || v.trim().isEmpty) ? 'Informe seu nome completo.' : null,
                          ),
                          const SizedBox(height: 12),

                          // E-mail
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                              labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.email_outlined, color: AppColors.brandCobalt, size: 20),
                              filled: true,
                              fillColor: AppColors.surfaceElevated,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || !v.contains('@')) ? 'Informe um e-mail válido.' : null,
                          ),
                          const SizedBox(height: 12),

                          // Senha
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
                            decoration: InputDecoration(
                              labelText: 'Senha (mínimo 6 dígitos)',
                              labelStyle: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                              prefixIcon: const Icon(Icons.lock_outline_rounded, color: AppColors.brandCobalt, size: 20),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                              ),
                              filled: true,
                              fillColor: AppColors.surfaceElevated,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                                borderSide: const BorderSide(color: AppColors.surfaceBorder),
                              ),
                            ),
                            validator: (v) => (v == null || v.length < 6) ? 'A senha deve ter no mínimo 6 caracteres.' : null,
                          ),
                          const SizedBox(height: 20),

                          // Botão Primário: CONCLUIR ALISTAMENTO
                          SizedBox(
                            height: 52,
                            child: ElevatedButton(
                              onPressed: controller?.isLoading == true ? null : _handleSubmit,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.brandNavy,
                                foregroundColor: Colors.white,
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
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      ),
                                    )
                                  : Text(
                                      'ALISTAR-SE NO CURSO DE $_selectedConcurso',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.8,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
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

/// Chip de Seleção de Concurso Alvo com Sinalização Especial de Edital Aberto
class _ConcursoChoiceChip extends StatelessWidget {
  final String sigla;
  final String nome;
  final bool hasEditalAberto;
  final bool isSelected;
  final VoidCallback onSelected;

  const _ConcursoChoiceChip({
    required this.sigla,
    required this.nome,
    this.hasEditalAberto = false,
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? (hasEditalAberto ? const Color(0xFFFEF3C7) : AppColors.brandCobalt.withValues(alpha: 0.08))
              : (hasEditalAberto ? const Color(0xFFFFFBEB) : AppColors.surfaceElevated),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? (hasEditalAberto ? const Color(0xFFD97706) : AppColors.brandCobalt)
                : (hasEditalAberto ? const Color(0xFFFCD34D) : AppColors.surfaceBorder),
            width: isSelected ? 2.2 : 1.0,
          ),
          boxShadow: hasEditalAberto && isSelected
              ? [
                  BoxShadow(
                    color: const Color(0xFFF59E0B).withValues(alpha: 0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasEditalAberto) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC2626),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '🚨 EDITAL NOVO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8.5,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
            Text(
              sigla,
              style: TextStyle(
                fontSize: 14,
                color: isSelected
                    ? (hasEditalAberto ? const Color(0xFFB45309) : AppColors.brandCobalt)
                    : AppColors.textPrimary,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              nome,
              style: TextStyle(
                fontSize: 10.5,
                color: isSelected
                    ? (hasEditalAberto ? const Color(0xFFB45309) : AppColors.brandCobalt)
                    : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
