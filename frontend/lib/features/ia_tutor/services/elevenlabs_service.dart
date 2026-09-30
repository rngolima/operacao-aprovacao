import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';

/// Serviço de integração com a API Oficial da ElevenLabs (https://elevenlabs.io).
/// Gera áudios falados ultra-realistas com qualidade de cinema e entonação humana.
class ElevenLabsService {
  final Dio _dio;

  // Vozes recomendadas em Português da ElevenLabs
  static const Map<String, String> vozesRecomendadas = {
    'JBFqnCBsd6RMkjVDRZzb': 'George (Professor Sábio & Confiante)',
    'pNInz6obpgDQGcFmaJgB': 'Adam (Mentor Tático & Enérgico)',
    '21m00Tcm4TlvDq8ikWAM': 'Rachel (Professora Clara & Acolhedora)',
    'TX3LPaxmHKxFdv7VOQHJ': 'Liam (Instrutor Jovem & Articulado)',
  };

  ElevenLabsService({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 40),
              ),
            );

  /// Limpa o texto de markdown e pontuações excessivas para fala perfeita
  String limparTextoParaAudio(String texto) {
    return texto
        .replaceAll(RegExp(r'[\*\_#`>]'), '')
        .replaceAll(RegExp(r'[🦉🦅👉💡🎯🔍⚖️⚡✨✓✗💬📢🔊⏸️🎙️]'), '')
        .replaceAll(RegExp(r'https?:\/\/\S+'), '')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  /// Gera o áudio MP3 a partir do texto via API da ElevenLabs
  /// Retorna a string Base64 do áudio MP3 para reprodução imediata.
  Future<String?> sintetizarVozBase64({
    required String apiKey,
    required String texto,
    String voiceId = 'JBFqnCBsd6RMkjVDRZzb', // George por padrão
  }) async {
    final key = apiKey.trim();
    if (key.isEmpty) return null;

    final cleanText = limparTextoParaAudio(texto);
    if (cleanText.isEmpty) return null;

    final url = 'https://api.elevenlabs.io/v1/text-to-speech/${voiceId.trim()}';

    try {
      final response = await _dio.post<List<int>>(
        url,
        data: {
          'text': cleanText,
          'model_id': 'eleven_multilingual_v2',
          'voice_settings': {
            'stability': 0.55,
            'similarity_boost': 0.85,
            'style': 0.15,
            'use_speaker_boost': true,
          }
        },
        options: Options(
          headers: {
            'xi-api-key': key,
            'Content-Type': 'application/json',
            'Accept': 'audio/mpeg',
          },
          responseType: ResponseType.bytes,
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        final bytes = Uint8List.fromList(response.data!);
        return base64Encode(bytes);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
