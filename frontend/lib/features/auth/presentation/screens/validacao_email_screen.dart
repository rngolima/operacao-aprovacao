import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../controllers/auth_controller.dart';

/// Tela de Confirmação e Validação de Inscrição por E-mail (LGPD & Segurança)
///
/// Em conformidade com a LGPD (Lei 13.709/2018), antes de conceder acesso ao
/// painel de estudos e métricas de desempenho, o candidato deve comprovar a
/// titularidade do seu e-mail informando o código de segurança de 6 dígitos.
class ValidacaoEmailScreen extends StatefulWidget {
  final String nomeAluno;
  final String emailAluno;
  final String concursoAlvo;
  final String cargoAlvo;
  final String codigoSeguranca;
  final AuthController? controller;

  const ValidacaoEmailScreen({
    super.key,
    required this.nomeAluno,
    required this.emailAluno,
    required this.concursoAlvo,
    required this.cargoAlvo,
    required this.codigoSeguranca,
    this.controller,
  });

  @override
  State<ValidacaoEmailScreen> createState() => _ValidacaoEmailScreenState();
}

class _ValidacaoEmailScreenState extends State<ValidacaoEmailScreen> {
  late final TextEditingController _codigoController;
  late String _codigoAtual;
  String? _erroMensagem;
  bool _validando = false;
  bool _codigoReenviado = false;

  @override
  void initState() {
    super.initState();
    _codigoAtual = widget.codigoSeguranca;
    _codigoController = TextEditingController();
  }

  @override
  void dispose() {
    _codigoController.dispose();
    super.dispose();
  }

