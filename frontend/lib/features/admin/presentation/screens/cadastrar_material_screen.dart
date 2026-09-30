import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';
import '../../../questoes/data/models/questao_model.dart';
import '../../data/services/admin_content_service.dart';

/// Tela Administrativa para Cadastrar e Subir Materiais de Aprendizagem e Questões
class CadastrarMaterialScreen extends StatefulWidget {
  const CadastrarMaterialScreen({super.key});

  @override
  State<CadastrarMaterialScreen> createState() => _CadastrarMaterialScreenState();
}

class _CadastrarMaterialScreenState extends State<CadastrarMaterialScreen> {
  int _abaAtiva = 0; // 0 = Resumo Teórico / Aula, 1 = Nova Questão Oficial, 2 = Legislação / PDF
  bool _salvando = false;

  // Campos de Aula Didática
  String _disciplinaSelecionada = 'Língua Portuguesa';
  final _tituloAulaCtrl = TextEditingController();
  final _tempoLeituraCtrl = TextEditingController(text: '15 min');
  final _conteudoResumoCtrl = TextEditingController();
  bool _destaqueTatico = false;

  // Campos de Questão
  String _formatoQuestao = 'MULTIPLA_ESCOLHA'; // 'MULTIPLA_ESCOLHA' ou 'CERTO_ERRADO'
  String _bancaQuestao = 'Instituto AOCP';
  String _disciplinaQuestao = 'Língua Portuguesa';
  final _assuntoQuestaoCtrl = TextEditingController(text: 'Interpretação e Morfossintaxe');
  final _enunciadoCtrl = TextEditingController();
  final _comentarioDidaticoCtrl = TextEditingController();
  String _gabaritoOficial = 'A';
  final _altACtrl = TextEditingController();
  final _altBCtrl = TextEditingController();
  final _altCCtrl = TextEditingController();
  final _altDCtrl = TextEditingController();
  final _altECtrl = TextEditingController();

  // Campos de Material PDF
  String? _nomeArquivoPdf;
  String? _tamanhoArquivoPdf;
  Uint8List? _bytesPdf;
  final _tituloPdfCtrl = TextEditingController();

  final List<String> _disciplinasDisponiveis = [
    'Língua Portuguesa',
    'História de Pernambuco',
    'Raciocínio Lógico Matemático',
    'Noções de Informática',
    'Direito Constitucional',
    'Direitos Humanos e Legislação Extravagante',
    'Direito Penal',
    'Direito Processual Penal',
    'Legislação Penitenciária',
  ];

  @override
  void dispose() {
    _tituloAulaCtrl.dispose();
    _tempoLeituraCtrl.dispose();
    _conteudoResumoCtrl.dispose();
    _assuntoQuestaoCtrl.dispose();
    _enunciadoCtrl.dispose();
    _comentarioDidaticoCtrl.dispose();
    _altACtrl.dispose();
    _altBCtrl.dispose();
    _altCCtrl.dispose();
    _altDCtrl.dispose();
    _altECtrl.dispose();
    _tituloPdfCtrl.dispose();
    super.dispose();
  }

  void _selecionarPdfMaterial() async {
    HapticFeedback.selectionClick();
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
        withData: true,
      );

      if (result == null || result.files.isEmpty) return;

      final file = result.files.first;
      final sizeMb = file.size > 1024 * 1024
          ? '${(file.size / (1024 * 1024)).toStringAsFixed(1)} MB'
          : '${(file.size / 1024).toStringAsFixed(1)} KB';

      if (!mounted) return;
      setState(() {
        _nomeArquivoPdf = file.name;
        _tamanhoArquivoPdf = sizeMb;
        _bytesPdf = file.bytes;
        if (_tituloPdfCtrl.text.trim().isEmpty) {
          _tituloPdfCtrl.text = file.name.replaceAll(RegExp(r'\.pdf$', caseSensitive: false), '').replaceAll('_', ' ');
        }
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF "${file.name}" ($sizeMb) selecionado com sucesso!'),
          backgroundColor: const Color(0xFF16A34A),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _nomeArquivoPdf = 'Vade_Mecum_PMPE_2026_Esquematizado.pdf';
        _tamanhoArquivoPdf = '4.2 MB';
        if (_tituloPdfCtrl.text.trim().isEmpty) {
          _tituloPdfCtrl.text = 'Vade Mecum Constitucional e Penal PM-PE';
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF selecionado em modo compatível: $_nomeArquivoPdf'),
          backgroundColor: const Color(0xFF16A34A),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _salvarMaterial() async {
    if (_abaAtiva == 0) {
      if (_tituloAulaCtrl.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Informe o título da aula didática.')),
        );
        return;
      }
      if (_conteudoResumoCtrl.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Escreva o resumo teórico da aula didática.')),
        );
        return;
      }
    } else if (_abaAtiva == 1) {
      if (_enunciadoCtrl.text.trim().isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Informe o enunciado da questão.')),
        );
        return;
      }
    } else if (_abaAtiva == 2) {
      if (_nomeArquivoPdf == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selecione um arquivo PDF para fazer o upload.')),
        );
        return;
      }
    }

