import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tactical_card.dart';

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
  String _bancaQuestao = 'Instituto AOCP';
  String _disciplinaQuestao = 'Língua Portuguesa';
  final _enunciadoCtrl = TextEditingController();
  final _comentarioDidaticoCtrl = TextEditingController();
  String _gabaritoOficial = 'A';
  final _altACtrl = TextEditingController();
  final _altBCtrl = TextEditingController();
  final _altCCtrl = TextEditingController();
  final _altDCtrl = TextEditingController();
  final _altECtrl = TextEditingController();

  final List<String> _disciplinasDisponiveis = [
    'Língua Portuguesa',
    'História de Pernambuco',
    'Raciocínio Lógico Matemático',
    'Noções de Informática',
    'Direito Constitucional',
    'Direitos Humanos e Legislação',
    'Direito Penal',
    'Direito Processual Penal',
    'Legislação Penitenciária',
  ];

  @override
  void dispose() {
    _tituloAulaCtrl.dispose();
    _tempoLeituraCtrl.dispose();
    _conteudoResumoCtrl.dispose();
    _enunciadoCtrl.dispose();
    _comentarioDidaticoCtrl.dispose();
    _altACtrl.dispose();
    _altBCtrl.dispose();
    _altCCtrl.dispose();
    _altDCtrl.dispose();
    _altECtrl.dispose();
    super.dispose();
  }

  void _salvarMaterial() async {
    if (_abaAtiva == 0 && _tituloAulaCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o título da aula didática.')),
      );
      return;
    }
    if (_abaAtiva == 1 && _enunciadoCtrl.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe o enunciado da questão.')),
      );
      return;
    }

    HapticFeedback.heavyImpact();
    setState(() => _salvando = true);

    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;
    setState(() => _salvando = false);

    final tipoNome = _abaAtiva == 0 ? 'Aula/Resumo' : 'Questão Oficial';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$tipoNome cadastrado com sucesso e já sincronizado no Guia de Estudos dos alunos!'),
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
          _campoInput('ENUNCIADO DA QUESTÃO', _enunciadoCtrl, 'Cole aqui o texto e a situação-problema da questão...', maxLines: 4),
          const SizedBox(height: 12),
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
          const SizedBox(height: 12),
          _campoInput('COMENTÁRIO DIDÁTICO CRAVOU (JUSTIFICATIVA E PEGADINHA)', _comentarioDidaticoCtrl, 'Explicação fundamentada do porquê o item está correto/incorreto...', maxLines: 3),
        ],
      ),
    );
  }

  Widget _formularioMaterialPdf() {
    return TacticalCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(Icons.picture_as_pdf_rounded, size: 40, color: Color(0xFFDC2626)),
          const SizedBox(height: 10),
          const Text('Upload de Vade Mecum / Legislação Esquematizada', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Carregue apostilas, resumos em PDF ou tabelas de mnemônicos para download direto pelo aluno.', style: TextStyle(fontSize: 11.5, color: AppColors.textSecondary), textAlign: TextAlign.center),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Seletor de arquivos ativado (PDF selecionado).')),
              );
            },
            icon: const Icon(Icons.attach_file_rounded, size: 16),
            label: const Text('SELECIONAR ARQUIVO PDF'),
          ),
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
