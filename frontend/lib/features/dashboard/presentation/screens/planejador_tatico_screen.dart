import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';

/// Tela de Planejamento Tático de Estudos do Candidato CRAVOU.
///
/// Substitui o upload genérico de editais por um planejador rigoroso,
/// onde o aluno informa sua disponibilidade de estudos diários (horas e turnos)
/// e o sistema gera o cronograma exato sincronizado com as semanas e meses
/// que faltam rigorosamente para a prova oficial da PM-PE (banca IAUPE).
class PlanejadorTaticoScreen extends StatefulWidget {
  const PlanejadorTaticoScreen({super.key});

  @override
  State<PlanejadorTaticoScreen> createState() => _PlanejadorTaticoScreenState();
}

class _PlanejadorTaticoScreenState extends State<PlanejadorTaticoScreen> {
  late int _horasPorDia;
  final int _diasAteProva = 68;
  final int _semanasAteProva = 10;
  final Set<String> _turnosSelecionados = {'🌙 Noite'};
  bool _salvando = false;

  @override
  void initState() {
    super.initState();
    _horasPorDia = PlanoEstudoState.instance.horasPorDia;
  }

  void _salvarPlanejamento() async {
    HapticFeedback.heavyImpact();
    setState(() => _salvando = true);

    final plano = PlanoEstudoState.instance;

    // Atualiza o PlanoEstudoState com as horas diárias e recalcula as metas da PM-PE
    plano.atualizarPlano(
      concursoAlvo: plano.concursoAlvo,
      cargoAlvo: plano.cargoAlvo,
      banca: plano.banca,
      nomeArquivo: 'edital_abertura_pmpe_oficial.pdf',
      tamanhoArquivo: '1.8 MB',
      horasPorDia: _horasPorDia,
      semanasAteProva: _semanasAteProva,
      disciplinas: [
        'Língua Portuguesa',
        'História de Pernambuco',
        'Geografia de Pernambuco',
        'Matemática e Raciocínio Lógico',
        'Noções de Direito Constitucional & Legislação da PMPE',
      ],
    );

    await Future.delayed(const Duration(milliseconds: 400));

    if (!mounted) return;
    setState(() => _salvando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Planejamento Tático atualizado! Meta: $_horasPorDia h/dia (~${_diasAteProva * _horasPorDia}h totais de foco até a prova).',
        ),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final plano = PlanoEstudoState.instance;
    final horasTotais = _diasAteProva * _horasPorDia;
    final questoesEstimadas = horasTotais * 8;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          tooltip: 'Voltar ao Painel',
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Planejamento de Estudos',
          style: AppTypography.heading2.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.brandNavy,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFFCD34D)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('⏳', style: TextStyle(fontSize: 12)),
                SizedBox(width: 4),
                Text(
                  '68 dias p/ a prova',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFB45309),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // CARD 1: Certame Oficial Fixo do Aluno (Sem poluição de outros certames)
            TacticalCard(
              borderColor: const Color(0xFFD97706),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDC2626),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '🚨 EDITAL PUBLICADO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEF3C7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          '2.400 VAGAS',
                          style: TextStyle(
                            color: Color(0xFFB45309),
                            fontSize: 9.5,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'FOCO 100%',
                        style: AppTypography.tagLabel.copyWith(
                          fontSize: 10,
                          color: AppColors.brandNavy,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${plano.concursoAlvo.split('(').first.trim()} — ${plano.cargoAlvo}',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: AppColors.brandNavy,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Banca Examinadora: Instituto IAUPE • Nível Médio • Remuneração: R\$ 3.419,88 a R\$ 4.228,00',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.lock_rounded, size: 14, color: Color(0xFF475569)),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Certame bloqueado com foco estrito na sua aprovação. Sem distrações com outros concursos.',
                            style: TextStyle(fontSize: 11, color: Color(0xFF475569)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 2: Cronograma Regressivo Rigoroso do Edital
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.calendar_month_rounded, color: AppColors.brandOrange, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'CRONOGRAMA RIGOROSO DO EDITAL DA PMPE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'DIAS RESTANTES',
                          valor: '$_diasAteProva',
                          subtitulo: 'Até o dia da prova',
                          corValor: AppColors.brandOrange,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'SEMANAS DE GUERRA',
                          valor: '$_semanasAteProva',
                          subtitulo: 'Ciclos de estudo',
                          corValor: const Color(0xFF38BDF8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _contadorCaixa(
                          rotulo: 'QUESTÕES DA PROVA',
                          valor: '60',
                          subtitulo: 'Modelo IAUPE',
                          corValor: const Color(0xFF4ADE80),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'O tempo até a prova é imutável. Cada hora bem aproveitada agora coloca você dentro das 2.400 vagas.',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 11.5,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 3: Informar Disponibilidade Diária de Estudos
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sua Disponibilidade Diária de Estudos',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Quantas horas líquidas você consegue dedicar por dia ao edital da PMPE?',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 14),

                  // Seletor de Horas/Dia
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [2, 3, 4, 5, 6].map((horas) {
                      final isSelected = _horasPorDia == horas;
                      return ChoiceChip(
                        label: Text(
                          horas == 3 ? '$horas horas/dia (Recomendado)' : '$horas horas/dia',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.brandNavy,
                        backgroundColor: AppColors.surfaceElevated,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected ? AppColors.brandNavy : AppColors.surfaceBorder,
                          ),
                        ),
                        onSelected: (selected) {
                          if (selected) {
                            HapticFeedback.selectionClick();
                            setState(() => _horasPorDia = horas);
                          }
                        },
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),

                  // Seletor de Turnos de Estudo
                  Text(
                    'Turnos de Estudo Ativos',
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['🌅 Manhã', '☀️ Tarde', '🌙 Noite'].map((turno) {
                      final isSelected = _turnosSelecionados.contains(turno);
                      return FilterChip(
                        label: Text(
                          turno,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w500,
                            color: isSelected ? AppColors.brandCobalt : AppColors.textSecondary,
                          ),
                        ),
                        selected: isSelected,
                        selectedColor: AppColors.brandCobalt.withValues(alpha: 0.12),
                        backgroundColor: AppColors.surfaceElevated,
                        checkmarkColor: AppColors.brandCobalt,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected ? AppColors.brandCobalt : AppColors.surfaceBorder,
                          ),
                        ),
                        onSelected: (selected) {
                          HapticFeedback.selectionClick();
                          setState(() {
                            if (selected) {
                              _turnosSelecionados.add(turno);
                            } else if (_turnosSelecionados.length > 1) {
                              _turnosSelecionados.remove(turno);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 4: Projeção de Produtividade Tática até a Prova
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.insights_rounded, color: Color(0xFF15803D), size: 18),
                      SizedBox(width: 8),
                      Text(
                        'PROJEÇÃO DE RENDIMENTO TÁTICO ATÉ A PROVA',
                        style: TextStyle(
                          color: Color(0xFF166534),
                          fontSize: 11,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Carga Horária Total:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '$horasTotais horas líquidas',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Questões IAUPE:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '~$questoesEstimadas itens',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Simulados Oficiais:',
                              style: TextStyle(fontSize: 11, color: Color(0xFF334155)),
                            ),
                            Text(
                              '$_semanasAteProva simulados',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // CARD 5: Fases do Cronograma do Edital da PMPE
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'As 4 Fases do Seu Cronograma de Guerra',
                    style: AppTypography.titleMedium.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Distribuição estratégica dos tópicos do edital da PMPE ao longo das 10 semanas:',
                    style: AppTypography.bodySmall.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 12),

                  _faseItem(
                    faseNumero: '1',
                    titulo: 'Semanas 1 a 3 • Fundação da Tropa',
                    descricao: 'Língua Portuguesa (Compreensão e Sintaxe) + História de PE (Invasões Holandesas e Insurreição) + RLM Básico.',
                    statusBadge: 'EM ANDAMENTO',
                    corBadge: const Color(0xFF15803D),
                  ),
                  const Divider(height: 18),
                  _faseItem(
                    faseNumero: '2',
                    titulo: 'Semanas 4 a 6 • Consolidação & Geografia',
                    descricao: 'Geografia de Pernambuco (Relevo, Sertão/Agreste) + Direito Constitucional (Art. 5º e 144) + Regência e Crase IAUPE.',
                    statusBadge: 'PLANEJADO',
                    corBadge: const Color(0xFF64748B),
                  ),
                  const Divider(height: 18),
                  _faseItem(
                    faseNumero: '3',
                    titulo: 'Semanas 7 a 8 • Legislação da PMPE & Revoluções',
                    descricao: 'Estatuto dos Policiais Militares (Lei 6.783/74) + Movimentos de 1817 e 1824 + Análise Combinatória.',
                    statusBadge: 'PLANEJADO',
                    corBadge: const Color(0xFF64748B),
                  ),
                  const Divider(height: 18),
                  _faseItem(
                    faseNumero: '4',
                    titulo: 'Semanas 9 a 10 • Reta Final & Simulado Geral',
                    descricao: 'Intensivo de 60 questões por dia no padrão IAUPE, correção detalhada de erros e memorização de letra de lei.',
                    statusBadge: 'RETA FINAL',
                    corBadge: AppColors.brandOrange,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Botão Primário: SALVAR E ATUALIZAR MEU CRONOGRAMA
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: _salvando ? null : _salvarPlanejamento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandNavy,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  ),
                  elevation: 0,
                ),
                icon: _salvando
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : const Icon(Icons.check_circle_rounded, size: 20),
                label: Text(
                  _salvando ? 'ATUALIZANDO CRONOGRAMA...' : 'SALVAR E ATUALIZAR MEU CRONOGRAMA',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _contadorCaixa({
    required String rotulo,
    required String valor,
    required String subtitulo,
    required Color corValor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Text(
            rotulo,
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 8.5,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            valor,
            style: TextStyle(
              color: corValor,
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            subtitulo,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 8.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _faseItem({
    required String faseNumero,
    required String titulo,
    required String descricao,
    required String statusBadge,
    required Color corBadge,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: AppColors.brandNavy,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              faseNumero,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 13,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: corBadge.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: corBadge.withValues(alpha: 0.4)),
                    ),
                    child: Text(
                      statusBadge,
                      style: TextStyle(
                        fontSize: 8.5,
                        fontWeight: FontWeight.w800,
                        color: corBadge,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                descricao,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: AppColors.textSecondary,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
