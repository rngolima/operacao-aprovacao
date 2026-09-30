import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Modelo interno para representar uma alternativa destrinchada no comentário pedagógico.
class _AlternativaComentada {
  final String letra;
  final bool isCorreta;
  final String explicacao;

  _AlternativaComentada({
    required this.letra,
    required this.isCorreta,
    required this.explicacao,
  });
}

/// Widget de exibição pedagógica e visual das resoluções de questões do CRAVOU.
/// Destrincha o comentário em blocos claros: Fundamento Oficial, Alternativa por Alternativa
/// e Pegadinha da Banca / Pulo do Gato.
class ComentarioDidaticoWidget extends StatelessWidget {
  final String comentario;
  final String gabaritoOficial;
  final bool acertou;
  final String? respostaSelecionada;
  final VoidCallback? onRevisarAssunto;
  final String? assunto;
  final int? tempoGastoSegundos;

  const ComentarioDidaticoWidget({
    super.key,
    required this.comentario,
    required this.gabaritoOficial,
    required this.acertou,
    this.respostaSelecionada,
    this.onRevisarAssunto,
    this.assunto,
    this.tempoGastoSegundos,
  });

  @override
  Widget build(BuildContext context) {
    final parsed = _parseComentario(comentario);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: acertou ? const Color(0xFFF0FDF4) : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: acertou ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5),
          width: 1.2,
        ),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. Cabeçalho de Status: CRAVOU vs RESPOSTA INCORRETA + Gabarito Oficial
          _buildHeaderStatus(),

          const SizedBox(height: 12),

          // 2. Fundamento Oficial / Síntese Inicial (se houver)
          if (parsed.sintese.isNotEmpty) ...[
            _buildSinteseCard(parsed.sintese),
            const SizedBox(height: 12),
          ],

          // 3. Análise Destrinchada Alternativa por Alternativa (Cards Individuais)
          if (parsed.alternativas.isNotEmpty) ...[
            _buildSecaoAlternativas(parsed.alternativas),
            const SizedBox(height: 12),
          ] else if (parsed.paragrafosLivres.isNotEmpty) ...[
            // Fallback para comentários em texto corrido (divide em blocos com respiro)
            ...parsed.paragrafosLivres.map((paragrafo) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: _buildParagrafoCard(paragrafo),
                )),
            const SizedBox(height: 4),
          ],

          // 4. Caixa Dourada: Pegadinha da Banca / O Pulo do Gato
          if (parsed.pegadinhaBanca.isNotEmpty) ...[
            _buildPegadinhaCard(parsed.pegadinhaBanca),
            const SizedBox(height: 12),
          ],

          // 5. Alerta de Tempo Gasto Alto (> 150 segundos)
          if (tempoGastoSegundos != null && tempoGastoSegundos! > 150) ...[
            _buildAlertaTempo(),
            const SizedBox(height: 12),
          ],

          // 6. Botão de Ponto de Vulnerabilidade (se o aluno errou)
          if (!acertou && onRevisarAssunto != null && assunto != null) ...[
            _buildBotaoRevisao(),
          ],
        ],
      ),
    );
  }

  Widget _buildHeaderStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: acertou ? const Color(0xFFBBF7D0) : const Color(0xFFFECACA),
        ),
      ),
      child: Row(
        children: [
          Icon(
            acertou ? Icons.check_circle_rounded : Icons.cancel_rounded,
            color: acertou ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              acertou ? 'CRAVOU! RESPOSTA CERTA' : 'RESPOSTA INCORRETA',
              style: TextStyle(
                color: acertou ? const Color(0xFF16A34A) : const Color(0xFFDC2626),
                fontWeight: FontWeight.w900,
                fontSize: 12.5,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: acertou ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: acertou ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Gabarito: ',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: acertou ? const Color(0xFF15803D) : const Color(0xFFB91C1C),
                  ),
                ),
                Text(
                  gabaritoOficial,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: acertou ? const Color(0xFF15803D) : const Color(0xFFB91C1C),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSinteseCard(String texto) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('🎯', style: TextStyle(fontSize: 13)),
              SizedBox(width: 6),
              Text(
                'FUNDAMENTO DO GABARITO OFICIAL',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: AppColors.brandNavy,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            texto,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.5,
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecaoAlternativas(List<_AlternativaComentada> alternativas) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            Icon(Icons.segment_rounded, size: 15, color: AppColors.brandCobalt),
            SizedBox(width: 6),
            Text(
              'ANÁLISE DESTRINCHADA DAS ALTERNATIVAS:',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: AppColors.brandNavy,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...alternativas.map((alt) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: alt.isCorreta ? const Color(0xFF86EFAC) : AppColors.surfaceBorder,
                  width: alt.isCorreta ? 1.4 : 1.0,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Badge com a Letra da Alternativa
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: alt.isCorreta ? const Color(0xFF16A34A) : AppColors.brandNavy,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            alt.letra,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Tag de Correta vs Incorreta
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                        decoration: BoxDecoration(
                          color: alt.isCorreta
                              ? const Color(0xFFDCFCE7)
                              : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: alt.isCorreta
                                ? const Color(0xFF86EFAC)
                                : const Color(0xFFCBD5E1),
                          ),
                        ),
                        child: Text(
                          alt.isCorreta ? '✓ ALTERNATIVA CORRETA' : '✗ DISTRATOR / INCORRETA',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            color: alt.isCorreta
                                ? const Color(0xFF15803D)
                                : const Color(0xFF64748B),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    alt.explicacao,
                    style: const TextStyle(
                      fontSize: 12.5,
                      height: 1.5,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget _buildParagrafoCard(String texto) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 12.5,
          height: 1.5,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildPegadinhaCard(String pegadinha) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFFCD34D), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text('💡', style: TextStyle(fontSize: 14)),
              SizedBox(width: 6),
              Text(
                'O PULO DO GATO • PEGADINHA DA BANCA',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF92400E),
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            pegadinha,
            style: const TextStyle(
              fontSize: 12.5,
              height: 1.5,
              color: Color(0xFF78350F),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertaTempo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF1F2),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFFECDD3)),
      ),
      child: Row(
        children: [
          const Text('⏱️', style: TextStyle(fontSize: 14)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Atenção ao tempo gasto (${tempoGastoSegundos! ~/ 60}m${(tempoGastoSegundos! % 60).toString().padLeft(2, '0')}s). Na prova real, mire em ~2 minutos por questão para garantir tempo para a Redação!',
              style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9F1239),
                fontWeight: FontWeight.w600,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBotaoRevisao() {
    return InkWell(
      onTap: onRevisarAssunto,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFEF4444), width: 1.2),
          boxShadow: [
            BoxShadow(
              color: Colors.red.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.menu_book_rounded, color: Color(0xFFDC2626), size: 16),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PONTO DE VULNERABILIDADE DETECTADO',
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFFDC2626),
                      letterSpacing: 0.4,
                    ),
                  ),
                  Text(
                    'Revisar "$assunto" no Resumo e Mapa Mental',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF991B1B),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xFFDC2626), size: 13),
          ],
        ),
      ),
    );
  }

  /// Parser tático que divide o comentário em blocos estruturados.
  _ParsedComentario _parseComentario(String text) {
    String sintese = '';
    final List<_AlternativaComentada> alternativas = [];
    String pegadinha = '';
    final List<String> paragrafosLivres = [];

    // Localiza seções especiais
    final indexAlternativas = text.indexOf(RegExp(r'(🔍|DESTRINCHANDO ALTERNATIVA|Alternativas:)'));
    final indexPegadinha = text.indexOf(RegExp(r'(💡|O PULO DO GATO|PEGADINHA)'));

    if (indexAlternativas != -1) {
      // Síntese é o que vem antes de destrinchar
      sintese = text.substring(0, indexAlternativas).trim();
      // Remove marcadores de cabeçalho da síntese se presentes
      sintese = sintese.replaceFirst(RegExp(r'^(🎯\s*)?(CRAVOU NO GABARITO OFICIAL:\s*|Gabarito Oficial:\s*)[^\n]*\n*'), '').trim();

      // Parte que contém as alternativas
      final fimAlternativas = indexPegadinha != -1 && indexPegadinha > indexAlternativas
          ? indexPegadinha
          : text.length;
      final blocoAlternativas = text.substring(indexAlternativas, fimAlternativas).trim();

      // Quebra por linhas que começam com bullet ou letra
      final lines = blocoAlternativas.split('\n');
      String currentLetra = '';
      bool currentCorreta = false;
      StringBuffer currentBuffer = StringBuffer();

      void salvarAlternativa() {
        if (currentLetra.isNotEmpty) {
          alternativas.add(_AlternativaComentada(
            letra: currentLetra,
            isCorreta: currentCorreta,
            explicacao: currentBuffer.toString().trim(),
          ));
          currentBuffer.clear();
        }
      }

      final regexItem = RegExp(r'^[•\-\*]?\s*([A-Ea-e])\)\s*(CORRETA|INCORRETA)?\.?\s*(.*)$');

      for (final line in lines) {
        final trimmed = line.trim();
        if (trimmed.isEmpty) continue;
        if (trimmed.contains(RegExp(r'^(🔍|DESTRINCHANDO)'))) continue;

        final match = regexItem.firstMatch(trimmed);
        if (match != null) {
          salvarAlternativa();
          currentLetra = match.group(1)!.toUpperCase();
          final status = (match.group(2) ?? '').toUpperCase();
          currentCorreta = status == 'CORRETA' || (!status.contains('INCORRETA') && status.contains('CORRETA'));
          if (status.isEmpty) {
            currentCorreta = currentLetra == gabaritoOficial.toUpperCase();
          }
          final resto = match.group(3) ?? '';
          if (resto.isNotEmpty) {
            currentBuffer.write(resto);
          }
        } else if (currentLetra.isNotEmpty) {
          if (currentBuffer.isNotEmpty) currentBuffer.write(' ');
          currentBuffer.write(trimmed);
        }
      }
      salvarAlternativa();

      // Extrai pegadinha
      if (indexPegadinha != -1) {
        String rawPegadinha = text.substring(indexPegadinha).trim();
        // Remove título da pegadinha
        rawPegadinha = rawPegadinha.replaceFirst(RegExp(r'^(💡\s*)?(O PULO DO GATO[^\n]*|PEGADINHA[^\n]*)\n*'), '').trim();
        pegadinha = rawPegadinha;
      }
    } else {
      // Não tem a estrutura com "DESTRINCHANDO". Divide por quebras de linha duplas
      final partes = text.split(RegExp(r'\n\s*\n'));
      for (final parte in partes) {
        final p = parte.trim();
        if (p.isNotEmpty) {
          if (p.contains(RegExp(r'(💡|PULO DO GATO|PEGADINHA)'))) {
            pegadinha = p.replaceFirst(RegExp(r'^(💡\s*)?(O PULO DO GATO[^\n]*|PEGADINHA[^\n]*)\n*'), '').trim();
          } else if (sintese.isEmpty) {
            sintese = p;
          } else {
            paragrafosLivres.add(p);
          }
        }
      }
    }

    return _ParsedComentario(
      sintese: sintese,
      alternativas: alternativas,
      pegadinhaBanca: pegadinha,
      paragrafosLivres: paragrafosLivres,
    );
  }
}

class _ParsedComentario {
  final String sintese;
  final List<_AlternativaComentada> alternativas;
  final String pegadinhaBanca;
  final List<String> paragrafosLivres;

  _ParsedComentario({
    required this.sintese,
    required this.alternativas,
    required this.pegadinhaBanca,
    required this.paragrafosLivres,
  });
}
