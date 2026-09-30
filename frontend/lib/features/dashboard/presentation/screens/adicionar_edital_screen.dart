import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';

/// Tela de Processamento de Edital e Geração de Cronograma Adaptativo com IA.
/// Permite ao aluno selecionar um edital pré-mapeado ou enviar o próprio documento,
/// ajustando horas disponíveis para gerar a Trilha Tática de Estudos.
class AdicionarEditalScreen extends StatefulWidget {
  final String concursoPadrao;

  const AdicionarEditalScreen({
    super.key,
    this.concursoPadrao = 'PC-PE (Agente de Polícia)',
  });

  @override
  State<AdicionarEditalScreen> createState() => _AdicionarEditalScreenState();
}

class _AdicionarEditalScreenState extends State<AdicionarEditalScreen> {
  late String _concursoSelecionado;
  int _horasPorDia = 3;
  int _semanasAteProva = 12;
  bool _gerandoCronograma = false;
  bool _cronogramaGerado = false;
  String? _arquivoUploadNome;

  final List<String> _concursosDisponiveis = [
    'PC-PE (Agente de Polícia)',
    'PC-PE (Escrivão de Polícia)',
    'PM-PE (Soldado da Polícia Militar)',
    'PP-PE (Policial Penal - SERES)',
    'Outro Concurso (Upload de Edital)',
  ];

  @override
  void initState() {
    super.initState();
    _concursoSelecionado = widget.concursoPadrao;
  }

  void _simularUploadArquivo() {
    HapticFeedback.lightImpact();
    setState(() {
      _arquivoUploadNome = 'edital_abertura_pcpe_2024_cebraspe.pdf';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edital PDF carregado com sucesso para análise do motor de IA!'),
        backgroundColor: AppColors.brandCobalt,
      ),
    );
  }

  void _gerarCronograma() async {
    HapticFeedback.mediumImpact();
    setState(() {
      _gerandoCronograma = true;
    });

    await Future.delayed(const Duration(milliseconds: 900));

    if (mounted) {
      setState(() {
        _gerandoCronograma = false;
        _cronogramaGerado = true;
      });
    }
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
        title: Text(
          'Planejador Tático de Edital',
          style: AppTypography.heading3.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Banner de Apresentação
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.brandCobalt.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.brandCobalt.withValues(alpha: 0.2)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.brandCobalt,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.auto_awesome, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Edital Sintético com IA',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.brandNavy,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Mapeamos os tópicos mais cobrados do Cebraspe para criar sua rotina diária personalizada.',
                          style: AppTypography.bodySmall.copyWith(fontSize: 11.5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Card 1: Seleção do Concurso / Upload de Edital
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Selecione o Concurso ou Edital Alvo',
                    style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                    initialValue: _concursoSelecionado,
                    isExpanded: true,
                    style: AppTypography.bodyMedium.copyWith(color: AppColors.textPrimary),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.surfaceElevated,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.surfaceBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.surfaceBorder),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    ),
                    items: _concursosDisponiveis.map((c) {
                      return DropdownMenuItem(value: c, child: Text(c, overflow: TextOverflow.ellipsis));
                    }).toList(),
                    onChanged: (val) {
                      if (val != null) setState(() => _concursoSelecionado = val);
                    },
                  ),

