import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/cebraspe_button.dart';
import '../../../../core/widgets/question_navigator_grid.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/timer_badge.dart';

/// Modelo de Questao Simulado no Cockpit
class QuestaoMock {
  final int numero;
  final String disciplina;
  final String assunto;
  final String enunciado;
  String? respostaMarcada; // "C", "E" ou null (em branco)

  QuestaoMock({
    required this.numero,
    required this.disciplina,
    required this.assunto,
    required this.enunciado,
    this.respostaMarcada,
  });
}

/// Tela Cockpit do Simulado Cebraspe da Operacao Aprovacao.
/// Implementa a experiencia tatica de alta fidelidade visual.
class SimuladoCockpitScreen extends StatefulWidget {
  const SimuladoCockpitScreen({super.key});

  @override
  State<SimuladoCockpitScreen> createState() => _SimuladoCockpitScreenState();
}

class _SimuladoCockpitScreenState extends State<SimuladoCockpitScreen> {
  int _currentIndex = 0;
  int _segundosRestantes = 13335; // 03h 42m 15s
  Timer? _timer;

  late final List<QuestaoMock> _questoes;

  @override
  void initState() {
    super.initState();
    _iniciarQuestoes();
    _iniciarCronometro();
  }

  void _iniciarQuestoes() {
    _questoes = List.generate(60, (index) {
      final num = index + 1;
      return QuestaoMock(
        numero: num,
        disciplina: num <= 20
            ? 'LÍNGUA PORTUGUESA'
            : (num <= 35 ? 'DIREITO PROCESSUAL PENAL' : 'DIREITO PENAL & LEGISLAÇÃO'),
        assunto: num <= 20
            ? 'COMPREENSÃO E INTERPRETAÇÃO DE TEXTOS'
            : (num <= 35 ? 'INQUÉRITO POLICIAL' : 'CRIMES CONTRA A ADMINISTRAÇÃO PÚBLICA'),
        enunciado: 'Considerando as disposições do Código de Processo Penal e a jurisprudência sumulada dos Tribunais Superiores quanto ao inquérito policial, julgue o item $num a seguir:\n\n'
            'O inquérito policial, por ser procedimento administrativo de natureza meramente informativa, não é indispensável para a propositura da ação penal, podendo esta ser intentada pelo Ministério Público com base em outros elementos de convicção hábeis que demonstrem a justa causa e os indícios de autoria.',
        respostaMarcada: index < 42 ? (index % 2 == 0 ? 'C' : 'E') : null,
      );
    });
  }

  void _iniciarCronometro() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_segundosRestantes > 0) {
        setState(() {
          _segundosRestantes--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatarTempo(int segundosTotais) {
    final horas = (segundosTotais ~/ 3600).toString().padLeft(2, '0');
    final minutos = ((segundosTotais % 3600) ~/ 60).toString().padLeft(2, '0');
    final segundos = (segundosTotais % 60).toString().padLeft(2, '0');
    return '$horas:$minutos:$segundos';
  }

  Set<int> get _answeredIndices {
    final set = <int>{};
    for (int i = 0; i < _questoes.length; i++) {
      if (_questoes[i].respostaMarcada != null) {
        set.add(i);
      }
    }
    return set;
  }

  void _marcarResposta(String? opcao) {
    setState(() {
      _questoes[_currentIndex].respostaMarcada = opcao;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questaoAtual = _questoes[_currentIndex];
    final totalRespondidas = _answeredIndices.length;
    final percentual = (totalRespondidas / _questoes.length);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SIMULADO OFICIAL',
              style: AppTypography.tagLabel.copyWith(fontSize: 10, color: AppColors.textSecondary),
            ),
            Text(
              'PC-PE - AGENTE',
              style: AppTypography.headlineMedium.copyWith(fontSize: 16),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: TimerBadge(
                formattedTime: _formatarTempo(_segundosRestantes),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de Telemetria e Progresso
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '$totalRespondidas/60 respondidas (${(percentual * 100).toInt()}%)',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                    ),
                    Text(
                      'Cebraspe (C - E)',
                      style: AppTypography.bodySmall.copyWith(color: AppColors.warning),
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

          // Area Rolavel da Questao
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TacticalCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag da Disciplina
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: AppColors.primaryDark.withValues(alpha: 0.4),
                        borderRadius: AppSpacing.borderRadiusSm,
                        border: Border.all(color: AppColors.primaryDark),
                      ),
                      child: Text(
                        '${questaoAtual.disciplina} • ${questaoAtual.assunto}',
                        style: AppTypography.tagLabel.copyWith(fontSize: 11),
                      ),
                    ),

                    const SizedBox(height: AppSpacing.lg),

                    // Enunciado
                    Text(
                      questaoAtual.enunciado,
                      style: AppTypography.bodyLarge,
                    ),

                    const SizedBox(height: AppSpacing.xxl),

                    // Botoes Taticos de Marcacao Cebraspe
                    Row(
                      children: [
                        CebraspeButton(
                          type: CebraspeOptionType.certo,
                          isSelected: questaoAtual.respostaMarcada == 'C',
                          onTap: () => _marcarResposta('C'),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        CebraspeButton(
                          type: CebraspeOptionType.errado,
                          isSelected: questaoAtual.respostaMarcada == 'E',
                          onTap: () => _marcarResposta('E'),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.md),

                    // Opcao de Deixar em Branco
                    CebraspeButton(
                      type: CebraspeOptionType.emBranco,
                      isSelected: questaoAtual.respostaMarcada == null,
                      onTap: () => _marcarResposta(null),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          // Grade de Navegacao Inferior (1 a 60)
          QuestionNavigatorGrid(
            totalQuestions: _questoes.length,
            currentIndex: _currentIndex,
            answeredIndices: _answeredIndices,
            onSelectQuestion: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
