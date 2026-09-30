import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'professor_cravou_avatar_widget.dart';
import 'professor_cravou_chat_modal.dart';

/// Card de destaque do Professor CRAVOU AI inserido no final do comentário da questão.
/// Funciona tanto para questões respondidas com acerto quanto com erro,
/// oferecendo mentoria, mnemônicos e tira-dúvidas interativo.
class ProfessorCravouCardWidget extends StatelessWidget {
  final String enunciado;
  final String gabaritoOficial;
  final String comentario;
  final bool acertou;
  final String? assunto;
  final String? banca;

  const ProfessorCravouCardWidget({
    super.key,
    required this.enunciado,
    required this.gabaritoOficial,
    required this.comentario,
    required this.acertou,
    this.assunto,
    this.banca,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.brandOrange.withValues(alpha: 0.35),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.brandOrange.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ProfessorCravouAvatarWidget(size: 38),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Professor CRAVOU AI',
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                            color: AppColors.brandNavy,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFFCD34D), width: 0.8),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('⚡', style: TextStyle(fontSize: 8)),
                              SizedBox(width: 2),
                              Text(
                                'MENTOR IA',
                                style: TextStyle(
                                  fontSize: 8.5,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF92400E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      acertou
                          ? 'Excelente disparo! Quer um mnemônico rápido para memorizar?'
                          : 'Pegadinha clássica da banca! Quer que eu destrinche para você?',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Botão Interativo de Ação
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _abrirChat(context),
                  icon: const Icon(Icons.forum_rounded, size: 15),
                  label: Text(
                    acertou
                        ? 'TIRAR DÚVIDA / PEDIR MNEMÔNICO'
                        : 'DESVENDAR PEGADINHA COM O PROFESSOR',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.3,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: acertou ? AppColors.brandNavy : AppColors.brandOrange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _abrirChat(BuildContext context) {
    ProfessorCravouChatModal.show(
      context,
      enunciado: enunciado,
      gabaritoOficial: gabaritoOficial,
      comentario: comentario,
      acertou: acertou,
      assunto: assunto,
      banca: banca,
    );
  }
}
