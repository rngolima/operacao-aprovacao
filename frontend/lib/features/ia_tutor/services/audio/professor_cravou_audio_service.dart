import 'package:flutter/foundation.dart';
import 'professor_cravou_audio_interface.dart';
import 'professor_cravou_audio_stub.dart'
    if (dart.library.html) 'professor_cravou_audio_web.dart';

/// Serviço Singleton para gerenciar a fala por áudio do Professor CRAVOU AI.
class ProfessorCravouAudioService {
  static final ProfessorCravouAudioService _instance = ProfessorCravouAudioService._internal();
  factory ProfessorCravouAudioService() => _instance;

  final ProfessorCravouAudioInterface _platform = ProfessorCravouAudioPlatform();

  ProfessorCravouAudioService._internal();

  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone}) {
    _platform.speak(text, onStart: onStart, onDone: onDone);
  }

  void stop() {
    _platform.stop();
  }

  bool get isSpeaking => _platform.isSpeaking;
}
