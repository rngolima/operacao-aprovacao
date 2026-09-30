import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../../core/state/plano_estudo_state.dart';

/// Tela Administrativa para Carregar, Analisar por IA e Publicar Editais Oficiais
class UploadEditalScreen extends StatefulWidget {
  const UploadEditalScreen({super.key});

  @override
  State<UploadEditalScreen> createState() => _UploadEditalScreenState();
}

class _UploadEditalScreenState extends State<UploadEditalScreen> {
  String? _nomeArquivoSelecionado;
  String? _tamanhoArquivo;
  bool _processandoIA = false;
  bool _editalAnalisado = false;
  bool _publicando = false;

  // Controladores do Formulário de Edital Extraído
  final _concursoCtrl = TextEditingController(text: 'PM-PE (Polícia Militar de Pernambuco)');
  final _cargoCtrl = TextEditingController(text: 'Soldado da Polícia Militar');
  final _bancaCtrl = TextEditingController(text: 'Instituto AOCP');
  final _vagasCtrl = TextEditingController(text: '1.250 Vagas');
  final _remuneracaoCtrl = TextEditingController(text: 'R\$ 5.617,92');
  final _dataProvaCtrl = TextEditingController(text: '21/02/2027');
  final _questoesCtrl = TextEditingController(text: '60 Questões (A-E) + Redação');

  final List<String> _disciplinasExtraidas = [
    'Língua Portuguesa (10 questões)',
    'História de Pernambuco (10 questões)',
    'Raciocínio Lógico Matemático (10 questões)',
    'Noções de Informática (10 questões)',
    'Direito Constitucional (10 questões)',
    'Direitos Humanos e Legislação Extravagante (10 questões)',
    'Prova Discursiva (Redação - 40 pontos)',
  ];

  @override
  void dispose() {
    _concursoCtrl.dispose();
    _cargoCtrl.dispose();
    _bancaCtrl.dispose();
    _vagasCtrl.dispose();
    _remuneracaoCtrl.dispose();
    _dataProvaCtrl.dispose();
    _questoesCtrl.dispose();
    super.dispose();
  }