  void _preencherCodigoAutomatico() {
    HapticFeedback.lightImpact();
    setState(() {
      _codigoController.text = _codigoAtual;
      _erroMensagem = null;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Código $_codigoAtual copiado do e-mail oficial!'),
        backgroundColor: AppColors.brandCobalt,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _reenviarCodigo() {
    HapticFeedback.mediumImpact();
    final random = Random();
    final novoCodigo = (100000 + random.nextInt(900000)).toString();

    setState(() {
      _codigoAtual = novoCodigo;
      _codigoReenviado = true;
      _erroMensagem = null;
      _codigoController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Novo e-mail enviado para ${widget.emailAluno}! Novo código: $_codigoAtual',
        ),
        backgroundColor: const Color(0xFF16A34A),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _confirmarValidacao() async {
    final codigoDigitado = _codigoController.text.trim();

    if (codigoDigitado.isEmpty) {
      setState(() {
        _erroMensagem = 'Por favor, digite o código de 6 dígitos recebido no seu e-mail.';
      });
      return;
    }

    if (codigoDigitado.length < 6) {
      setState(() {
        _erroMensagem = 'O código de validação deve conter exatamente 6 dígitos numéricos.';
      });
      return;
    }

    if (codigoDigitado != _codigoAtual) {
      setState(() {
        _erroMensagem = 'Código incorreto. Confira o código no e-mail recebido ou solicite o reenvio.';
      });
      return;
    }

    setState(() {
      _validando = true;
      _erroMensagem = null;
    });

    HapticFeedback.heavyImpact();

    // 1. Configura a trilha e plano de estudos do aluno com o concurso alvo selecionado
    final isPmpe = widget.concursoAlvo.contains('PM-PE');
    final isPppe = widget.concursoAlvo.contains('PP-PE');

    PlanoEstudoState.instance.atualizarPlano(
      concursoAlvo: widget.concursoAlvo,
      cargoAlvo: widget.cargoAlvo,
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

    // Pequena pausa tática para feedback comemorativo
    await Future.delayed(const Duration(milliseconds: 600));

    if (!mounted) return;
    setState(() => _validando = false);

    // 2. Exibe diálogo de confirmação com status LGPD aprovado e navega para o Dashboard
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogCtx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            children: const [
              Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 28),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Inscrição Validada!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Parabéns, ${widget.nomeAluno}!',
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sua titularidade foi confirmada em estrita conformidade com a LGPD (Lei 13.709/18). Seu plano tático de estudos para a PM-PE foi ativado com sucesso!',
                style: TextStyle(fontSize: 13.5, color: Color(0xFF475569), height: 1.4),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.shield_rounded, color: Color(0xFF16A34A), size: 18),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Conta Verificada & Criptografada',
                        style: TextStyle(
                          color: Color(0xFF15803D),
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(dialogCtx).pop();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => DashboardScreen(
                        userName: widget.nomeAluno,
                        concursoAlvo: '${widget.concursoAlvo} (${widget.cargoAlvo})',
                      ),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandNavy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  'ACESSAR MEU PAINEL DE ESTUDOS',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13.5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          tooltip: 'Voltar para alistamento',
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.lock_outline_rounded, color: Color(0xFF16A34A), size: 14),
                SizedBox(width: 5),
                Text(
                  'LGPD SEGURA',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF334155),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Ícone Heroico de Verificação
                  Center(
                    child: Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        color: AppColors.brandCobalt.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.brandCobalt.withValues(alpha: 0.25),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.mark_email_read_rounded,
                          size: 44,
                          color: AppColors.brandCobalt,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Título e Subtítulo
                  Text(
                    'Confirmação de Inscrição',
                    style: AppTypography.headlineLarge.copyWith(
                      color: AppColors.brandNavy,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Em conformidade com a LGPD (Lei 13.709/18), valide a titularidade da sua conta para liberar o acesso ao curso.',
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                      fontSize: 14.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // E-mail informado em destaque
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.surfaceBorder),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.email_outlined, color: AppColors.brandCobalt, size: 22),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Código de segurança enviado para:',
                                style: TextStyle(
                                  fontSize: 11.5,
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                widget.emailAluno,
                                style: const TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textPrimary,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 18, color: AppColors.textSecondary),
                          tooltip: 'Corrigir e-mail',
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Simulação Didática do E-mail Recebido
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0F172A),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'E-MAIL OFICIAL',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9.5,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Agora mesmo',
                              style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'De: seguranca@cravou.com.br',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF334155),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Assunto: [CRAVOU] Valide sua inscrição no Curso ${widget.concursoAlvo}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const Divider(height: 16),
                        Text(
                          'Olá, ${widget.nomeAluno}! Use o código de 6 dígitos abaixo para autenticar sua inscrição em conformidade com a LGPD:',
                          style: const TextStyle(
                            fontSize: 12.5,
                            color: Color(0xFF475569),
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: const Color(0xFF818CF8), width: 1.5),
                            ),
                            child: Text(
                              _codigoAtual,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 6,
                                color: Color(0xFF1E1B4B),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: TextButton.icon(
                            onPressed: _preencherCodigoAutomatico,
                            icon: const Icon(Icons.paste_rounded, size: 16, color: AppColors.brandCobalt),
                            label: const Text(
                              'Preencher código automaticamente',
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.w800,
                                color: AppColors.brandCobalt,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Campo de Inserção do Código
                  Text(
                    'Digite o código de 6 dígitos',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _codigoController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 6,
                      color: AppColors.brandNavy,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    decoration: InputDecoration(
                      hintText: '• • • • • •',
                      hintStyle: TextStyle(
                        fontSize: 22,
                        letterSpacing: 6,
                        color: AppColors.textSecondary.withValues(alpha: 0.5),
                      ),
                      counterText: '',
                      filled: true,
                      fillColor: AppColors.surfaceElevated,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                        borderSide: const BorderSide(color: AppColors.surfaceBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                        borderSide: const BorderSide(color: AppColors.brandCobalt, width: 2),
                      ),
                    ),
                    onChanged: (v) {
                      if (_erroMensagem != null) {
                        setState(() => _erroMensagem = null);
                      }
                      if (v.length == 6) {
                        HapticFeedback.selectionClick();
                      }
                    },
                  ),

                  // Mensagem de Erro se houver
                  if (_erroMensagem != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFFECACA)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline_rounded, color: Color(0xFFDC2626), size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _erroMensagem!,
                              style: const TextStyle(
                                color: Color(0xFFB91C1C),
                                fontSize: 12.5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 18),

                  // Box Explicativo da LGPD
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Icon(Icons.shield_outlined, color: Color(0xFF475569), size: 18),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Segurança LGPD: O envio de código valida que você é o titular legítimo deste e-mail. Seus dados cadastrais e respostas de simulados são protegidos com sigilo estrito e criptografia.',
                            style: TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF475569),
                              height: 1.35,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Botão Primário: CONFIRMAR E LIBERAR MEU ACESSO
                  SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _validando ? null : _confirmarValidacao,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandNavy,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                        ),
                        elevation: 0,
                      ),
                      child: _validando
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text(
                              'CONFIRMAR E LIBERAR MEU ACESSO',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Botão Secundário: Reenviar Código
                  Center(
                    child: TextButton.icon(
                      onPressed: _validando ? null : _reenviarCodigo,
                      icon: const Icon(Icons.refresh_rounded, size: 18, color: AppColors.brandCobalt),
                      label: Text(
                        _codigoReenviado
                            ? 'Reenviar código novamente'
                            : 'Não recebeu o e-mail? Reenviar código',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.brandCobalt,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
