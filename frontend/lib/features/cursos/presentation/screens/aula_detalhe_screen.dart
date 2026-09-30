import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../../../questoes/presentation/widgets/questao_card_widget.dart';

/// Tela de Estudo de Aula com Resumo Teórico Didático e Questões Práticas Vinculadas.
class AulaDetalheScreen extends StatefulWidget {
  final String disciplina;
  final String tituloAula;
  final String tempoLeitura;
  final List<QuestaoModel> questoesVinculadas;
  final String? conteudoTeorico;

  const AulaDetalheScreen({
    super.key,
    required this.disciplina,
    required this.tituloAula,
    this.tempoLeitura = '15 min de leitura',
    required this.questoesVinculadas,
    this.conteudoTeorico,
  });

  @override
  State<AulaDetalheScreen> createState() => _AulaDetalheScreenState();
}

class _AulaDetalheScreenState extends State<AulaDetalheScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final Map<int, String> _respostasAluno = {};
  final Set<int> _gabaritosRevelados = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.tituloAula,
              style: AppTypography.heading3.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${widget.disciplina} • ${widget.tempoLeitura}',
              style: AppTypography.caption.copyWith(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.brandCobalt,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.brandCobalt,
          indicatorWeight: 3,
          tabs: [
            Tab(
              icon: const Icon(Icons.menu_book_outlined, size: 18),
              text: 'Resumo da Aula',
            ),
            Tab(
              icon: const Icon(Icons.quiz_outlined, size: 18),
              text: 'Questões (${widget.questoesVinculadas.length})',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ABA 1: RESUMO TEÓRICO DIDÁTICO
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card de Introdução
                TacticalCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.brandOrange.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'CONTEÚDO OFICIAL CRAVOU',
                              style: TextStyle(color: AppColors.brandOrange, fontWeight: FontWeight.w800, fontSize: 10),
                            ),
                          ),
                          const Spacer(),
                          const Icon(Icons.verified, color: AppColors.brandCobalt, size: 18),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.tituloAula,
                        style: AppTypography.headlineMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.conteudoTeorico != null && widget.conteudoTeorico!.isNotEmpty
                            ? widget.conteudoTeorico!
                            : 'A crase representa a fusão de duas vogais idênticas (A + A). A banca examinadora adora testar trocas sutis de regência e palavras no plural sem artigo.',
                        style: AppTypography.bodyMedium.copyWith(fontSize: 13, height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Seção 1: Regra de Ouro do Cebraspe
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFFCA5A5)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.warning_rounded, color: Color(0xFFDC2626), size: 18),
                          SizedBox(width: 8),
                          Text(
                            'Regra de Ouro da Banca Cebraspe:',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFFDC2626)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        '"A" no singular diante de palavra no plural NÃO tem crase!\n\nExemplo da prova: "O agente policial obedeceu a ordens judiciais". Se o "a" está no singular, não há artigo plural "as". Portanto, crase proibida!',
                        style: TextStyle(fontSize: 12.5, color: Color(0xFF7F1D1D), height: 1.5),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Seção 2: Casos Proibitivos
                Text(
                  '1. Onde a Crase é 100% Proibida',
                  style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _topicoCard(
                  titulo: 'Diante de Verbos',
                  exemplo: 'Começou a investigar o local do crime.',
                  motivo: 'Verbo não admite artigo feminino.',
                ),
                const SizedBox(height: 6),
                _topicoCard(
                  titulo: 'Diante de Palavras Masculinas',
                  exemplo: 'O pagamento foi feito a prazo / a cavalo.',
                  motivo: 'Substantivos masculinos não admitem o artigo feminino "a".',
                ),
                const SizedBox(height: 6),
                _topicoCard(
                  titulo: 'Entre Palavras Repetidas',
                  exemplo: 'Ficaram cara a cara / dia a dia.',
                  motivo: 'Não ocorre crase em locuções formadas por palavras repetidas.',
                ),

                const SizedBox(height: 16),

                // Seção 3: Casos Facultativos (Mnemônico)
                Text(
                  '2. Casos Facultativos (Mnemônico "Pro-No-Ate")',
                  style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFF86EFAC)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('• PRO: Pronome possessivo feminino singular (minha, sua, tua).', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text('• NO: Nome próprio feminino (Refiro-me a Maria / à Maria).', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                      SizedBox(height: 4),
                      Text('• ATE: Após a preposição "até" (Fomos até a delegacia / até à delegacia).', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Botão de Ir para as Questões
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.brandCobalt,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () => _tabController.animateTo(1),
                    icon: const Icon(Icons.play_circle_fill, size: 20),
                    label: const Text(
                      'PRATICAR QUESTÕES DESTA AULA',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),

          // ABA 2: QUESTÕES PRÁTICAS DA AULA
          widget.questoesVinculadas.isEmpty
              ? const Center(child: Text('Nenhuma questão cadastrada para esta aula.'))
              : ListView.separated(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 80),
                  itemCount: widget.questoesVinculadas.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final questao = widget.questoesVinculadas[index];
                    return QuestaoCardWidget(
                      questao: questao,
                      index: index + 1,
                      respostaSelecionada: _respostasAluno[questao.id],
                      gabaritoRevelado: _gabaritosRevelados.contains(questao.id),
                      onResponder: (resp) {
                        setState(() {
                          _respostasAluno[questao.id] = resp;
                          _gabaritosRevelados.add(questao.id);
                        });
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _topicoCard({
    required String titulo,
    required String exemplo,
    required String motivo,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.brandNavy)),
          const SizedBox(height: 3),
          Text('Ex: "$exemplo"', style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.textPrimary)),
          const SizedBox(height: 2),
          Text(motivo, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
