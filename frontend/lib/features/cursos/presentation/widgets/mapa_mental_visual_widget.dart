import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/mapa_mental_model.dart';

/// Widget de Renderização de Mapa Mental Visual Inspirado nos Mapas Mentais de Concursos.
/// Apresenta Núcleo Central, Linhas Conectoras Bézier personalizadas,
/// Ramos Radiais com cores temáticas distintas e sub-balões com mnemônicos e exemplos.
class MapaMentalVisualWidget extends StatefulWidget {
  final MapaMentalData mapaMental;
  final VoidCallback? onIrParaQuestoes;

  const MapaMentalVisualWidget({
    super.key,
    required this.mapaMental,
    this.onIrParaQuestoes,
  });

  @override
  State<MapaMentalVisualWidget> createState() => _MapaMentalVisualWidgetState();
}

class _MapaMentalVisualWidgetState extends State<MapaMentalVisualWidget> {
  bool _modoVisual = true; // true = Diagrama Visual; false = Fichas Táticas
  double _zoomEscala = 1.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1. BARRA SUPERIOR DE CONTROLES DO MAPA MENTAL
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: AppColors.surface,
            border: Border(bottom: BorderSide(color: AppColors.surfaceBorder)),
          ),
          child: Row(
            children: [
              // Seletor de Modo: Diagrama vs Fichas
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceElevated,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.surfaceBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _botaoModo(
                      label: 'Diagrama Visual',
                      icone: Icons.hub_rounded,
                      selecionado: _modoVisual,
                      onTap: () => setState(() => _modoVisual = true),
                    ),
                    _botaoModo(
                      label: 'Fichas Táticas',
                      icone: Icons.view_agenda_rounded,
                      selecionado: !_modoVisual,
                      onTap: () => setState(() => _modoVisual = false),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // Controles de Zoom (no modo visual)
              if (_modoVisual) ...[
                IconButton(
                  tooltip: 'Diminuir Zoom',
                  icon: const Icon(Icons.remove_circle_outline, size: 20, color: AppColors.textSecondary),
                  onPressed: () => setState(() => _zoomEscala = (_zoomEscala - 0.1).clamp(0.8, 1.4)),
                ),
                Text(
                  '${(_zoomEscala * 100).toInt()}%',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                ),
                IconButton(
                  tooltip: 'Aumentar Zoom',
                  icon: const Icon(Icons.add_circle_outline, size: 20, color: AppColors.textSecondary),
                  onPressed: () => setState(() => _zoomEscala = (_zoomEscala + 0.1).clamp(0.8, 1.4)),
                ),
              ],
            ],
          ),
        ),

        // 2. CONTEÚDO PRINCIPAL DO MAPA MENTAL
        Expanded(
          child: _modoVisual
              ? _buildDiagramaVisual(context)
              : _buildFichasTaticas(context),
        ),
      ],
    );
  }

  Widget _botaoModo({
    required String label,
    required IconData icone,
    required bool selecionado,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selecionado ? AppColors.brandCobalt : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icone,
              size: 15,
              color: selecionado ? Colors.white : AppColors.textSecondary,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: selecionado ? FontWeight.bold : FontWeight.w600,
                color: selecionado ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ========================================================================
  // MODO 1: DIAGRAMA VISUAL COM NÚCLEO CENTRAL E RAMOS CONECTADOS
  // ========================================================================
  Widget _buildDiagramaVisual(BuildContext context) {
    final mapa = widget.mapaMental;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Transform.scale(
        scale: _zoomEscala,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            // ALERTA DE REGRA DE OURO NO TOPO DO MAPA
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFFFFBEB),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFFDE68A), width: 1.2),
              ),
              child: Row(
                children: [
                  const Text('🎯', style: TextStyle(fontSize: 22)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'REGRA DE OURO DA BANCA',
                          style: TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFFB45309),
                            letterSpacing: 0.4,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          mapa.regraDeOuro,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF78350F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // NÚCLEO CENTRAL DO MAPA MENTAL
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E3A8A).withValues(alpha: 0.35),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                  border: Border.all(color: const Color(0xFF60A5FA), width: 2),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2563EB),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'CONCEITO CENTRAL DO MAPA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 9.5,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mapa.conceitoCentral,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      mapa.titulo,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF93C5FD),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            // CONECTOR VISUAL (LINHA VERTICAL COM RAMIFICAÇÃO)
            CustomPaint(
              size: const Size(double.infinity, 32),
              painter: _RamoConectorPainter(totalRamos: mapa.ramos.length),
            ),

            const SizedBox(height: 8),

            // OS 4 RAMOS RADIAIS ORGANIZADOS EM GRADE RESPONSIVA
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;
                if (isWide) {
                  return Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: mapa.ramos.map((ramo) {
                      return SizedBox(
                        width: (constraints.maxWidth - 20) / 2,
                        child: _buildRamoCardVisual(ramo),
                      );
                    }).toList(),
                  );
                } else {
                  return Column(
                    children: mapa.ramos.map((ramo) => Padding(
                      padding: const EdgeInsets.only(bottom: 14.0),
                      child: _buildRamoCardVisual(ramo),
                    )).toList(),
                  );
                }
              },
            ),

            const SizedBox(height: 24),

            if (widget.onIrParaQuestoes != null)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brandNavy,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: widget.onIrParaQuestoes,
                  icon: const Icon(Icons.quiz_outlined, size: 20),
                  label: const Text(
                    'PRATICAR QUESTÕES DESTE MAPA',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
                  ),
                ),
              ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRamoCardVisual(MapaMentalRamo ramo) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ramo.corRamo, width: 2),
        boxShadow: [
          BoxShadow(
            color: ramo.corRamo.withValues(alpha: 0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Cabeçalho do Ramo com Cor Marcante
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: ramo.corRamo,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(ramo.icone, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ramo.tituloRamo.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Text(
                        ramo.subtitulo,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 10.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Itens (Folhas) do Ramo
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: ramo.itens.map((item) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: ramo.corRamo.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ramo.corRamo.withValues(alpha: 0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_right_rounded, color: ramo.corRamo, size: 20),
                          Expanded(
                            child: Text(
                              item.titulo,
                              style: TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: ramo.corRamo,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Text(
                          item.descricao,
                          style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.textPrimary,
                            height: 1.35,
                          ),
                        ),
                      ),
                      if (item.mnemonico != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: const Color(0xFFFDE68A)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('💡', style: TextStyle(fontSize: 11)),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  item.mnemonico!,
                                  style: const TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xFF92400E),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (item.exemplo != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceElevated,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '📌 Ex: ${item.exemplo}',
                            style: const TextStyle(
                              fontSize: 10.5,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // ========================================================================
  // MODO 2: FICHAS TÁTICAS (CARDS EXPANSÍVEIS)
  // ========================================================================
  Widget _buildFichasTaticas(BuildContext context) {
    final mapa = widget.mapaMental;

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: mapa.ramos.length,
      itemBuilder: (context, index) {
        final ramo = mapa.ramos[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: ramo.corRamo.withValues(alpha: 0.3)),
          ),
          child: ExpansionTile(
            initiallyExpanded: true,
            leading: Icon(ramo.icone, color: ramo.corRamo),
            title: Text(
              ramo.tituloRamo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
                color: ramo.corRamo,
              ),
            ),
            subtitle: Text(
              ramo.subtitulo,
              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
            children: ramo.itens.map((item) {
              return ListTile(
                title: Text(item.titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(item.descricao, style: const TextStyle(fontSize: 11.5)),
                    if (item.mnemonico != null) ...[
                      const SizedBox(height: 4),
                      Text('💡 Mnemônico: ${item.mnemonico}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFB45309))),
                    ],
                    if (item.exemplo != null) ...[
                      const SizedBox(height: 2),
                      Text('📌 Exemplo: ${item.exemplo}', style: const TextStyle(fontSize: 11, fontStyle: FontStyle.italic, color: AppColors.textSecondary)),
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

/// CustomPainter para desenhar as linhas de conexão curvas do mapa mental
class _RamoConectorPainter extends CustomPainter {
  final int totalRamos;

  const _RamoConectorPainter({required this.totalRamos});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF60A5FA).withValues(alpha: 0.6)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final centerX = size.width / 2;

    // Linha central descendo
    canvas.drawLine(Offset(centerX, 0), Offset(centerX, size.height * 0.5), paint);

    // Linha horizontal distribuindo para os lados
    canvas.drawLine(
      Offset(centerX - size.width * 0.35, size.height * 0.5),
      Offset(centerX + size.width * 0.35, size.height * 0.5),
      paint,
    );

    // Pernas descendo para os ramos
    canvas.drawLine(
      Offset(centerX - size.width * 0.35, size.height * 0.5),
      Offset(centerX - size.width * 0.35, size.height),
      paint,
    );
    canvas.drawLine(
      Offset(centerX + size.width * 0.35, size.height * 0.5),
      Offset(centerX + size.width * 0.35, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
