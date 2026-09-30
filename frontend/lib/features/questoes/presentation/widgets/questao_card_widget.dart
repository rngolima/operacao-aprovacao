import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../data/models/questao_model.dart';

/// Card Tatico de Resolucao de Questao Cebraspe (Modo Treino do CRAVOU).
class QuestaoCardWidget extends StatelessWidget {
  final QuestaoModel questao;
  final int index;
  final String? respostaSelecionada;
  final bool gabaritoRevelado;
  final Function(String resposta) onResponder;
  final VoidCallback? onRevisarAssunto;
  final int? tempoGastoSegundos;

  const QuestaoCardWidget({
    super.key,
    required this.questao,
    required this.index,
    required this.respostaSelecionada,
    required this.gabaritoRevelado,
    required this.onResponder,
    this.onRevisarAssunto,
    this.tempoGastoSegundos,
  });

  @override
  Widget build(BuildContext context) {
    final bool foiRespondida = gabaritoRevelado && respostaSelecionada != null;
    final bool acertou = foiRespondida &&
        (respostaSelecionada!.toUpperCase() == questao.gabaritoOficial.toUpperCase());

    return TacticalCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Barra de Metadados Superior no estilo QConcursos
          Wrap(
            spacing: 8,
            runSpacing: 6,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Badge de Identificação da Questão
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.brandNavy,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Q${questao.id > 0 ? questao.id : index}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              // Tag da Disciplina
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.brandCobalt.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.brandCobalt.withValues(alpha: 0.25)),
                ),
                child: Text(
                  questao.disciplina,
                  style: const TextStyle(
                    color: AppColors.brandCobalt,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
              ),

              // Assunto
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  '•  ${questao.assunto}',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Metadados do Concurso em Tags Responsivas (Nunca estouram a tela)
          Wrap(
            spacing: 6,
            runSpacing: 4,
            children: [
              _metaChip('Ano: ${questao.ano}'),
              _metaChip('Banca: ${questao.banca}'),
              _metaChip('Órgão: ${questao.orgao}'),
              _metaChip('Cargo: ${questao.cargo}'),
              if (tempoGastoSegundos != null) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: tempoGastoSegundos! > 150
                        ? const Color(0xFFFEF2F2)
                        : const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: tempoGastoSegundos! > 150
                          ? const Color(0xFFFCA5A5)
                          : const Color(0xFFCBD5E1),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(tempoGastoSegundos! > 150 ? '⚠️' : '⏱️', style: const TextStyle(fontSize: 10)),
                      const SizedBox(width: 4),
                      Text(
                        '${tempoGastoSegundos! ~/ 60}:${(tempoGastoSegundos! % 60).toString().padLeft(2, '0')}${tempoGastoSegundos! > 150 ? ' (Tempo alto)' : ''}',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: tempoGastoSegundos! > 150
                              ? const Color(0xFFDC2626)
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),

          const Divider(height: 20, thickness: 1, color: AppColors.surfaceBorder),

          // Enunciado Cebraspe de Alta Legibilidade
          Text(
            questao.enunciado,
            style: AppTypography.bodyLarge.copyWith(
              color: AppColors.textPrimary,
              height: 1.65,
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 20),

          // Opções de Resposta: Múltipla Escolha (A-E) ou Certo/Errado (Cebraspe)
          if (questao.alternativas != null && questao.alternativas!.isNotEmpty) ...[
            ...questao.alternativas!.entries.map((entry) {
              final letra = entry.key;
              final texto = entry.value;
              final isSelected = respostaSelecionada?.toUpperCase() == letra.toUpperCase();
              final isCorrect = questao.gabaritoOficial.toUpperCase() == letra.toUpperCase();
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: _AlternativeItem(
                  letra: letra,
                  texto: texto,
                  isSelected: isSelected,
                  isCorrect: isCorrect,
                  gabaritoRevelado: gabaritoRevelado,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    onResponder(letra);
                  },
                ),
              );
            }),
          ] else ...[
            // Botões Padrão Cebraspe [ CERTO ] e [ ERRADO ]
            Row(
              children: [
                Expanded(
                  child: _OptionButton(
                    label: '[ CERTO ]',
                    isSelected: respostaSelecionada == 'CERTO',
                    isCorrect: questao.gabaritoOficial == 'CERTO',
                    gabaritoRevelado: gabaritoRevelado,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      onResponder('CERTO');
                    },
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _OptionButton(
                    label: '[ ERRADO ]',
                    isSelected: respostaSelecionada == 'ERRADO',
                    isCorrect: questao.gabaritoOficial == 'ERRADO',
                    gabaritoRevelado: gabaritoRevelado,
                    onTap: () {
                      HapticFeedback.lightImpact();
                      onResponder('ERRADO');
                    },
                  ),
                ),
              ],
            ),
          ],

          // Gabarito Comentado e Resolução Didática (Revelado após responder)
          if (foiRespondida) ...[
            const SizedBox(height: 16),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: acertou
                    ? const Color(0xFFF0FDF4)
                    : const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: acertou
                      ? const Color(0xFF86EFAC)
                      : const Color(0xFFFCA5A5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        acertou ? Icons.check_circle_rounded : Icons.cancel_rounded,
                        color: acertou
                            ? const Color(0xFF16A34A)
                            : const Color(0xFFDC2626),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        acertou ? 'CRAVOU! RESPOSTA CERTA' : 'RESPOSTA INCORRETA',
                        style: TextStyle(
                          color: acertou
                              ? const Color(0xFF16A34A)
                              : const Color(0xFFDC2626),
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: acertou
                                ? const Color(0xFF86EFAC)
                                : const Color(0xFFFCA5A5),
                          ),
                        ),
                        child: Text(
                          'Gabarito: ${questao.gabaritoOficial}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: acertou
                                ? const Color(0xFF16A34A)
                                : const Color(0xFFDC2626),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Resolução Didática:',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    questao.comentarioDidatico,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                      height: 1.5,
                      fontSize: 13,
                    ),
                  ),
                  if (!acertou && onRevisarAssunto != null) ...[
                    const SizedBox(height: 12),
                    InkWell(
                      onTap: onRevisarAssunto,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFF87171), width: 1.2),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.menu_book_rounded, color: Color(0xFFDC2626), size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'PONTO DE VULNERABILIDADE DETECTADO',
                                    style: TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xFFDC2626),
                                      letterSpacing: 0.4,
                                    ),
                                  ),
                                  Text(
                                    'Revisar "${questao.assunto}" no Resumo e Mapa Mental',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF991B1B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDC2626), size: 14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _metaChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isCorrect;
  final bool gabaritoRevelado;
  final VoidCallback onTap;

  const _OptionButton({
    required this.label,
    required this.isSelected,
    required this.isCorrect,
    required this.gabaritoRevelado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFF8FAFC);
    Color borderColor = const Color(0xFFCBD5E1);
    Color textColor = AppColors.textPrimary;
    Widget? icon;

    if (gabaritoRevelado) {
      if (isCorrect) {
        backgroundColor = const Color(0xFFECFDF5);
        borderColor = const Color(0xFF10B981);
        textColor = const Color(0xFF065F46);
        icon = const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 18);
      } else if (isSelected && !isCorrect) {
        backgroundColor = const Color(0xFFFEF2F2);
        borderColor = const Color(0xFFEF4444);
        textColor = const Color(0xFF991B1B);
        icon = const Icon(Icons.cancel_rounded, color: Color(0xFFEF4444), size: 18);
      }
    } else if (isSelected) {
      backgroundColor = AppColors.brandCobalt.withValues(alpha: 0.1);
      borderColor = AppColors.brandCobalt;
      textColor = AppColors.brandCobalt;
    }

    return GestureDetector(
      onTap: gabaritoRevelado ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon,
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w800,
                fontSize: 14,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AlternativeItem extends StatelessWidget {
  final String letra;
  final String texto;
  final bool isSelected;
  final bool isCorrect;
  final bool gabaritoRevelado;
  final VoidCallback onTap;

  const _AlternativeItem({
    required this.letra,
    required this.texto,
    required this.isSelected,
    required this.isCorrect,
    required this.gabaritoRevelado,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = AppColors.surfaceElevated;
    Color borderColor = AppColors.surfaceBorder;
    Color badgeBg = AppColors.brandNavy.withValues(alpha: 0.1);
    Color badgeColor = AppColors.brandNavy;
    Widget? icon;

    if (gabaritoRevelado) {
      if (isCorrect) {
        backgroundColor = const Color(0xFFECFDF5);
        borderColor = const Color(0xFF10B981);
        badgeBg = const Color(0xFF10B981);
        badgeColor = Colors.white;
        icon = const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 18);
      } else if (isSelected && !isCorrect) {
        backgroundColor = const Color(0xFFFEF2F2);
        borderColor = const Color(0xFFEF4444);
        badgeBg = const Color(0xFFEF4444);
        badgeColor = Colors.white;
        icon = const Icon(Icons.cancel_rounded, color: Color(0xFFEF4444), size: 18);
      }
    } else if (isSelected) {
      backgroundColor = AppColors.brandCobalt.withValues(alpha: 0.08);
      borderColor = AppColors.brandCobalt;
      badgeBg = AppColors.brandCobalt;
      badgeColor = Colors.white;
    }

    return GestureDetector(
      onTap: gabaritoRevelado ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: badgeBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  letra,
                  style: TextStyle(
                    color: badgeColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                texto,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.45,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8),
              icon,
            ],
          ],
        ),
      ),
    );
  }
}

