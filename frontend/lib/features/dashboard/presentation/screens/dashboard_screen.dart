import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../../core/state/plano_estudo_state.dart';
import '../../../questoes/presentation/screens/catalogo_questoes_screen.dart';
import '../../../simulado/presentation/screens/simulado_cockpit_screen.dart';
import '../../../cursos/presentation/screens/guia_estudos_screen.dart';
import '../../../monetizacao/presentation/widgets/plano_pro_modal.dart';
import 'planejador_tatico_screen.dart';

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

  @override
  void initState() {
    super.initState();
    PlanoEstudoState.instance.addListener(_onPlanoMudou);
  }

  @override
  void dispose() {
    PlanoEstudoState.instance.removeListener(_onPlanoMudou);
    super.dispose();
  }

  void _onPlanoMudou() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final plano = PlanoEstudoState.instance;
    final nomeUpper = plano.concursoAlvo.toUpperCase();
    final isPmpe = nomeUpper.contains('MILITAR') || nomeUpper.contains('PMPE') || nomeUpper.contains('PM-PE');
    final isPppe = nomeUpper.contains('PENAL') || nomeUpper.contains('PPPE') || nomeUpper.contains('PP-PE');
    final String sigla = isPmpe ? 'PM-PE' : isPppe ? 'PP-PE' : 'PC-PE';
    final cargoCurto = plano.cargoAlvo.split(' ').first;

    // Iniciais do Candidato para o avatar (ex: RL)
    final iniciais = widget.userName.trim().isNotEmpty
        ? widget.userName.trim().split(' ').map((n) => n.isNotEmpty ? n[0] : '').take(2).join().toUpperCase()
        : 'RL';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        titleSpacing: 12,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TacticalOwlLogo(size: 30),
            const SizedBox(width: 6),
            RichText(
              text: TextSpan(
                style: AppTypography.heading2.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.1,
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
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Center(
              child: Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E3A8A),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    iniciais,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.5,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
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
            // Barra de Perfil e Sequência de Guerra (Foguinho destacado e sem sobreposição com o logo)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Row(
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E3A8A),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        iniciais,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.userName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'Foco: $sigla $cargoCurto • ${plano.banca}',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7ED),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFFFEDD5), width: 1.2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('🔥', style: TextStyle(fontSize: 13)),
                        SizedBox(width: 4),
                        Text(
                          '12 dias seguidos',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF9A3412),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Banner de Contagem Regressiva para a Prova & Foco Militar
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E3A8A).withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.brandOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text('⏳', style: TextStyle(fontSize: 14)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isPmpe
                              ? 'CONTAGEM REGRESSIVA: 144 DIAS PARA A PROVA DA PM-PE (21/02/2027)'
                              : isPppe
                                  ? 'CONTAGEM REGRESSIVA: 58 DIAS PARA A PROVA DA PP-PE'
                                  : 'CONTAGEM REGRESSIVA: 45 DIAS PARA A PROVA DA PC-PE',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11.5,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          isPmpe
                              ? 'Edital publicado em 30/09 • Banca Instituto AOCP • Meta: ${plano.horasPorDia}h/dia (Semana 1 de 21).'
                              : 'Mantenha o foco diário e a disciplina tática • Meta: ${plano.horasPorDia}h/dia rumo à vaga de ${plano.cargoAlvo}.',
                          style: const TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Card de Inscrição Oficial Homologada do Candidato (Responsivo sem vazar do quadro)
            if (isPmpe)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.verified_rounded, color: Color(0xFF16A34A), size: 18),
                        const SizedBox(width: 6),
                        const Expanded(
                          child: Text(
                            'INSCRIÇÃO HOMOLOGADA • Nº 2026-PMPE-08942',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF166534),
                              letterSpacing: 0.3,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFF86EFAC)),
                          ),
                          child: const Text(
                            'OFICIAL',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF15803D),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Soldado Combatente da PMPE • 1.250 Vagas • Banca Instituto AOCP',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF15803D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => const PlanejadorTaticoScreen()),
                          );
                        },
                        icon: const Icon(Icons.calendar_month_rounded, size: 14, color: Color(0xFF166534)),
                        label: const Text(
                          'ACESSAR CRONOGRAMA DE 21 SEMANAS',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF166534),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFF86EFAC)),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Cabeçalho da Página
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
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
                      'Acompanhe seu ritmo de treino exclusivo para $sigla (${plano.cargoAlvo}).',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const PlanejadorTaticoScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.calendar_month_rounded, size: 16),
                  label: const Text('Planejamento de Estudos'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brandNavy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Banner de Cota Diária & Upgrade PRO (Monetização)
            GestureDetector(
              onTap: () => PlanoProModal.show(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E3A8A),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.workspace_premium, color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Plano Gratuito: ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              const Text(
                                '14/20 questões hoje',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFD97706),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Toque para destravar acesso ilimitado por apenas R\$ 19,90/mês',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Color(0xFF1E3A8A), size: 14),
                  ],
                ),
              ),
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
                                    '${plano.concursoAlvo.split('(').first.trim()} • ${plano.cargoAlvo}',
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
                              'Banca ${plano.banca} • ${plano.horasPorDia}h/dia • ${plano.nomeArquivoEdital != null ? "Edital: ${plano.nomeArquivoEdital!}" : "Trilha Oficial Ativa"}',
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
                                    subtitulo: isPmpe ? 'Taxa de Erro: 14.3%' : '-6 no Cebraspe',
                                    corValor: AppColors.error,
                                    corFundo: AppColors.errorBackground,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _metricBox(
                                    titulo: isPmpe ? 'PONTOS PM-PE' : 'LÍQUIDA (C-E)',
                                    valor: '36.0',
                                    subtitulo: isPmpe ? 'Corte Previsto: 42.0' : 'Corte: 36.0',
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
                              subtitulo: isPmpe ? 'Taxa de Erro: 14.3%' : '-6 no Cebraspe',
                              corValor: AppColors.error,
                              corFundo: AppColors.errorBackground,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: _metricBox(
                              titulo: isPmpe ? 'PONTOS PM-PE' : 'LÍQUIDA (C-E)',
                              valor: '36.0',
                              subtitulo: isPmpe ? 'Corte Previsto: 42.0' : 'Corte: 36.0',
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
                          isPmpe
                              ? 'Objetivo sugerido: 20 questões de História de Pernambuco (Instituto AOCP)'
                              : isPppe
                                  ? 'Objetivo sugerido: 18 questões de Legislação Penitenciária (LEP)'
                                  : 'Objetivo sugerido: 18 questões de Processo Penal (Cebraspe)',
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

            // CARD DESTAQUE: META TÁTICA DE HOJE
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.brandOrange.withValues(alpha: 0.5), width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.brandOrange.withValues(alpha: 0.08),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.brandOrange,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('🔥', style: TextStyle(fontSize: 12)),
                            const SizedBox(width: 4),
                            Text(
                              'META DE HOJE • ${plano.metaDeHoje.diaSemana.toUpperCase()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${plano.horasPorDia}h de foco diário',
                        style: const TextStyle(
                          fontSize: 11.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.brandNavy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Seu cronograma inteligente para vencer o edital de ${plano.cargoAlvo}:',
                    style: AppTypography.caption.copyWith(color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 10),

                  // Matéria 1
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.surfaceBorder),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_outline, color: AppColors.brandCobalt, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plano.metaDeHoje.disciplina1,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                plano.metaDeHoje.topico1,
                                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Matéria 2
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.surfaceBorder),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle_outline, color: AppColors.brandCobalt, size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plano.metaDeHoje.disciplina2,
                                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                plano.metaDeHoje.topico2,
                                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Botões de Ação da Meta
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => GuiaEstudosScreen(
                                  disciplinasFoco: [
                                    plano.metaDeHoje.disciplina1,
                                    plano.metaDeHoje.disciplina2,
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.school, size: 16),
                          label: const Text('ESTUDAR NO GUIA', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.brandCobalt,
                            side: const BorderSide(color: AppColors.brandCobalt),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CatalogoQuestoesScreen(
                                  disciplinaFoco: plano.metaDeHoje.disciplina1,
                                  temaFoco: plano.metaDeHoje.topico1,
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow, size: 16),
                          label: Text(
                            'QUESTÕES DO DIA (${plano.metaDeHoje.metaQuestoes})',
                            style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.brandNavy,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // SEÇÃO: CONCURSO ALVO ATIVO (FOCO 100% - APENAS O ESCOLHIDO PELO ALUNO)
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 4,
              children: [
                Text(
                  'SEU CONCURSO ALVO (FOCO 100%)',
                  style: AppTypography.tagLabel.copyWith(
                    color: AppColors.textPrimary,
                    letterSpacing: 0.8,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const PlanejadorTaticoScreen()),
                    );
                  },
                  icon: const Icon(Icons.tune_rounded, size: 14, color: AppColors.brandCobalt),
                  label: const Text(
                    'Ajustar Cronograma',
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.brandCobalt,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Card Único Exclusivo do Concurso Alvo Ativo
            _concursoCardUnico(context, plano),

            const SizedBox(height: 16),

            // SEÇÃO: GUIA DE ESTUDOS DO EDITAL (CURSOS & RESUMOS ESTILO QCONCURSOS)
            TacticalCard(
              padding: const EdgeInsets.all(16),
              borderColor: AppColors.brandCobalt.withValues(alpha: 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.brandCobalt.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.school, color: AppColors.brandCobalt, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guia de Estudos & Reta Final',
                              style: AppTypography.titleMedium.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$sigla • ${plano.cargoAlvo} • Baseado no Edital ${plano.banca}',
                              style: AppTypography.caption.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    isPmpe
                        ? 'Acesse resumos teóricos direcionados (Língua Portuguesa, História de PE, RLM, Informática, Direito Constitucional e Direitos Humanos/Legislação) e pratique simulados oficiais do Instituto AOCP para Soldado da PMPE.'
                        : isPppe
                            ? 'Acesse resumos teóricos direcionados (Legislação Penitenciária, Direitos Humanos, Penal) e pratique questões reais para Policial Penal.'
                            : 'Acesse resumos teóricos direcionados (Português, Penal, Processo Penal e Legislação) e pratique questões reais associadas a cada aula.',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 14),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const GuiaEstudosScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.menu_book, size: 16),
                    label: Text('ABRIR GUIA DE ESTUDOS DE $sigla'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.brandCobalt,
                      side: const BorderSide(color: AppColors.brandCobalt),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
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
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school, color: AppColors.brandCobalt),
            label: 'Guia/Cursos',
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
              MaterialPageRoute(builder: (_) => const GuiaEstudosScreen()),
            );
          } else if (index == 2) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CatalogoQuestoesScreen()),
            );
          } else if (index == 3) {
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



  Widget _concursoCardUnico(BuildContext context, PlanoEstudoState plano) {
    final nomeUpper = plano.concursoAlvo.toUpperCase();
    final isPmpe = nomeUpper.contains('MILITAR') || nomeUpper.contains('PMPE') || nomeUpper.contains('PM-PE');
    final isPppe = nomeUpper.contains('PENAL') || nomeUpper.contains('PPPE') || nomeUpper.contains('PP-PE');

    final String sigla = isPmpe ? 'PM-PE' : isPppe ? 'PP-PE' : 'PC-PE';
    final Color corBadge = isPmpe ? const Color(0xFF15803D) : isPppe ? const Color(0xFFB45309) : AppColors.brandNavy;
    final String detalhe = '${plano.cargoAlvo} • Banca ${plano.banca} • ${plano.horasPorDia}h/dia';

    return TacticalCard(
      borderColor: AppColors.brandOrange,
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
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
                      fontSize: 12,
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
                            plano.concursoAlvo,
                            style: AppTypography.titleMedium.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.brandOrange.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'SEU ALVO 100%',
                            style: AppTypography.tagLabel.copyWith(
                              fontSize: 9,
                              color: AppColors.brandOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Text(
                      detalhe,
                      style: AppTypography.bodySmall.copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (plano.nomeArquivoEdital != null) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(Icons.picture_as_pdf, color: AppColors.success, size: 12),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              'Edital Ativo: ${plano.nomeArquivoEdital!} (${plano.tamanhoArquivoEdital ?? ""})',
                              style: const TextStyle(fontSize: 10.5, color: AppColors.success, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: AppColors.surfaceBorder),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const PlanejadorTaticoScreen()),
                  );
                },
                icon: const Icon(Icons.tune, size: 14, color: AppColors.brandCobalt),
                label: const Text(
                  'Ajustar Planejador Tático',
                  style: TextStyle(fontSize: 11, color: AppColors.brandCobalt, fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandCobalt,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  elevation: 0,
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SimuladoCockpitScreen()),
                  );
                },
                icon: const Icon(Icons.play_circle_fill, size: 16),
                label: const Text(
                  'SIMULADO DO ALVO',
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
