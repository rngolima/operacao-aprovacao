import 'package:flutter/foundation.dart';
import 'professor_cravou_audio_interface.dart';

class ProfessorCravouAudioPlatform implements ProfessorCravouAudioInterface {
  bool _speaking = false;

  @override
  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone}) {
    _speaking = true;
    onStart?.call();
    // Em ambiente stub/teste conclui suavemente
    Future.delayed(const Duration(milliseconds: 100), () {
      _speaking = false;
      onDone?.call();
    });
  }

  @override
  void stop() {
    _speaking = false;
  }

  @override
  bool get isSpeaking => _speaking;
}
