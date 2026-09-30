import 'package:flutter/foundation.dart';

abstract class ProfessorCravouAudioInterface {
  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone});
  void playMp3Base64(String base64Mp3, {VoidCallback? onStart, VoidCallback? onDone});
  void stop();
  bool get isSpeaking;
}
