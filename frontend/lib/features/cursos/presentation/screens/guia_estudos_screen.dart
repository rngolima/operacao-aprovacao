import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../questoes/data/models/questao_model.dart';
import 'aula_detalhe_screen.dart';

/// Tela do Guia de Estudos Oficial (Inspirada na arquitetura do QConcursos).
/// Exibe a trilha por disciplinas do edital com aulas em síntese didática e questões práticas.
class GuiaEstudosScreen extends StatefulWidget {
  final String? concursoNome;

  const GuiaEstudosScreen({
    super.key,
    this.concursoNome,
  });

  @override
  State<GuiaEstudosScreen> createState() => _GuiaEstudosScreenState();
}

class _GuiaEstudosScreenState extends State<GuiaEstudosScreen> {
  final Map<String, bool> _moduloAberto = {};

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

  // Mock de Questões da PMPE (História de PE)
  final List<QuestaoModel> _questoesHistoriaPe = const [
    QuestaoModel(
      id: 3,
      banca: 'IAUPE',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Invasões Holandesas',
      enunciado: 'Durante o domínio holandês em Pernambuco sob a administração de Maurício de Nassau (1637-1644), a política de tolerância religiosa e os investimentos urbanísticos na Cidade Maurícia marcaram o apogeu da presença neerlandesa no Nordeste açucareiro.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O governo de Maurício de Nassau notabilizou-se pela liberdade de culto (concedida a católicos, calvinistas e judeus), embelezamento do Recife, saneamento e estímulo às artes e ciências, sendo considerado o período de ouro da ocupação holandesa.',
    ),
    QuestaoModel(
      id: 4,
      banca: 'IAUPE',
      orgao: 'PM-PE',
      cargo: 'Soldado da Polícia Militar',
      ano: 2024,
      disciplina: 'História de Pernambuco',
      assunto: 'Revolução Pernambucana de 1817',
      enunciado: 'A Revolução Pernambucana de 1817 instaurou uma república independente de caráter provisório em Pernambuco, motivada pela insatisfação com os altos impostos cobrados pela Coroa portuguesa sediada no Rio de Janeiro e pelas secas no Nordeste.',
      gabaritoOficial: 'CERTO',
      comentarioDidatico: 'CRAVOU NO ACERTO! O movimento de 1817 proclamou a República de Pernambuco, com liberdade de imprensa e culto, opondo-se ao absolutismo monárquico joanino e à pesada carga tributária que financiava a corte no Rio.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final plano = PlanoEstudoState.instance;
    final String concursoAtivo = widget.concursoNome ?? plano.concursoAlvo;
    final bool isPmpe = concursoAtivo.toUpperCase().contains('MILITAR') ||
        concursoAtivo.toUpperCase().contains('PMPE') ||
        concursoAtivo.toUpperCase().contains('PM-PE');

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
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            Text(
              isPmpe ? 'PM-PE — Soldado da Polícia Militar' : 'PC-PE — Agente de Polícia',
              style: AppTypography.caption.copyWith(fontSize: 12, color: AppColors.brandOrange, fontWeight: FontWeight.bold),
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
                          color: isPmpe ? const Color(0xFF15803D) : AppColors.brandNavy,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(Icons.school, color: Colors.white, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isPmpe ? 'Curso Reta Final PM-PE (Edital Publicado)' : 'Curso Reta Final PC-PE (Cebraspe)',
                              style: AppTypography.titleMedium.copyWith(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              isPmpe
                                  ? 'Banca IAUPE/AOCP • 2.400 Vagas • Material Autoral + Questões'
                                  : 'Banca Cebraspe • Material Autoral + Questões do Edital',
                              style: AppTypography.caption.copyWith(fontSize: 12),
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
                      Text('Progresso do Guia', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                      Text('18% concluído', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.brandCobalt)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.18,
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
              'DISCIPLINAS DO EDITAL OFICIAL',
              style: AppTypography.tagLabel.copyWith(
                color: AppColors.textPrimary,
                letterSpacing: 0.8,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 8),

            if (isPmpe) ...[
              // MÓDULO 1 PM-PE: HISTÓRIA DE PERNAMBUCO
              _moduloCard(
                nome: 'História de Pernambuco',
                icone: '⚔️',
                totalAulas: 3,
                totalQuestoes: 15,
                corBadge: const Color(0xFF15803D),
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Invasões Holandesas & Governo de Maurício de Nassau',
                    detalhes: '14 min • Síntese Didática • 8 questões IAUPE',
                    concluida: true,
                    onTap: () => _abrirAula('História de Pernambuco', 'Aula 01: Invasões Holandesas em PE', questoes: _questoesHistoriaPe),
                  ),
                  _aulaItem(
                    numero: '02',
                    titulo: 'Insurreição Pernambucana & Batalha dos Guararapes (Origem do Exército)',
                    detalhes: '12 min • Síntese Didática • 10 questões',
                    concluida: false,
                    destaque: true,
                    onTap: () => _abrirAula('História de Pernambuco', 'Aula 02: Insurreição e Batalha dos Guararapes', questoes: _questoesHistoriaPe),
                  ),
                  _aulaItem(
                    numero: '03',
                    titulo: 'Revolução Pernambucana de 1817 & Confederação do Equador (1824)',
                    detalhes: '15 min • Síntese Didática • 12 questões',
                    concluida: false,
                    onTap: () => _abrirAula('História de Pernambuco', 'Aula 03: Movimentos Revolucionários de PE', questoes: _questoesHistoriaPe),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // MÓDULO 2 PM-PE: GEOGRAFIA DE PERNAMBUCO
              _moduloCard(
                nome: 'Geografia de Pernambuco',
                icone: '🗺️',
                totalAulas: 2,
                totalQuestoes: 12,
                corBadge: const Color(0xFFD97706),
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Quadro Físico: Relevo, Clima e Vegetação (Zona da Mata, Agreste e Sertão)',
                    detalhes: '12 min • Síntese Didática • 10 questões',
                    concluida: false,
                    onTap: () => _abrirAula('Geografia de Pernambuco', 'Aula 01: Mesorregiões e Relevo de PE'),
                  ),
                  _aulaItem(
                    numero: '02',
                    titulo: 'Bacias Hidrográficas (Rio São Francisco e Transposição) & Economia',
                    detalhes: '14 min • Síntese Didática • 10 questões',
                    concluida: false,
                    onTap: () => _abrirAula('Geografia de Pernambuco', 'Aula 02: Hidrografia e Polos Econômicos de PE'),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // MÓDULO 3 PM-PE: LÍNGUA PORTUGUESA (IAUPE)
              _moduloCard(
                nome: 'Língua Portuguesa (Foco IAUPE)',
                icone: '✍️',
                totalAulas: 3,
                totalQuestoes: 18,
                corBadge: AppColors.brandCobalt,
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Compreensão e Interpretação Textual na Banca IAUPE',
                    detalhes: '10 min • Síntese Didática • 10 questões',
                    concluida: false,
                    onTap: () => _abrirAula('Língua Portuguesa', 'Aula 01: Interpretação de Texto IAUPE'),
                  ),
                  _aulaItem(
                    numero: '02',
                    titulo: 'Acento Indicativo de Crase & Regência Verbal',
                    detalhes: '15 min • Síntese Didática • 15 questões',
                    concluida: false,
                    destaque: true,
                    onTap: () => _abrirAula('Língua Portuguesa', 'Aula 02: Crase e Regência para PM-PE', questoes: _questoesCrase),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // MÓDULO 4 PM-PE: MATEMÁTICA E RLM
              _moduloCard(
                nome: 'Matemática e Raciocínio Lógico',
                icone: '📐',
                totalAulas: 2,
                totalQuestoes: 10,
                corBadge: const Color(0xFF6366F1),
                aulas: [
                  _aulaItem(
                    numero: '01',
                    titulo: 'Regra de Três, Porcentagem e Juros Simples',
                    detalhes: '12 min • Fórmulas e Macetes • 10 questões',
                    concluida: false,
                    onTap: () => _abrirAula('Matemática', 'Aula 01: Porcentagem e Regra de Três'),
                  ),
                  _aulaItem(
                    numero: '02',
                    titulo: 'Lógica Proposicional: Tabela-Verdade e Negação de Conectivos',
                    detalhes: '14 min • Macetes Práticos • 10 questões',
                    concluida: false,
                    onTap: () => _abrirAula('RLM', 'Aula 02: Lógica Proposicional'),
                  ),
                ],
              ),
            ] else ...[
              // MÓDULOS PADRÃO PC-PE
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
                ],
              ),
              const SizedBox(height: 10),
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
                ],
              ),
            ],

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
    final isOpen = _moduloAberto[nome] ?? true;

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
                          '$totalAulas aulas • $totalQuestoes questões oficiais',
                          style: AppTypography.caption.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
          if (isOpen) ...[
            const Divider(height: 1, color: AppColors.surfaceBorder),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: aulas.length,
              separatorBuilder: (_, _) => const Divider(height: 1, color: AppColors.surfaceBorder),
              itemBuilder: (context, i) => aulas[i],
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
    required bool concluida,
    bool destaque = false,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: concluida
                    ? AppColors.success.withValues(alpha: 0.15)
                    : destaque
                        ? AppColors.brandOrange.withValues(alpha: 0.15)
                        : AppColors.surfaceElevated,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: concluida
                    ? const Icon(Icons.check, color: AppColors.success, size: 16)
                    : Text(
                        numero,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: destaque ? FontWeight.bold : FontWeight.w600,
                      color: destaque ? AppColors.brandOrange : AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detalhes,
                    style: AppTypography.caption.copyWith(fontSize: 10.5),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
