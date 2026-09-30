import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../questoes/presentation/screens/catalogo_questoes_screen.dart';
import '../../../simulado/presentation/screens/simulado_cockpit_screen.dart';

/// Tela Principal do Aluno: "Meu Painel" (Dashboard de Alta Performance inspirado no QConcursos).
/// Apresenta métricas diárias, saldo líquido Cebraspe (C - E), atalho para simulados e certames de PE.
class DashboardScreen extends StatefulWidget {
  final String userName;
  final String concursoAlvo;

  const DashboardScreen({
    super.key,
    this.userName = 'Rudson Lima',
    this.concursoAlvo = 'PC-PE (Agente)',
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _filtroPeriodo = 'Hoje';
  String _concursoSelecionado = 'PC-PE';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        title: Row(
          children: [
            const TacticalOwlLogo(size: 32),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                style: AppTypography.heading2.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.2,
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
          ],
        ),
        actions: [
          // Badge de Ofensiva / Sequência de Estudos
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.brandOrange.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.brandOrange.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('🔥', style: TextStyle(fontSize: 12)),
                const SizedBox(width: 4),
                Text(
                  '12 dias',
                  style: AppTypography.tagLabel.copyWith(
                    fontSize: 11,
                    color: AppColors.brandOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Avatar do Aluno
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.brandNavy,
              child: Text(
                widget.userName.split(' ').map((n) => n[0]).take(2).join(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabeçalho da Página
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meu Painel',
                      style: AppTypography.headlineLarge.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Acompanhe seu ritmo de treino para os certames de Pernambuco.',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // CARD PRINCIPAL: "Olá, Rudson. Veja como está o seu desempenho" (Estilo QConcursos)
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              children: [
                                Text(
                                  'Olá, ${widget.userName.split(' ').first}.',
                                  style: AppTypography.titleMedium.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.brandCobalt.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: AppColors.brandCobalt.withValues(alpha: 0.3)),
                                  ),
                                  child: Text(
                                    widget.concursoAlvo,
                                    style: const TextStyle(
                                      color: AppColors.brandCobalt,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Fórmula Cebraspe oficial (Certo menos Errado).',
                              style: AppTypography.bodySmall.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Filtros de Período (Hoje, 7 dias, 30 dias, Sempre)
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.surfaceBorder),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: ['Hoje', '7 dias', '30 dias', 'Sempre'].map((p) {
                        final isSel = _filtroPeriodo == p;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _filtroPeriodo = p),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              decoration: BoxDecoration(
                                color: isSel ? AppColors.surface : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: isSel
                                    ? [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 1),
                                        ),
                                      ]
                                    : null,
                              ),
                              child: Text(
                                p,
                                textAlign: TextAlign.center,
                                style: AppTypography.bodySmall.copyWith(
                                  fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                                  color: isSel ? AppColors.textPrimary : AppColors.textSecondary,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 4 Métricas Adaptativas: 2x2 no Mobile (< 460px) e 1x4 no Desktop
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = constraints.maxWidth < 460;
                      if (isMobile) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _metricBox(
                                    titulo: 'RESOLVIDAS',
                                    valor: '42',
                                    subtitulo: '+14 que ontem',
                                    corValor: AppColors.textPrimary,
                                    corFundo: AppColors.surfaceElevated,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _metricBox(
                                    titulo: 'ACERTOS (+1)',
                                    valor: '36',
                                    subtitulo: '85.7% precisão',
                                    corValor: AppColors.success,
                                    corFundo: AppColors.successBackground,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _metricBox(
                                    titulo: 'ERROS (-1)',
                                    valor: '6',
                                    subtitulo: '-6 no Cebraspe',
                                    corValor: AppColors.error,
                                    corFundo: AppColors.errorBackground,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _metricBox(
                                    titulo: 'LÍQUIDA (C-E)',
                                    valor: '30.0',
                                    subtitulo: 'Corte: 36.0',
                                    corValor: AppColors.brandNavy,
                                    corFundo: AppColors.brandCobalt.withValues(alpha: 0.08),
                                    isMono: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Row(
                        children: [
                          Expanded(
                            child: _metricBox(
                              titulo: 'RESOLVIDAS',
                              valor: '42',
                              subtitulo: '+14 que ontem',
                              corValor: AppColors.textPrimary,
                              corFundo: AppColors.surfaceElevated,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _metricBox(
                              titulo: 'ACERTOS (+1)',
                              valor: '36',
                              subtitulo: '85.7% precisão',
                              corValor: AppColors.success,
                              corFundo: AppColors.successBackground,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _metricBox(
                              titulo: 'ERROS (-1)',
                              valor: '6',
                              subtitulo: '-6 no Cebraspe',
                              corValor: AppColors.error,
                              corFundo: AppColors.errorBackground,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _metricBox(
                              titulo: 'LÍQUIDA (C-E)',
                              valor: '30.0',
                              subtitulo: 'Corte: 36.0',
                              corValor: AppColors.brandNavy,
                              corFundo: AppColors.brandCobalt.withValues(alpha: 0.08),
                              isMono: true,
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 16),
                  const Divider(color: AppColors.surfaceBorder, height: 1),
                  const SizedBox(height: 12),

                  // Ação Direta de Estudo
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Objetivo sugerido: 18 questões de Proc. Penal',
                          style: AppTypography.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandCobalt,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const CatalogoQuestoesScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'RESOLVER QUESTÕES',
                          style: AppTypography.buttonText.copyWith(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // SEÇÃO: CONCURSOS EM EMINÊNCIA (PERNAMBUCO)
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  'CONCURSOS ALVO (PERNAMBUCO)',
                  style: AppTypography.tagLabel.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 0.8,
                  ),
                ),
                Text(
                  'Edital Iminente',
                  style: AppTypography.caption.copyWith(
                    color: AppColors.brandOrange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Card PC-PE
            _concursoCard(
              sigla: 'PC-PE',
              nome: 'Polícia Civil de Pernambuco',
              detalhe: 'Agente & Escrivão • 60 Itens Cebraspe • 4h30min',
              corBadge: AppColors.brandNavy,
              ativo: _concursoSelecionado == 'PC-PE',
              onTap: () => setState(() => _concursoSelecionado = 'PC-PE'),
              onIniciarSimulado: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SimuladoCockpitScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            // Card PM-PE
            _concursoCard(
              sigla: 'PM-PE',
              nome: 'Polícia Militar de Pernambuco',
              detalhe: 'Soldado & Oficial da PM • Disciplinas Gerais & Específicas',
              corBadge: const Color(0xFF15803D),
              ativo: _concursoSelecionado == 'PM-PE',
              onTap: () => setState(() => _concursoSelecionado = 'PM-PE'),
              onIniciarSimulado: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CatalogoQuestoesScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 8),

            // Card PP-PE
            _concursoCard(
              sigla: 'PP-PE',
              nome: 'Polícia Penal de Pernambuco',
              detalhe: 'SERES-PE • Agente de Segurança Penitenciária',
              corBadge: const Color(0xFFB45309),
              ativo: _concursoSelecionado == 'PP-PE',
              onTap: () => setState(() => _concursoSelecionado = 'PP-PE'),
              onIniciarSimulado: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CatalogoQuestoesScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.surface,
        elevation: 2,
        selectedIndex: 0,
        indicatorColor: AppColors.brandCobalt.withValues(alpha: 0.15),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard, color: AppColors.brandCobalt),
            label: 'Meu Painel',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book, color: AppColors.brandCobalt),
            label: 'Questões',
          ),
          NavigationDestination(
            icon: Icon(Icons.timer_outlined),
            selectedIcon: Icon(Icons.timer, color: AppColors.brandCobalt),
            label: 'Simulado',
          ),
        ],
        onDestinationSelected: (index) {
          if (index == 1) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CatalogoQuestoesScreen()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SimuladoCockpitScreen()),
            );
          }
        },
      ),
    );
  }

  Widget _metricBox({
    required String titulo,
    required String valor,
    required String subtitulo,
    required Color corValor,
    required Color corFundo,
    bool isMono = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      decoration: BoxDecoration(
        color: corFundo,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: AppTypography.tagLabel.copyWith(
              fontSize: 9,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            valor,
            style: isMono
                ? AppTypography.tabularDigits.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: corValor,
                  )
                : AppTypography.headlineLarge.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: corValor,
                  ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitulo,
            style: AppTypography.caption.copyWith(
              fontSize: 9,
              color: AppColors.textSecondary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _concursoCard({
    required String sigla,
    required String nome,
    required String detalhe,
    required Color corBadge,
    required bool ativo,
    required VoidCallback onTap,
    required VoidCallback onIniciarSimulado,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: TacticalCard(
        borderColor: ativo ? AppColors.brandOrange : AppColors.surfaceBorder,
        backgroundColor: ativo ? AppColors.surface : AppColors.surface,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: corBadge,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  sigla,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          nome,
                          style: AppTypography.titleMedium.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (ativo) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                          decoration: BoxDecoration(
                            color: AppColors.brandOrange.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'ATIVO',
                            style: AppTypography.tagLabel.copyWith(
                              fontSize: 9,
                              color: AppColors.brandOrange,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    detalhe,
                    style: AppTypography.bodySmall.copyWith(fontSize: 11),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.play_circle_fill, color: AppColors.brandCobalt, size: 28),
              tooltip: 'Iniciar Simulado',
              onPressed: onIniciarSimulado,
            ),
          ],
        ),
      ),
    );
  }
}
