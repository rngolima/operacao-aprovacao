import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/pcpe_badge.dart';
import '../../../../core/widgets/tactical_owl_logo.dart';
import '../../../simulado/presentation/screens/simulado_cockpit_screen.dart';
import '../../../../core/network/api_client.dart';
import '../../data/datasources/questoes_remote_data_source.dart';
import '../../data/repositories/questoes_repository_impl.dart';
import '../controllers/questoes_controller.dart';
import '../widgets/disciplina_filter_bar.dart';
import '../widgets/questao_card_widget.dart';

/// Tela do Catalogo de Questoes Cebraspe e Modo Treino Avulso do CRAVOU.
class CatalogoQuestoesScreen extends StatefulWidget {
  final QuestoesController? controller;

  const CatalogoQuestoesScreen({
    super.key,
    this.controller,
  });

  @override
  State<CatalogoQuestoesScreen> createState() => _CatalogoQuestoesScreenState();
}

class _CatalogoQuestoesScreenState extends State<CatalogoQuestoesScreen> {
  late final QuestoesController _controller;
  late final bool _internalController;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
      _internalController = false;
    } else {
      _controller = QuestoesController(
        QuestoesRepositoryImpl(
          remoteDataSource: QuestoesRemoteDataSource(apiClient: ApiClient()),
        ),
      );
      _internalController = true;
    }

    if (_controller.questoes.isEmpty && !_controller.isLoading) {
      _controller.inicializar();
    }
    _controller.addListener(_onControllerUpdate);
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    if (_internalController) {
      _controller.dispose();
    }
    _searchController.dispose();
    super.dispose();
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    final totalRespondidas = controller.totalAcertos + controller.totalErros;
    final aproveitamento = totalRespondidas > 0
        ? ((controller.totalAcertos / totalRespondidas) * 100).toStringAsFixed(0)
        : '0';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TacticalOwlLogo(size: 32),
            SizedBox(width: AppSpacing.xs),
            RichText(
              text: TextSpan(
                style: AppTypography.heading2.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.textPrimary,
                ),
                children: const [
                  TextSpan(text: 'CRA'),
                  TextSpan(text: 'V', style: TextStyle(color: AppColors.brandOrange)),
                  TextSpan(text: 'OU'),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Text('✕', style: TextStyle(color: AppColors.textMuted, fontSize: 12)),
            SizedBox(width: AppSpacing.sm),
            const PcpeBadge(size: 28),
          ],
        ),
        centerTitle: true,
        actions: [
          // Botao para navegar ao Cockpit do Simulado Oficial (Passo 4)
          IconButton(
            tooltip: 'Simulado Oficial (Cockpit)',
            icon: const Icon(Icons.timer_outlined, color: AppColors.brandOrange),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SimuladoCockpitScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner de Telemetria e Desempenho do Treino
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            color: AppColors.surfaceElevated.withValues(alpha: 0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _TelemetryBadge(
                  label: 'ACERTOS',
                  value: '${controller.totalAcertos}',
                  color: AppColors.successBorder,
                ),
                _TelemetryBadge(
                  label: 'ERROS',
                  value: '${controller.totalErros}',
                  color: AppColors.errorBorder,
                ),
                _TelemetryBadge(
                  label: 'APROVEITAMENTO',
                  value: '$aproveitamento%',
                  color: AppColors.brandOrange,
                ),
              ],
            ),
          ),

          // Campo de Busca Textual
          Padding(
            padding: EdgeInsets.all(AppSpacing.md),
            child: TextField(
              controller: _searchController,
              onChanged: (text) => controller.buscar(text),
              style: AppTypography.bodyMedium,
              decoration: InputDecoration(
                hintText: 'Filtrar por tema (ex: crase, inquérito, homicídio)...',
                hintStyle: AppTypography.bodySmall,
                prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textSecondary, size: 20),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          controller.buscar('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.surface,
                contentPadding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  borderSide: const BorderSide(color: AppColors.surfaceBorder),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
                  borderSide: const BorderSide(color: AppColors.surfaceBorder),
                ),
              ),
            ),
          ),

          // Barra de Filtros de Disciplinas
          if (controller.disciplinas.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(bottom: AppSpacing.sm),
              child: DisciplinaFilterBar(
                disciplinas: controller.disciplinas,
                disciplinaSelecionada: controller.disciplinaAtiva,
                onSelecionar: (d) => controller.selecionarDisciplina(d),
              ),
            ),

          // Lista de Questoes
          Expanded(
            child: controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.brandCobalt),
                    ),
                  )
                : controller.questoes.isEmpty
                    ? Center(
                        child: Text(
                          'Nenhuma questão encontrada para este filtro.',
                          style: AppTypography.bodyMedium,
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 80),
                        itemCount: controller.questoes.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 16),
                        itemBuilder: (context, index) {
                          final questao = controller.questoes[index];
                          return QuestaoCardWidget(
                            questao: questao,
                            index: index + 1,
                            respostaSelecionada: controller.respostaDoAluno(questao.id),
                            gabaritoRevelado: controller.isGabaritoRevelado(questao.id),
                            onResponder: (resp) => controller.responder(questao, resp),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _TelemetryBadge extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _TelemetryBadge({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTypography.heading2.copyWith(
            color: color,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 2),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: AppTypography.caption.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
