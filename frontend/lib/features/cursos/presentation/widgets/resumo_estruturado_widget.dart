import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Widget visual para renderização estruturada e harmônica do Resumo Teórico CRAVOU.
/// Utiliza paleta de cores balanceada (nada agressivo), tipografia hierárquica,
/// caixas de destaque tático para mnemônicos, pegadinhas de bancas e exemplos práticos.
class ResumoEstruturadoWidget extends StatefulWidget {
  final String tituloAula;
  final String disciplina;
  final String conteudoMarkdown;
  final VoidCallback? onIrParaMapaMental;
  final VoidCallback? onIrParaQuestoes;

  const ResumoEstruturadoWidget({
    super.key,
    required this.tituloAula,
    required this.disciplina,
    required this.conteudoMarkdown,
    this.onIrParaMapaMental,
    this.onIrParaQuestoes,
  });

  @override
  State<ResumoEstruturadoWidget> createState() => _ResumoEstruturadoWidgetState();
}

class _ResumoEstruturadoWidgetState extends State<ResumoEstruturadoWidget> {
  double _fonteEscala = 1.0;

  void _ajustarFonte(double delta) {
    setState(() {
      _fonteEscala = (_fonteEscala + delta).clamp(0.85, 1.35);
    });
  }

  @override
  Widget build(BuildContext context) {
    final blocos = _parseConteudo(widget.conteudoMarkdown);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. HEADER DO RESUMO COM CONTROLE DE LEITURA
          _buildHeader(),

          const SizedBox(height: 16),

          // 2. BLOCOS DE CONTEÚDO FORMATADOS E COLORIDOS COM HARMONIA
          ...blocos.map((bloco) => _renderizarBloco(bloco)),

          const SizedBox(height: 24),

          // 3. BOTÕES TÁTICOS DE NAVEGAÇÃO DE FLUXO
          _buildAcoesNavegacao(),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.brandOrange.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.brandOrange.withValues(alpha: 0.4)),
                ),
                child: const Text(
                  'METODOLOGIA TÁTICA CRAVOU',
                  style: TextStyle(
                    color: Color(0xFFFB923C),
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '100% Autoral',
                  style: TextStyle(
                    color: Color(0xFF34D399),
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
              const Spacer(),
              // Controles de Acessibilidade / Tamanho da Fonte
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () => _ajustarFonte(-0.1),
                      borderRadius: BorderRadius.circular(6),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text('A-', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    Container(width: 1, height: 14, color: Colors.white24),
                    InkWell(
                      onTap: () => _ajustarFonte(0.1),
                      borderRadius: BorderRadius.circular(6),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text('A+', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.tituloAula,
            style: TextStyle(
              fontSize: 16 * _fonteEscala,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.menu_book, color: Color(0xFF93C5FD), size: 14),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${widget.disciplina} • Síntese estruturada para retenção acelerada',
                  style: const TextStyle(fontSize: 11.5, color: Color(0xFF94A3B8)),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderizarBloco(_BlocoConteudo bloco) {
    switch (bloco.tipo) {
      case _TipoBloco.secaoPrincipal:
        return Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFEFF6FF),
            borderRadius: BorderRadius.circular(8),
            border: const Border(
              left: BorderSide(color: Color(0xFF2563EB), width: 4),
            ),
          ),
          child: Row(
            children: [
              const Text('📌', style: TextStyle(fontSize: 16)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bloco.texto,
                  style: TextStyle(
                    fontSize: 14.5 * _fonteEscala,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1E3A8A),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.regraDeOuro:
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBEB),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFFDE68A), width: 1.2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🎯', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'REGRA DE OURO CRAVOU',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFB45309),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      bloco.texto,
                      style: TextStyle(
                        fontSize: 12.5 * _fonteEscala,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF78350F),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.pegadinha:
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF2F2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFFECACA), width: 1.2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🚨', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'ARMADILHA CLÁSSICA DA BANCA',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFFDC2626),
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      bloco.texto,
                      style: TextStyle(
                        fontSize: 12.5 * _fonteEscala,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF991B1B),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.mnemonico:
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFBBF7D0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('💡', style: TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 12.5 * _fonteEscala,
                      color: const Color(0xFF166534),
                      height: 1.4,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      const TextSpan(
                        text: 'Mnemônico Tático: ',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      TextSpan(text: bloco.texto),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.exemplo:
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🔹', style: TextStyle(fontSize: 12, color: AppColors.brandCobalt)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bloco.texto,
                  style: TextStyle(
                    fontSize: 12 * _fonteEscala,
                    fontStyle: FontStyle.italic,
                    color: const Color(0xFF334155),
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.itemTexto:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.brandCobalt,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  bloco.texto,
                  style: TextStyle(
                    fontSize: 13 * _fonteEscala,
                    color: AppColors.textPrimary,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.subsecao:
        return Container(
          margin: const EdgeInsets.only(top: 14, bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(6),
            border: const Border(
              left: BorderSide(color: Color(0xFF4F46E5), width: 3.5),
            ),
          ),
          child: Row(
            children: [
              const Icon(Icons.label_important_outline, size: 16, color: Color(0xFF4F46E5)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bloco.texto,
                  style: TextStyle(
                    fontSize: 13.5 * _fonteEscala,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.citacaoLei:
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBEB).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFFDE68A), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('📜', style: TextStyle(fontSize: 14)),
                  const SizedBox(width: 6),
                  Text(
                    'LEI SECA & SÚMULA APLICADA',
                    style: TextStyle(
                      fontSize: 10 * _fonteEscala,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFFB45309),
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                bloco.texto,
                style: TextStyle(
                  fontSize: 12.5 * _fonteEscala,
                  fontStyle: FontStyle.italic,
                  color: const Color(0xFF451A03),
                  height: 1.45,
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.itemNumerado:
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.brandCobalt.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  bloco.prefixoNumero ?? '•',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    color: AppColors.brandCobalt,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  bloco.texto,
                  style: TextStyle(
                    fontSize: 13 * _fonteEscala,
                    color: AppColors.textPrimary,
                    height: 1.45,
                  ),
                ),
              ),
            ],
          ),
        );

      case _TipoBloco.paragrafo:
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            bloco.texto,
            style: TextStyle(
              fontSize: 13 * _fonteEscala,
              color: AppColors.textPrimary,
              height: 1.55,
            ),
          ),
        );
    }
  }

  Widget _buildAcoesNavegacao() {
    return Row(
      children: [
        if (widget.onIrParaMapaMental != null)
          Expanded(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.brandCobalt, width: 1.5),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: widget.onIrParaMapaMental,
              icon: const Icon(Icons.psychology, size: 20, color: AppColors.brandCobalt),
              label: const Text(
                'MAPA MENTAL',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: AppColors.brandCobalt),
              ),
            ),
          ),
        if (widget.onIrParaMapaMental != null && widget.onIrParaQuestoes != null)
          const SizedBox(width: 12),
        if (widget.onIrParaQuestoes != null)
          Expanded(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandCobalt,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 1,
              ),
              onPressed: widget.onIrParaQuestoes,
              icon: const Icon(Icons.play_circle_fill, size: 20),
              label: const Text(
                'TREINAR QUESTÕES',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
              ),
            ),
          ),
      ],
    );
  }

  List<_BlocoConteudo> _parseConteudo(String texto) {
    final List<_BlocoConteudo> blocos = [];
    final linhas = texto.split('\n');

    for (int i = 0; i < linhas.length; i++) {
      String l = linhas[i].trim();
      if (l.isEmpty || l == '---') continue;

      if (l.startsWith('# ') || l.startsWith('## ')) {
        final limpo = l.replaceAll('#', '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.secaoPrincipal, texto: limpo));
      } else if (l.startsWith('### ') || l.startsWith('#### ')) {
        final limpo = l.replaceAll('#', '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.subsecao, texto: limpo));
      } else if (l.toLowerCase().contains('regra de ouro') || l.toLowerCase().contains('regra absoluta')) {
        final limpo = l.replaceAll(RegExp(r'\*\*|#'), '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.regraDeOuro, texto: limpo));
      } else if (l.toLowerCase().contains('cuidado') ||
          l.toLowerCase().contains('pegadinha') ||
          l.toLowerCase().contains('atenção') ||
          l.toLowerCase().contains('armadilha')) {
        final limpo = l.replaceAll(RegExp(r'\*\*|#'), '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.pegadinha, texto: limpo));
      } else if (l.toLowerCase().contains('mnemônico') || l.toLowerCase().contains('mnemonico')) {
        final limpo = l.replaceAll(RegExp(r'\*\*|#'), '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.mnemonico, texto: limpo));
      } else if (l.startsWith('> ') || l.toLowerCase().startsWith('súmula') || l.toLowerCase().contains('súmula vinculante')) {
        final limpo = l.replaceFirst(RegExp(r'^>\s*'), '').replaceAll(RegExp(r'\*\*|\*|"'), '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.citacaoLei, texto: limpo));
      } else if (l.toLowerCase().startsWith('exemplo') || l.toLowerCase().startsWith('exemplos:')) {
        final limpo = l.replaceAll(RegExp(r'\*\*|\*'), '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.exemplo, texto: limpo));
      } else if (RegExp(r'^\d+\.\s').hasMatch(l)) {
        final match = RegExp(r'^(\d+)\.\s*(.*)$').firstMatch(l);
        final numPrefixo = match?.group(1) ?? '•';
        final conteudo = (match?.group(2) ?? l).replaceAll('**', '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.itemNumerado, texto: conteudo, prefixoNumero: '$numPrefixo.'));
      } else if (l.startsWith('- ') || l.startsWith('• ') || l.startsWith('* ')) {
        final limpo = l.substring(2).replaceAll('**', '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.itemTexto, texto: limpo));
      } else {
        final limpo = l.replaceAll('**', '').trim();
        blocos.add(_BlocoConteudo(tipo: _TipoBloco.paragrafo, texto: limpo));
      }
    }

    return blocos;
  }
}

enum _TipoBloco {
  secaoPrincipal,
  subsecao,
  regraDeOuro,
  pegadinha,
  mnemonico,
  citacaoLei,
  exemplo,
  itemNumerado,
  itemTexto,
  paragrafo,
}

class _BlocoConteudo {
  final _TipoBloco tipo;
  final String texto;
  final String? prefixoNumero;

  const _BlocoConteudo({
    required this.tipo,
    required this.texto,
    this.prefixoNumero,
  });
}
