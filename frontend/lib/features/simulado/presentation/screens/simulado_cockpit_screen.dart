import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cebraspe_button.dart';
import '../../../../core/widgets/cravou_brand_header.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/timer_badge.dart';
import '../../data/repositories/simulado_repository_impl.dart';
import '../controllers/simulado_controller.dart';
import '../widgets/grade_navegacao_modal.dart';
import 'simulado_resultado_dialog.dart';

/// Tela Cockpit do Simulado Oficial Cebraspe (PC-PE) da plataforma CRAVOU.
/// Proporciona a experiencia tatica de alta fidelidade das condicoes reais de prova.
class SimuladoCockpitScreen extends StatefulWidget {
  final SimuladoController? controller;

  const SimuladoCockpitScreen({
    super.key,
    this.controller,
  });

  @override
  State<SimuladoCockpitScreen> createState() => _SimuladoCockpitScreenState();
}

class _SimuladoCockpitScreenState extends State<SimuladoCockpitScreen> {
  late final SimuladoController _controller;
  late final bool _internalController;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
      _internalController = false;
    } else {
      _controller = SimuladoController(repository: SimuladoRepositoryImpl());
      _internalController = true;
      _controller.inicializar();
    }
    _controller.addListener(_onControllerUpdate);
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    if (_internalController) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _marcarResposta(String? opcao) {
    HapticFeedback.lightImpact();
    _controller.marcarResposta(opcao);
  }

  void _confirmarFinalizacao() {
    final respondidas = _controller.totalRespondidas;
    final emBranco = _controller.totalEmBranco;
    final revisao = _controller.totalMarcadasRevisao;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.borderRadiusMd,
          side: const BorderSide(color: AppColors.border),
        ),
        title: Text(
          'FINALIZAR SIMULADO OFICIAL?',
          style: AppTypography.headlineMedium.copyWith(fontSize: 16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atenção: Na banca Cebraspe, cada questão errada anula uma certa (1E = -1C).',
              style: AppTypography.bodySmall.copyWith(color: AppColors.warning),
            ),
            const SizedBox(height: 12),
            _resumoLinha('Itens Respondidos:', '$respondidas de 60', AppColors.success),
            _resumoLinha('Itens em Branco (Abstenção):', '$emBranco itens', AppColors.textSecondary),
            if (revisao > 0)
              _resumoLinha('Itens Marcados p/ Revisão:', '$revisao itens', AppColors.accentOrange),
            const SizedBox(height: 12),
            Text(
              'Deseja entregar sua folha de respostas e gerar o relatório oficial?',
              style: AppTypography.bodyMedium,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(
              'CONTINUAR PROVA',
              style: AppTypography.buttonLabel.copyWith(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.surface,
            ),
            onPressed: () async {
              Navigator.of(ctx).pop();
              final resultado = await _controller.finalizarSimulado();
              if (resultado != null && mounted) {
                SimuladoResultadoDialog.exibir(
                  context,
                  resultado: resultado,
                  onConcluir: () {
                    Navigator.of(context).pop(); // fecha modal
                    Navigator.of(context).pop(); // volta a tela anterior
                  },
                );
              }
            },
            child: Text('ENTREGAR PROVA', style: AppTypography.buttonLabel),
          ),
        ],
      ),
    );
  }

  Widget _resumoLinha(String label, String valor, Color cor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary)),
          Text(valor, style: AppTypography.bodySmall.copyWith(color: cor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isLoading) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: AppColors.primary),
              const SizedBox(height: 16),
              Text('Carregando Caderno Oficial Cebraspe...', style: AppTypography.bodyMedium),
            ],
          ),
        ),
      );
    }

    if (_controller.errorMessage != null && _controller.simulado == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, color: AppColors.error, size: 48),
                const SizedBox(height: 16),
                Text(_controller.errorMessage!, textAlign: TextAlign.center, style: AppTypography.bodyMedium),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _controller.inicializar(),
                  child: const Text('TENTAR NOVAMENTE'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final questaoAtual = _controller.itemAtual;
    final respostaAtual = _controller.respostaAtual;
    final total = _controller.totalQuestoes;
    final respondidas = _controller.totalRespondidas;
    final percentual = _controller.percentualConcluido;
    final isCritico = _controller.isTempoCritico;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (_controller.totalRespondidas > 0) {
              _confirmarFinalizacao();
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
        title: CravouBrandHeader.coBranded(
          concursoSigla: 'PC-PE',
          subtitulo: 'SIMULADO OFICIAL CEBRASPE',
          logoSize: 28,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: TimerBadge(
                formattedTime: _controller.tempoFormatado,
                isUrgent: isCritico,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Telemetria e Progresso Tático
          Container(
            color: AppColors.surface,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$respondidas/$total respondidas (${(percentual * 100).toInt()}%)',
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        if (_controller.totalMarcadasRevisao > 0) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.accentOrange.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.flag, size: 12, color: AppColors.accentOrange),
                                const SizedBox(width: 4),
                                Text(
                                  '${_controller.totalMarcadasRevisao} rev.',
                                  style: AppTypography.tagLabel.copyWith(
                                    fontSize: 10,
                                    color: AppColors.accentOrange,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          'Cebraspe (C - E)',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.warning,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: percentual,
                    minHeight: 4,
                    backgroundColor: AppColors.surfaceElevated,
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Área Rolável da Questão
          Expanded(
            child: questaoAtual == null
                ? const SizedBox.shrink()
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: TacticalCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Topo da Questão: Número e Disciplina
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDark.withValues(alpha: 0.35),
                                  borderRadius: AppSpacing.borderRadiusSm,
                                  border: Border.all(color: AppColors.primaryDark),
                                ),
                                child: Text(
                                  'ITEM ${questaoAtual.numeroQuestao} DE $total',
                                  style: AppTypography.tagLabel.copyWith(
                                    fontSize: 11,
                                    color: AppColors.accentOrange,
                                  ),
                                ),
                              ),
                              if (respostaAtual?.marcadaParaRevisao == true)
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.accentOrange.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: AppColors.accentOrange),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.flag, size: 12, color: AppColors.accentOrange),
                                      const SizedBox(width: 4),
                                      Text(
                                        'REVISÃO',
                                        style: AppTypography.tagLabel.copyWith(
                                          fontSize: 10,
                                          color: AppColors.accentOrange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),

                          const SizedBox(height: AppSpacing.md),

                          // Disciplina e Assunto
                          Text(
                            '${questaoAtual.disciplinaNome} • ${questaoAtual.assuntoNome}',
                            style: AppTypography.tagLabel.copyWith(
                              fontSize: 11,
                              color: AppColors.textSecondary,
                            ),
                          ),

                          const SizedBox(height: AppSpacing.md),

                          // Texto Base se existir
                          if (questaoAtual.textoBase != null && questaoAtual.textoBase!.isNotEmpty) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceElevated,
                                borderRadius: AppSpacing.borderRadiusSm,
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Text(
                                questaoAtual.textoBase!,
                                style: AppTypography.bodySmall.copyWith(
                                  color: AppColors.textSecondary,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                          ],

                          // Enunciado
                          Text(
                            questaoAtual.enunciado,
                            style: AppTypography.bodyLarge.copyWith(height: 1.5),
                          ),

                          const SizedBox(height: AppSpacing.xl),

                          // Botoes Taticos de Marcacao Cebraspe
                          Row(
                            children: [
                              CebraspeButton(
                                type: CebraspeOptionType.certo,
                                isSelected: respostaAtual?.respostaMarcada == 'C',
                                onTap: () => _marcarResposta('C'),
                              ),
                              const SizedBox(width: AppSpacing.md),
                              CebraspeButton(
                                type: CebraspeOptionType.errado,
                                isSelected: respostaAtual?.respostaMarcada == 'E',
                                onTap: () => _marcarResposta('E'),
                              ),
                            ],
                          ),

                          const SizedBox(height: AppSpacing.md),

                          // Opcao de Deixar em Branco / Abstenção
                          CebraspeButton(
                            type: CebraspeOptionType.emBranco,
                            isSelected: respostaAtual?.respostaMarcada == null ||
                                respostaAtual!.respostaMarcada!.isEmpty,
                            onTap: () => _marcarResposta(null),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),

          // Barra Tática Inferior de Navegação
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: const BoxDecoration(
              color: AppColors.surface,
              border: Border(
                top: BorderSide(color: AppColors.border),
              ),
            ),
            child: Row(
              children: [
                // Botão Anterior
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                  color: _controller.currentIndex > 0 ? AppColors.textPrimary : AppColors.border,
                  onPressed: _controller.currentIndex > 0 ? _controller.questaoAnterior : null,
                  tooltip: 'Questão Anterior',
                ),

                const SizedBox(width: 8),

                // Botão de Revisão
                IconButton(
                  icon: Icon(
                    respostaAtual?.marcadaParaRevisao == true ? Icons.flag : Icons.flag_outlined,
                    color: respostaAtual?.marcadaParaRevisao == true
                        ? AppColors.accentOrange
                        : AppColors.textSecondary,
                  ),
                  onPressed: _controller.alternarRevisao,
                  tooltip: 'Marcar para Revisão',
                ),

                const SizedBox(width: 8),

                // Botão Central de Grade (1 a 60)
                Expanded(
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppSpacing.borderRadiusMd,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    icon: const Icon(Icons.grid_view_rounded, size: 18, color: AppColors.primary),
                    label: Text(
                      'GRADE (1-$total)',
                      style: AppTypography.buttonLabel.copyWith(
                        color: AppColors.primary,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () => GradeNavegacaoModal.exibir(context, _controller),
                  ),
                ),

                const SizedBox(width: 8),

                // Botão Próximo ou Finalizar
                if (_controller.currentIndex < total - 1)
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 20),
                    color: AppColors.textPrimary,
                    onPressed: _controller.proximaQuestao,
                    tooltip: 'Próxima Questão',
                  )
                else
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.surface,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    onPressed: _confirmarFinalizacao,
                    child: Text('ENTREGAR', style: AppTypography.buttonLabel.copyWith(fontSize: 11)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