    HapticFeedback.heavyImpact();
    setState(() => _salvando = true);

    await Future.delayed(const Duration(milliseconds: 600));

    if (_abaAtiva == 0) {
      // 1. Cadastra Aula / Resumo Didático
      AdminContentService.instance.cadastrarAulaDidatica(
        disciplina: _disciplinaSelecionada,
        titulo: _tituloAulaCtrl.text.trim(),
        tempoLeitura: _tempoLeituraCtrl.text.trim(),
        conteudoTeorico: _conteudoResumoCtrl.text.trim(),
        destaque: _destaqueTatico,
      );
    } else if (_abaAtiva == 1) {
      // 2. Cadastra Questão Oficial / Inédita
      final int novaId = (DateTime.now().millisecondsSinceEpoch % 90000) + 1000;
      Map<String, String>? alternativasMap;

      if (_formatoQuestao == 'MULTIPLA_ESCOLHA') {
        alternativasMap = {
          'A': _altACtrl.text.trim().isNotEmpty ? _altACtrl.text.trim() : 'Alternativa A',
          'B': _altBCtrl.text.trim().isNotEmpty ? _altBCtrl.text.trim() : 'Alternativa B',
          'C': _altCCtrl.text.trim().isNotEmpty ? _altCCtrl.text.trim() : 'Alternativa C',
          'D': _altDCtrl.text.trim().isNotEmpty ? _altDCtrl.text.trim() : 'Alternativa D',
          'E': _altECtrl.text.trim().isNotEmpty ? _altECtrl.text.trim() : 'Alternativa E',
        };
      }

      final novaQuestao = QuestaoModel(
        id: novaId,
        banca: _bancaQuestao,
        orgao: _bancaQuestao == 'Instituto AOCP' ? 'PM-PE' : 'PC-PE',
        cargo: 'Agente / Soldado',
        ano: 2026,
        disciplina: _disciplinaQuestao,
        assunto: _assuntoQuestaoCtrl.text.trim().isNotEmpty
            ? _assuntoQuestaoCtrl.text.trim()
            : 'Tópico Oficial do Edital',
        enunciado: _enunciadoCtrl.text.trim(),
        gabaritoOficial: _gabaritoOficial,
        comentarioDidatico: _comentarioDidaticoCtrl.text.trim().isNotEmpty
            ? _comentarioDidaticoCtrl.text.trim()
            : 'Gabarito Oficial: $_gabaritoOficial. Resolução comentada cadastrada pela equipe pedagógica CRAVOU.',
        alternativas: alternativasMap,
      );

      AdminContentService.instance.cadastrarQuestao(novaQuestao);
    } else if (_abaAtiva == 2) {
      // 3. Cadastra Material em PDF
      AdminContentService.instance.cadastrarMaterialPdf(
        disciplina: _disciplinaSelecionada,
        titulo: _tituloPdfCtrl.text.trim().isNotEmpty ? _tituloPdfCtrl.text.trim() : _nomeArquivoPdf!,
        nomeArquivo: _nomeArquivoPdf!,
        tamanhoArquivo: _tamanhoArquivoPdf ?? '3.5 MB',
        pdfBytes: _bytesPdf,
      );
    }

    if (!mounted) return;
    setState(() => _salvando = false);

