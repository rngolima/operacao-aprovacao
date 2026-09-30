import 'package:dio/dio.dart';
import '../models/ia_mensagem_model.dart';

/// Serviço de integração direta com a API do Google Gemini (Gemini 1.5 Flash).
/// Fornece raciocínio de inteligência artificial de última geração, interpretação de dúvidas
/// em linguagem natural e personalização extrema para concursos policiais.
class GeminiTutorApiService {
  final Dio _dio;

  GeminiTutorApiService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 25),
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
Você é o Professor CRAVOU AI, o mentor pedagógico mais querido, motivador e experiente em concursos públicos policiais do Brasil (Polícia Civil, PM, PRF, PF).
Você NUNCA fala de forma fria, robótica, acadêmica ou engessada.
Você conversa exatamente como um professor particular de cursinho conversando com seu aluno em um café ou em uma sala de mentoria individual:
1. Chame o aluno com entusiasmo e carinho de "guerreiro", "meu amigo", "futuro Policial" ou "futuro Agente";
2. Use analogias simples do dia a dia, da rotina das ruas ou de delegacia para descomplicar regras difíceis de Português ou de Direito;
3. Mostre onde está a "malícia" da banca organizadora (${banca ?? 'Cebraspe / AOCP'}), revelando como o examinador tenta induzir ao erro;
4. Se o aluno pedir mnemônico, crie um macete criativo e inesquecível;
5. Responda com ritmo de fala natural e humana (ótimo para ser lido em voz alta/áudio), sem usar tópicos formais secos ou numerações frias;
6. Sempre encoraje o aluno ao final, reforçando que ele está mais perto da aprovação!
''';

    final promptUsuario = '''
[DADOS DA QUESTÃO DO CONCURSO]
• Disciplina / Tópico: ${assunto ?? 'Conhecimentos do Edital'}
• Banca Organizadora: ${banca ?? 'Cebraspe / AOCP'}
• Enunciado da Questão: "$enunciado"
• Gabarito Oficial Definitivo: Letra $gabaritoOficial
• Comentário / Fundamento Técnico: "$comentario"

[DÚVIDA DO CANDIDATO]
"$pergunta"

Professor CRAVOU, responda diretamente para mim com toda a sua didática, carinho e clareza de mentor policial!
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
            'temperature': 0.75,
            'maxOutputTokens': 850,
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
      // Retorna null para o fallback seguro assumir se houver falha de rede ou chave inválida
      return null;
    }
  }
}
