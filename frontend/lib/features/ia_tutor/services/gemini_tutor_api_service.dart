import 'package:dio/dio.dart';
import '../models/ia_mensagem_model.dart';

/// Serviço de integração direta com a API do Google Gemini (Gemini 1.5 Flash).
/// Fornece raciocínio de inteligência artificial de última geração, interpretação de dúvidas
/// em linguagem natural e destrinchamento analítico profundo para concursos policiais.
class GeminiTutorApiService {
  final Dio _dio;

  GeminiTutorApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 30),
                headers: {
                  'Content-Type': 'application/json',
                },
              ),
            );

  /// Envia a dúvida do aluno com o contexto completo da questão para a API do Google Gemini.
  Future<String?> gerarRespostaComGemini({
    required String apiKey,
    required String pergunta,
    required String enunciado,
    required String gabaritoOficial,
    required String comentario,
    String? assunto,
    String? banca,
    List<IAMensagemModel>? historico,
  }) async {
    if (apiKey.trim().isEmpty) return null;

    final url =
        'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=${apiKey.trim()}';

    final systemInstruction = '''
Você é o Professor CRAVOU AI, mentor especialista e pedagogo de alto rendimento em concursos públicos (Polícia Civil, PM, PRF, PF).
Sua missão é explicar as questões com máxima clareza, fluidez natural, raciocínio analítico e profundidade pedagógica.

DIRETRIZES FUNDAMENTAIS DE RESPOSTA:
1. FLUIDEZ E NATURALIDADE: NUNCA use frases clichês robóticas como "Que pergunta fantástica sobre [pergunta]" ou respostas genéricas enlatadas. Vá direto ao cerne da dúvida com naturalidade e elegância de um excelente professor.
2. ESTRUTURA MAGISTRAL:
   - Se o aluno disser "não entendi", "ainda não entendi", "me explica novamente" ou fizer uma pergunta aberta:
     * Destaque imediatamente por que o gabarito oficial é a alternativa correta, relacionando aos elementos concretos do enunciado/texto.
     * Traga mnemônicos práticos e consolidados quando aplicável (ex: PENTE para texto narrativo: Personagem, Espaço, Narrador, Tempo, Enredo).
     * Destrinche POR QUE CADA DISTRATOR ESTÁ INCORRETO, comparando com o que o texto realmente apresenta.
     * Finalize com a pegadinha tática ou modus operandi da banca organizadora (${banca ?? 'Cebraspe / AOCP'}).
   - Se o aluno tiver uma dúvida específica (ex: sobre uma alternativa específica ou conceito):
     * Foque cirurgicamente no ponto levantado, dê exemplos práticos e mostre a distinção precisa em relação ao gabarito oficial.
3. TOM: Didático, assertivo, encorajador e acolhedor (mentor de concursos de elite).
''';

    final promptUsuario = '''
[CONTEXTO DA QUESTÃO]
• Disciplina / Tópico: ${assunto ?? 'Língua Portuguesa / Conhecimentos do Edital'}
• Banca Organizadora: ${banca ?? 'Instituto AOCP / Cebraspe'}
• Enunciado: "$enunciado"
• Gabarito Oficial: Letra $gabaritoOficial
• Fundamentação / Comentário Técnico das Alternativas:
"$comentario"

[MENSAGEM / DÚVIDA DO ALUNO]
"$pergunta"

Destrinche e responda com clareza pedagógica total para o aluno:
''';

    try {
      final response = await _dio.post(
        url,
        data: {
          'system_instruction': {
            'parts': [
              {'text': systemInstruction}
            ]
          },
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': promptUsuario}
              ]
            }
          ],
          'generationConfig': {
            'temperature': 0.7,
            'maxOutputTokens': 1000,
          },
        },
      );

      if (response.statusCode == 200 && response.data != null) {
        final candidates = response.data['candidates'] as List?;
        if (candidates != null && candidates.isNotEmpty) {
          final content = candidates[0]['content'];
          final parts = content['parts'] as List?;
          if (parts != null && parts.isNotEmpty) {
            final text = parts[0]['text'] as String?;
            if (text != null && text.trim().isNotEmpty) {
              return text.trim();
            }
          }
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
