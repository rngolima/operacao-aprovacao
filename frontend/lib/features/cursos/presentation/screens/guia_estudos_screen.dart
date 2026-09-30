import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../questoes/data/models/questao_model.dart';
import 'aula_detalhe_screen.dart';

/// Tela do Guia de Estudos Oficial (Inspirada na arquitetura do QConcursos).
/// Exibe a trilha por disciplinas do edital com aulas em PDF didático e questões práticas.
class GuiaEstudosScreen extends StatefulWidget {
  final String concursoNome;

  const GuiaEstudosScreen({
    super.key,
    this.concursoNome = 'PC-PE — Agente de Polícia',
  });

  @override
  State<GuiaEstudosScreen> createState() => _GuiaEstudosScreenState();
}

class _GuiaEstudosScreenState extends State<GuiaEstudosScreen> {
  final Map<String, bool> _moduloAberto = {
    'Língua Portuguesa': true,
    'Noções de Direito Penal': false,
    'Noções de Direito Processual Penal': false,
    'Noções de Direito Constitucional': false,
  };

  // Mock de Questões Didáticas Vinculadas para a Aula de Crase
  final List<QuestaoModel> _questoesCrase = const [
    QuestaoModel(
      id: 1,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Crase & Regência',
      enunciado: 'No trecho: "O policial civil obedeceu a ordens emanadas de seus superiores hierárquicos sem hesitar.", o emprego do acento grave indicativo de crase no vocábulo "a" seria gramaticalmente obrigatório.',
      gabaritoOficial: 'ERRADO',
      comentarioDidatico: 'CRAVOU NO ERRO! Regra de Ouro do Cebraspe: "A" no singular diante de palavra no plural não tem crase ("a ordens"). O termo "ordens" está no plural e o "a" está desprovido de artigo feminino plural ("as"). Se houvesse crase, teria de ser "às ordens". Logo, o item está ERRADO.',
    ),
    QuestaoModel(
      id: 2,
      banca: 'Cebraspe',
      orgao: 'PC-PE',
      cargo: 'Agente de Polícia',
      ano: 2024,
      disciplina: 'Língua Portuguesa',
      assunto: 'Regência & Pronome Relativo',
      enunciado: 'A correção gramatical do texto seria mantida caso o segmento "o cargo que aspiro" fosse reescrito como "o cargo a que aspiro".',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O verbo "aspirar", no sentido de desejar, almejar ou pretender, é transitivo indireto e rege a preposição "A" (aspirar A algo). Quando antecedido de pronome relativo ("que"), a preposição regida pelo verbo deve ser anteposta ao pronome relativo: "o cargo A que aspiro". Item CERTO.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Guia de Estudos do Edital',
              style: AppTypography.heading3.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.concursoNome,
              style: AppTypography.caption.copyWith(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Card Principal do Curso
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.brandNavy,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.school, color: Colors.white, size: 20),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Curso Reta Final PC-PE (Cebraspe)',
                              style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Material autoral + Banco de Questões do Edital',
                              style: AppTypography.caption.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  // Barra de Progresso do Curso
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Progresso do Guia', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                      Text('25% concluído', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.25,
                      minHeight: 6,
                      backgroundColor: AppColors.surfaceElevated,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandCobalt),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Título da Seção de Disciplinas
            Text(
              'DISCIPLINAS DO EDITAL',
              style: AppTypography.tagLabel.copyWith(
                color: AppColors.textPrimary,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 8),

            // MÓDULO 1: LÍNGUA PORTUGUESA
            _moduloCard(
              nome: 'Língua Portuguesa',
              icone: '✍️',
              totalAulas: 4,
              totalQuestoes: 20,
              corBadge: AppColors.brandCobalt,
              aulas: [
                _aulaItem(
                  numero: '01',
                  titulo: 'Compreensão, Coesão & Conectivos no Cebraspe',
                  detalhes: '12 min • Síntese Didática • 10 questões',
                  concluida: true,
                  onTap: () => _abrirAula('Língua Portuguesa', 'Aula 01: Compreensão e Coesão Textual'),
                ),
                _aulaItem(
                  numero: '02',
                  titulo: 'Acento Indicativo de Crase & Regências Perigosas',
                  detalhes: '15 min • Síntese Didática • 15 questões',
                  concluida: false,
                  destaque: true,
                  onTap: () => _abrirAula('Língua Portuguesa', 'Aula 02: Crase & Regência sem Mistério', questoes: _questoesCrase),
                ),
                _aulaItem(
                  numero: '03',
                  titulo: 'Concordância Verbal & A Partícula SE (Apassivador vs IIS)',
                  detalhes: '14 min • Síntese Didática • 12 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Língua Portuguesa', 'Aula 03: Concordância e a Partícula SE'),
                ),
                _aulaItem(
                  numero: '04',
                  titulo: 'Pontuação Tática: O Emprego da Vírgula e Pontos',
                  detalhes: '10 min • Síntese Didática • 8 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Língua Portuguesa', 'Aula 04: Pontuação Tática no Cebraspe'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // MÓDULO 2: DIREITO PENAL
            _moduloCard(
              nome: 'Noções de Direito Penal',
              icone: '⚖️',
              totalAulas: 2,
              totalQuestoes: 12,
              corBadge: const Color(0xFF15803D),
              aulas: [
                _aulaItem(
                  numero: '01',
                  titulo: 'Aplicação da Lei Penal & Retroatividade Benéfica',
                  detalhes: '12 min • Síntese Didática • 8 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Direito Penal', 'Aula 01: Aplicação da Lei Penal'),
                ),
                _aulaItem(
                  numero: '02',
                  titulo: 'Crimes Contra a Vida & Homicídio Funcional (Lei 13.142)',
                  detalhes: '15 min • Síntese Didática • 10 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Direito Penal', 'Aula 02: Crimes Contra a Vida'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // MÓDULO 3: DIREITO PROCESSUAL PENAL
            _moduloCard(
              nome: 'Noções de Direito Processual Penal',
              icone: '🚓',
              totalAulas: 2,
              totalQuestoes: 12,
              corBadge: const Color(0xFFB45309),
              aulas: [
                _aulaItem(
                  numero: '01',
                  titulo: 'Inquérito Policial: Inquisitividade & Vedações (Art. 17 CPP)',
                  detalhes: '14 min • Síntese Didática • 12 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Processo Penal', 'Aula 01: Inquérito Policial'),
                ),
                _aulaItem(
                  numero: '02',
                  titulo: 'Prisão em Flagrante: Próprio, Impróprio e Ficto',
                  detalhes: '12 min • Síntese Didática • 10 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Processo Penal', 'Aula 02: Prisão em Flagrante'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // MÓDULO 4: DIREITO CONSTITUCIONAL
            _moduloCard(
              nome: 'Noções de Direito Constitucional',
              icone: '📜',
              totalAulas: 2,
              totalQuestoes: 10,
              corBadge: AppColors.brandNavy,
              aulas: [
                _aulaItem(
                  numero: '01',
                  titulo: 'Segurança Pública: Art. 144 da CF & Papel da Polícia Civil',
                  detalhes: '10 min • Síntese Didática • 10 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Direito Constitucional', 'Aula 01: Segurança Pública (Art. 144)'),
                ),
                _aulaItem(
                  numero: '02',
                  titulo: 'Direitos Fundamentais & Inviolabilidade de Domicílio',
                  detalhes: '12 min • Síntese Didática • 10 questões',
                  concluida: false,
                  onTap: () => _abrirAula('Direito Constitucional', 'Aula 02: Inviolabilidade de Domicílio'),
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  void _abrirAula(String disciplina, String titulo, {List<QuestaoModel>? questoes}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AulaDetalheScreen(
          disciplina: disciplina,
          tituloAula: titulo,
          questoesVinculadas: questoes ?? _questoesCrase,
        ),
      ),
    );
  }

  Widget _moduloCard({
    required String nome,
    required String icone,
    required int totalAulas,
    required int totalQuestoes,
    required Color corBadge,
    required List<Widget> aulas,
  }) {
    final isOpen = _moduloAberto[nome] ?? false;

    return TacticalCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _moduloAberto[nome] = !isOpen),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Text(icone, style: const TextStyle(fontSize: 22)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nome,
                          style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$totalAulas aulas teóricas • $totalQuestoes questões',
                          style: AppTypography.caption.copyWith(fontSize: 11, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (isOpen) ...[
            const Divider(height: 1, color: AppColors.surfaceBorder),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(children: aulas),
            ),
          ],
        ],
      ),
    );
  }

  Widget _aulaItem({
    required String numero,
    required String titulo,
    required String detalhes,
    bool concluida = false,
    bool destaque = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: destaque ? AppColors.brandCobalt.withValues(alpha: 0.06) : AppColors.surfaceElevated,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: destaque ? AppColors.brandCobalt.withValues(alpha: 0.3) : AppColors.surfaceBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: concluida ? AppColors.success : AppColors.surface,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: concluida ? AppColors.success : AppColors.surfaceBorder),
              ),
              child: Center(
                child: concluida
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : Text(numero, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: destaque ? AppColors.brandCobalt : AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(detalhes, style: AppTypography.caption.copyWith(fontSize: 10.5)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, size: 13, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
