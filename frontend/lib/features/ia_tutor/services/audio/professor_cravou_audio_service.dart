import 'package:flutter/foundation.dart';
import '../../../../core/storage/secure_storage_service.dart';
import '../elevenlabs_service.dart';
import 'professor_cravou_audio_interface.dart';
import 'professor_cravou_audio_stub.dart'
    if (dart.library.html) 'professor_cravou_audio_web.dart';

/// Serviço Singleton para gerenciar a fala por áudio do Professor CRAVOU AI.
/// Suporta áudio ultra-realista da ElevenLabs (MP3) com fallback imediato para síntese local.
class ProfessorCravouAudioService {
  static final ProfessorCravouAudioService _instance = ProfessorCravouAudioService._internal();
  factory ProfessorCravouAudioService() => _instance;

  final ProfessorCravouAudioInterface _platform = ProfessorCravouAudioPlatform();
  final ElevenLabsService _elevenLabsService = ElevenLabsService();
  final SecureStorageService _storage = SecureStorageService();

  ProfessorCravouAudioService._internal();

  /// Fala usando a melhor voz disponível:
  /// Se houver chave ElevenLabs configurada, sintetiza áudio de cinema com ElevenLabs.
  /// Se não houver ou em ambiente de teste/offline, utiliza síntese nativa pt-BR.
  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone}) {
    try {
      _storage.getElevenLabsApiKey().then((elevenKey) {
        if (elevenKey != null && elevenKey.trim().isNotEmpty) {
          _storage.getElevenLabsVoiceId().then((voiceId) {
            _elevenLabsService
                .sintetizarVozBase64(
                  apiKey: elevenKey,
                  texto: text,
                  voiceId: voiceId,
                )
                .then((mp3Base64) {
                  if (mp3Base64 != null && mp3Base64.isNotEmpty) {
                    _platform.playMp3Base64(mp3Base64, onStart: onStart, onDone: onDone);
                  } else {
                    _platform.speak(text, onStart: onStart, onDone: onDone);
                  }
                })
                .catchError((_) {
                  _platform.speak(text, onStart: onStart, onDone: onDone);
                });
          }).catchError((_) {
            _platform.speak(text, onStart: onStart, onDone: onDone);
          });
        } else {
          _platform.speak(text, onStart: onStart, onDone: onDone);
        }
      }).catchError((_) {
        _platform.speak(text, onStart: onStart, onDone: onDone);
      });
    } catch (_) {
      _platform.speak(text, onStart: onStart, onDone: onDone);
    }
  }

  void playMp3Base64(String base64Mp3, {VoidCallback? onStart, VoidCallback? onDone}) {
    _platform.playMp3Base64(base64Mp3, onStart: onStart, onDone: onDone);
  }

  void stop() {
    _platform.stop();
  }

  bool get isSpeaking => _platform.isSpeaking;
}