  void _selecionarArquivo() async {
    HapticFeedback.selectionClick();
    setState(() {
      _processandoIA = true;
      _nomeArquivoSelecionado = 'Edital_Oficial_PMPE_AOCP_2026_Completo.pdf';
      _tamanhoArquivo = '3.8 MB';
    });

    // Simula leitura por OCR e inteligência artificial do edital
    await Future.delayed(const Duration(milliseconds: 1400));

    if (!mounted) return;
    setState(() {
      _processandoIA = false;
      _editalAnalisado = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Edital processado com sucesso pela IA! Dados e disciplinas extraídos.'),
        backgroundColor: Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _publicarEditalParaAlunos() async {
    HapticFeedback.heavyImpact();
    setState(() => _publicando = true);

    await Future.delayed(const Duration(milliseconds: 900));

    // Atualiza o Plano Global ativo no app
    PlanoEstudoState.instance.atualizarPlano(
      concursoAlvo: _concursoCtrl.text,
      cargoAlvo: _cargoCtrl.text,
      banca: _bancaCtrl.text,
      nomeArquivo: _nomeArquivoSelecionado ?? 'Edital_Oficial_PMPE_AOCP_2026.pdf',
      tamanhoArquivo: _tamanhoArquivo ?? '3.8 MB',
      horasPorDia: 3,
      semanasAteProva: 21,
      disciplinas: _disciplinasExtraidas,
    );

    if (!mounted) return;
    setState(() => _publicando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Edital "${_concursoCtrl.text}" publicado com sucesso no app! Todos os alunos agora têm acesso ao cronograma oficial e conteúdo programático.',
        ),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Carregar Edital Oficial',
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const Text(
              'QG ADMINISTRADOR • PROCESSADOR DE EDITAIS',
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: AppColors.brandOrange),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ÁREA DE UPLOAD (DRAG & DROP / BOTÃO)
            TacticalCard(
              padding: const EdgeInsets.all(20),
              borderColor: _editalAnalisado ? const Color(0xFF16A34A) : AppColors.brandCobalt,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _editalAnalisado
                          ? const Color(0xFFF0FDF4)
                          : AppColors.brandCobalt.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _editalAnalisado ? Icons.check_circle_rounded : Icons.cloud_upload_rounded,
                      size: 38,
                      color: _editalAnalisado ? const Color(0xFF16A34A) : AppColors.brandCobalt,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _nomeArquivoSelecionado ?? 'Faça Upload do Edital Oficial (PDF)',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.brandNavy,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _tamanhoArquivo != null
                        ? 'Arquivo: $_nomeArquivoSelecionado • $_tamanhoArquivo'
                        : 'Formatos aceitos: PDF, DOCX (até 50MB). O sistema lerá e extrairá vagas, banca, datas e disciplinas automaticamente.',
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (_processandoIA)
                    Column(
                      children: const [
                        CircularProgressIndicator(color: AppColors.brandOrange),
                        SizedBox(height: 10),
                        Text(
                          'Analisando edital com IA e OCR... Extraindo disciplinas e regras...',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.brandOrange),
                        ),
                      ],
                    )
                  else
                    ElevatedButton.icon(
                      onPressed: _selecionarArquivo,
                      icon: const Icon(Icons.file_present_rounded, size: 16),
                      label: Text(_editalAnalisado ? 'SUBSTITUIR ARQUIVO PDF' : 'SELECIONAR EDITAL EM PDF'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.brandNavy,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // FORMULÁRIO DE CONFIRMAÇÃO DOS DADOS DO EDITAL
            if (_editalAnalisado) ...[
              Text(
                'DADOS OFICIAIS EXTRAÍDOS DO EDITAL',
                style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
              ),
              const SizedBox(height: 8),

              TacticalCard(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _campoTexto(label: 'Concurso / Órgão', controller: _concursoCtrl),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _campoTexto(label: 'Cargo Oficial', controller: _cargoCtrl)),
                        const SizedBox(width: 10),
                        Expanded(child: _campoTexto(label: 'Banca Examinadora', controller: _bancaCtrl)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _campoTexto(label: 'Número de Vagas', controller: _vagasCtrl)),
                        const SizedBox(width: 10),
                        Expanded(child: _campoTexto(label: 'Remuneração Inicial', controller: _remuneracaoCtrl)),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _campoTexto(label: 'Data da Prova Objetiva', controller: _dataProvaCtrl)),
                        const SizedBox(width: 10),
                        Expanded(child: _campoTexto(label: 'Estrutura da Prova', controller: _questoesCtrl)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // DISCIPLINAS EXTRAÍDAS
              Text(
                'DISCIPLINAS E CONTEÚDO PROGRAMÁTICO IDENTIFICADO',
                style: AppTypography.tagLabel.copyWith(color: AppColors.textPrimary, letterSpacing: 0.8),
              ),
              const SizedBox(height: 8),

              TacticalCard(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: _disciplinasExtraidas.asMap().entries.map((entry) {
                    final index = entry.key + 1;
                    final disc = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceElevated,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: AppColors.surfaceBorder),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: AppColors.brandCobalt.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$index',
                                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.brandCobalt),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              disc,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                            ),
                          ),
                          const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 16),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(height: 20),

              // BOTÃO DE PUBLICAÇÃO
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _publicando ? null : _publicarEditalParaAlunos,
                  icon: _publicando
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Icon(Icons.publish_rounded, size: 18),
                  label: Text(
                    _publicando ? 'PUBLICANDO EDITAL...' : 'PUBLICAR EDITAL NO APP PARA OS ALUNOS',
                    style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w900),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16A34A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 1,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _campoTexto({required String label, required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.textSecondary),
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            fillColor: AppColors.surfaceElevated,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.surfaceBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(color: AppColors.surfaceBorder),
            ),
          ),
        ),
      ],
    );
  }
}