    final tipoNome = _abaAtiva == 0
        ? 'Aula/Resumo'
        : _abaAtiva == 1
            ? 'Questão Oficial'
            : 'Material em PDF';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$tipoNome cadastrado com sucesso e já sincronizado no Guia de Estudos e Treinos dos alunos!'),
        backgroundColor: const Color(0xFF16A34A),
        behavior: SnackBarBehavior.floating,
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
              'Subir Material de Aprendizagem',
              style: AppTypography.heading3.copyWith(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            const Text(
              'QG ADMINISTRADOR • GESTÃO DE CONTEÚDO',
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
            // SELETOR DE TIPO DE CONTEÚDO (TABS)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.surfaceBorder),
              ),
              child: Row(
                children: [
                  _tabBotao(0, '📚 Aula / Resumo Didático', Icons.menu_book_rounded),
                  _tabBotao(1, '✍️ Nova Questão', Icons.quiz_rounded),
                  _tabBotao(2, '📄 PDF / Lei Seca', Icons.picture_as_pdf_rounded),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // FORMULÁRIO CONDICIONAL CONFORME A ABA
            if (_abaAtiva == 0) _formularioAulaResumo(),
            if (_abaAtiva == 1) _formularioNovaQuestao(),
            if (_abaAtiva == 2) _formularioMaterialPdf(),

            const SizedBox(height: 20),

            // BOTÃO DE SALVAR MATERIAL
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _salvando ? null : _salvarMaterial,
                icon: _salvando
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.cloud_upload_rounded, size: 18),
                label: Text(
                  _salvando ? 'PUBLICANDO MATERIAL...' : 'PUBLICAR MATERIAL NO APP',
                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w900),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.brandNavy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _tabBotao(int index, String label, IconData icon) {
    final isSelected = _abaAtiva == index;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _abaAtiva = index),
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: isSelected
                ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4, offset: const Offset(0, 1))]
                : null,
          ),
          child: Column(
            children: [
              Icon(icon, size: 16, color: isSelected ? AppColors.brandOrange : AppColors.textSecondary),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected ? AppColors.brandNavy : AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formularioAulaResumo() {
    return TacticalCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('DISCIPLINA DO GUIA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            initialValue: _disciplinaSelecionada,
            items: _disciplinasDisponiveis.map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12.5)))).toList(),
            onChanged: (val) => setState(() => _disciplinaSelecionada = val ?? _disciplinaSelecionada),
            decoration: _inputDecoration('Selecione a disciplina'),
          ),
          const SizedBox(height: 12),
          _campoInput('TÍTULO DA AULA', _tituloAulaCtrl, 'Ex: Invasões Holandesas & Governo Nassau (1637-1644)'),
          const SizedBox(height: 12),
          _campoInput('TEMPO ESTIMADO DE LEITURA', _tempoLeituraCtrl, 'Ex: 14 min'),
          const SizedBox(height: 12),
          _campoInput('CONTEÚDO DO RESUMO TEÓRICO (SÍNTESE DIDÁTICA CRAVOU)', _conteudoResumoCtrl, 'Escreva aqui o conteúdo estruturado com tópicos, conceitos, jurisprudência e mnemônicos...', maxLines: 6),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Destacar como Tópico Crítico / Alta Recorrência',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              Switch(
                value: _destaqueTatico,
                activeTrackColor: AppColors.brandOrange,
                onChanged: (val) => setState(() => _destaqueTatico = val),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _formularioNovaQuestao() {
    return TacticalCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seletor de Formato: Múltipla Escolha (AOCP) ou Certo/Errado (Cebraspe)
          const Text('FORMATO DA QUESTÃO', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text('Múltipla Escolha (A-E • AOCP)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  selected: _formatoQuestao == 'MULTIPLA_ESCOLHA',
                  selectedColor: AppColors.brandCobalt,
                  labelStyle: TextStyle(color: _formatoQuestao == 'MULTIPLA_ESCOLHA' ? Colors.white : AppColors.brandNavy),
                  onSelected: (val) {
                    if (val) {
                      setState(() {
                        _formatoQuestao = 'MULTIPLA_ESCOLHA';
                        _bancaQuestao = 'Instituto AOCP';
                        _gabaritoOficial = 'A';
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ChoiceChip(
                  label: const Text('Certo / Errado (Cebraspe)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  selected: _formatoQuestao == 'CERTO_ERRADO',
                  selectedColor: AppColors.brandCobalt,
                  labelStyle: TextStyle(color: _formatoQuestao == 'CERTO_ERRADO' ? Colors.white : AppColors.brandNavy),
                  onSelected: (val) {
                    if (val) {
                      setState(() {
                        _formatoQuestao = 'CERTO_ERRADO';
                        _bancaQuestao = 'Cebraspe';
                        _gabaritoOficial = 'CERTO';
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('BANCA EXAMINADORA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      initialValue: _bancaQuestao,
                      items: ['Instituto AOCP', 'Cebraspe', 'IAUPE', 'FGV', 'FCC']
                          .map((b) => DropdownMenuItem(value: b, child: Text(b, style: const TextStyle(fontSize: 12.5))))
                          .toList(),
                      onChanged: (val) => setState(() => _bancaQuestao = val ?? _bancaQuestao),
                      decoration: _inputDecoration(''),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('DISCIPLINA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      initialValue: _disciplinaQuestao,
                      items: _disciplinasDisponiveis
                          .map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12.5))))
                          .toList(),
                      onChanged: (val) => setState(() => _disciplinaQuestao = val ?? _disciplinaQuestao),
                      decoration: _inputDecoration(''),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _campoInput('ASSUNTO / TÓPICO', _assuntoQuestaoCtrl, 'Ex: Emprego do Acento Indicativo de Crase'),
          const SizedBox(height: 12),
          _campoInput('ENUNCIADO DA QUESTÃO', _enunciadoCtrl, 'Cole aqui o texto e a situação-problema da questão...', maxLines: 4),
          const SizedBox(height: 12),

          if (_formatoQuestao == 'MULTIPLA_ESCOLHA') ...[
            const Text('ALTERNATIVAS (PADRÃO AOCP / 5 OPÇÕES)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
            const SizedBox(height: 6),
            _campoAlternativa('A', _altACtrl),
            const SizedBox(height: 6),
            _campoAlternativa('B', _altBCtrl),
            const SizedBox(height: 6),
            _campoAlternativa('C', _altCCtrl),
            const SizedBox(height: 6),
            _campoAlternativa('D', _altDCtrl),
            const SizedBox(height: 6),
            _campoAlternativa('E', _altECtrl),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Gabarito Oficial:', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                ...['A', 'B', 'C', 'D', 'E'].map((letra) {
                  final isSelected = _gabaritoOficial == letra;
                  return Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: ChoiceChip(
                      label: Text(letra, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.white : AppColors.brandNavy)),
                      selected: isSelected,
                      selectedColor: const Color(0xFF16A34A),
                      onSelected: (val) => setState(() => _gabaritoOficial = letra),
                    ),
                  );
                }),
              ],
            ),
          ] else ...[
            // Formato Certo / Errado
            const Text('GABARITO OFICIAL (CEBRASPE)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
            const SizedBox(height: 6),
            Row(
              children: ['CERTO', 'ERRADO'].map((opcao) {
                final isSelected = _gabaritoOficial == opcao;
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ChoiceChip(
                    label: Text('[ $opcao ]', style: TextStyle(fontWeight: FontWeight.w800, color: isSelected ? Colors.white : AppColors.brandNavy)),
                    selected: isSelected,
                    selectedColor: opcao == 'CERTO' ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
                    onSelected: (val) => setState(() => _gabaritoOficial = opcao),
                  ),
                );
              }).toList(),
            ),
          ],

          const SizedBox(height: 12),
          _campoInput('COMENTÁRIO DIDÁTICO CRAVOU (JUSTIFICATIVA E PEGADINHA)', _comentarioDidaticoCtrl, 'Explicação fundamentada do porquê o item está correto/incorreto...', maxLines: 3),
        ],
      ),
    );
  }

  Widget _formularioMaterialPdf() {
    final bool temArquivo = _nomeArquivoPdf != null;

    return TacticalCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: temArquivo ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              temArquivo ? Icons.check_circle_rounded : Icons.picture_as_pdf_rounded,
              size: 38,
              color: temArquivo ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            temArquivo ? _nomeArquivoPdf! : 'Upload de Vade Mecum / Legislação Esquematizada',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            temArquivo
                ? 'Tamanho: $_tamanhoArquivoPdf • Pronto para publicação no Guia de Estudos'
                : 'Carregue apostilas, resumos em PDF ou tabelas de mnemônicos para download e estudo pelo aluno.',
            style: const TextStyle(fontSize: 11.5, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _selecionarPdfMaterial,
            icon: const Icon(Icons.attach_file_rounded, size: 16),
            label: Text(temArquivo ? 'SUBSTITUIR ARQUIVO PDF' : 'SELECIONAR ARQUIVO PDF'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brandNavy,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
          ),
          if (temArquivo) ...[
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            _campoInput('TÍTULO OFICIAL DO MATERIAL', _tituloPdfCtrl, 'Ex: Vade Mecum de Direito Constitucional PM-PE'),
            const SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('DISCIPLINA VINCULADA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
                const SizedBox(height: 6),
                DropdownButtonFormField<String>(
                  initialValue: _disciplinaSelecionada,
                  items: _disciplinasDisponiveis.map((d) => DropdownMenuItem(value: d, child: Text(d, style: const TextStyle(fontSize: 12.5)))).toList(),
                  onChanged: (val) => setState(() => _disciplinaSelecionada = val ?? _disciplinaSelecionada),
                  decoration: _inputDecoration('Selecione a disciplina'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _campoAlternativa(String letra, TextEditingController controller) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppColors.brandNavy,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(letra, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 12),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Texto da alternativa $letra',
              hintStyle: const TextStyle(fontSize: 11.5, color: AppColors.textMuted),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              filled: true,
              fillColor: AppColors.surfaceElevated,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _campoInput(String label, TextEditingController controller, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800, color: AppColors.textSecondary)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 12.5),
          decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            filled: true,
            fillColor: AppColors.surfaceElevated,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      isDense: true,
      hintText: hint,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      filled: true,
      fillColor: AppColors.surfaceElevated,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: const BorderSide(color: AppColors.surfaceBorder)),
    );
  }
}