                  // Área de Upload de Edital em PDF
                  if (_concursoSelecionado == 'Outro Concurso (Upload de Edital)' || _arquivoUploadNome != null) ...[
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: _simularUploadArquivo,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceElevated,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: _arquivoUploadNome != null ? AppColors.success : AppColors.brandCobalt,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _arquivoUploadNome != null ? Icons.check_circle : Icons.upload_file_rounded,
                              color: _arquivoUploadNome != null ? AppColors.success : AppColors.brandCobalt,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                _arquivoUploadNome ?? 'Toque para anexar o PDF do seu Edital',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: _arquivoUploadNome != null ? AppColors.success : AppColors.brandCobalt,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Card 2: Horas Disponíveis e Semanas até a Prova
            TacticalCard(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '2. Sua Disponibilidade de Tempo',
                    style: AppTypography.titleMedium.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  // Seletor de Horas/Dia
                  Text(
                    'Tempo de estudo por dia: $_horasPorDia horas',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [2, 3, 4, 6].map((h) {
                      final isSel = _horasPorDia == h;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isSel ? AppColors.brandCobalt : AppColors.surfaceElevated,
                              foregroundColor: isSel ? Colors.white : AppColors.textPrimary,
                              side: BorderSide(color: isSel ? AppColors.brandCobalt : AppColors.surfaceBorder),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            onPressed: () => setState(() => _horasPorDia = h),
                            child: Text('${h}h/dia', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 14),

                  // Semanas até a prova
                  Text(
                    'Duração da preparação: $_semanasAteProva semanas (~${_semanasAteProva ~/ 4} meses)',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [8, 12, 16, 24].map((s) {
                      final isSel = _semanasAteProva == s;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isSel ? AppColors.brandNavy : AppColors.surfaceElevated,
                              foregroundColor: isSel ? Colors.white : AppColors.textPrimary,
                              side: BorderSide(color: isSel ? AppColors.brandNavy : AppColors.surfaceBorder),
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                            ),
                            onPressed: () => setState(() => _semanasAteProva = s),
                            child: Text('$s sem.', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Botão Principal de Geração
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                onPressed: _gerandoCronograma ? null : _gerarCronograma,
                icon: _gerandoCronograma
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Icon(Icons.flash_on_rounded),
                label: Text(
                  _gerandoCronograma ? 'PROCESSANDO EDITAL...' : 'GERAR TRILHA TÁTICA COM IA',
                  style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13, letterSpacing: 0.8),
                ),
              ),
            ),

            // Exibição da Trilha Tática Gerada
            if (_cronogramaGerado) ...[
              const SizedBox(height: 24),
              Text(
                'Sua Trilha Tática Oficial',
                style: AppTypography.heading2.copyWith(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(
                'Cronograma calculado com base no peso real das disciplinas da banca Cebraspe:',
                style: AppTypography.bodySmall,
              ),
              const SizedBox(height: 12),

              // Card de Resumo Estatístico do Plano
              TacticalCard(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _resumoStat('HORAS TOTAIS', '${_horasPorDia * 7 * _semanasAteProva}h', AppColors.brandNavy),
                    _resumoStat('METAS/DIA', '25 itens', AppColors.brandOrange),
                    _resumoStat('SIMULADOS', '${_semanasAteProva ~/ 2} provas', AppColors.success),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Distribuição Semanal
              _diaCronograma(
                dia: 'SEGUNDA-FEIRA',
                disciplina1: 'Língua Portuguesa (2h)',
                topico1: 'Crase & Regência Verbal • 15 questões',
                disciplina2: 'Direito Penal (1h)',
                topico2: 'Crimes Contra a Vida • 10 questões',
              ),
              const SizedBox(height: 8),
              _diaCronograma(
                dia: 'TERÇA-FEIRA',
                disciplina1: 'Direito Processual Penal (2h)',
                topico1: 'Inquérito Policial (Art. 17 CPP) • 15 questões',
                disciplina2: 'Noções de Informática (1h)',
                topico2: 'Segurança da Informação (Ransomware) • 10 questões',
              ),
              const SizedBox(height: 8),
              _diaCronograma(
                dia: 'QUARTA-FEIRA',
                disciplina1: 'Direito Constitucional (2h)',
                topico1: 'Segurança Pública (Art. 144 CF) • 15 questões',
                disciplina2: 'Língua Portuguesa (1h)',
                topico2: 'Partícula SE & Voz Passiva • 10 questões',
              ),
              const SizedBox(height: 8),
              _diaCronograma(
                dia: 'SÁBADO TÁTICO',
                disciplina1: 'Simulado Oficial Cebraspe (4h30)',
                topico1: 'Caderno 60 itens com cronômetro real',
                disciplina2: 'Revisão de Gabarito',
                topico2: 'Auditoria de Erros e Saldo Líquido (C - E)',
                destaque: true,
              ),

              const SizedBox(height: 20),

              // Botão de Aplicação do Cronograma
              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.brandNavy,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Trilha Tática ativada! Suas metas diárias foram sincronizadas.'),
                        backgroundColor: AppColors.success,
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'ATIVAR CRONOGRAMA NO MEU PAINEL',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ],
        ),
      ),
    );
  }

  Widget _resumoStat(String label, String valor, Color cor) {
    return Column(
      children: [
        Text(valor, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: cor)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 9.5, color: AppColors.textSecondary, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _diaCronograma({
    required String dia,
    required String disciplina1,
    required String topico1,
    required String disciplina2,
    required String topico2,
    bool destaque = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: destaque ? AppColors.brandOrange.withValues(alpha: 0.08) : AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: destaque ? AppColors.brandOrange : AppColors.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dia,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: destaque ? AppColors.brandOrange : AppColors.brandCobalt,
                  letterSpacing: 0.8,
                ),
              ),
              if (destaque)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.brandOrange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('FOCO CEBRASPE', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text('• $disciplina1: $topico1', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
          const SizedBox(height: 3),
          Text('• $disciplina2: $topico2', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        ],
      ),
    );
  }
}
