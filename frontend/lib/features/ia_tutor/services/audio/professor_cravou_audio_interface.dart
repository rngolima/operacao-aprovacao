import 'package:flutter/foundation.dart';

abstract class ProfessorCravouAudioInterface {
  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone});
  void stop();
  bool get isSpeaking;
}
