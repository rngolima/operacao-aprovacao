// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'dart:js' as js;
import 'package:flutter/foundation.dart';
import 'professor_cravou_audio_interface.dart';

class ProfessorCravouAudioPlatform implements ProfessorCravouAudioInterface {
  VoidCallback? _onStart;
  VoidCallback? _onDone;
  bool _speaking = false;

  ProfessorCravouAudioPlatform() {
    try {
      js.context['_cravouVoiceStateListener'] = (bool isSpeaking) {
        _speaking = isSpeaking;
        if (!isSpeaking) {
          _onDone?.call();
        }
      };
    } catch (_) {}
  }

  @override
  void speak(String text, {VoidCallback? onStart, VoidCallback? onDone}) {
    _onStart = onStart;
    _onDone = onDone;
    try {
      final voiceObj = js.context['professorCravouVoice'];
      if (voiceObj != null) {
        _speaking = true;
        _onStart?.call();
        voiceObj.callMethod('speak', [text]);
      } else {
        _falarNativoWeb(text);
      }
    } catch (_) {
      _falarNativoWeb(text);
    }
  }

  void _falarNativoWeb(String text) {
    try {
      final synth = html.window.speechSynthesis;
      if (synth != null) {
        synth.cancel();
        // Remove pontuações e emojis para fala fluida
        final cleanText = text
            .replaceAll(RegExp(r'[\*\_#`>]'), '')
            .replaceAll(RegExp(r'[🦉🦅👉💡🎯🔍⚖️⚡✨✓✗💬📢🔊⏸️]'), '')
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();

        final utterance = html.SpeechSynthesisUtterance(cleanText);
        utterance.lang = 'pt-BR';
        utterance.rate = 1.0;
        _speaking = true;
        _onStart?.call();

        utterance.onEnd.listen((_) {
          _speaking = false;
          _onDone?.call();
        });
        utterance.onError.listen((_) {
          _speaking = false;
          _onDone?.call();
        });

        synth.speak(utterance);
      }
    } catch (_) {
      _speaking = false;
      _onDone?.call();
    }
  }

  @override
  void playMp3Base64(String base64Mp3, {VoidCallback? onStart, VoidCallback? onDone}) {
    _onStart = onStart;
    _onDone = onDone;
    try {
      final elevenPlayer = js.context['elevenLabsPlayer'];
      if (elevenPlayer != null) {
        _speaking = true;
        _onStart?.call();
        elevenPlayer.callMethod('playBase64', [base64Mp3]);
      }
    } catch (_) {
      _speaking = false;
      _onDone?.call();
    }
  }

  @override
  void stop() {
    _speaking = false;
    try {
      final elevenPlayer = js.context['elevenLabsPlayer'];
      if (elevenPlayer != null) {
        elevenPlayer.callMethod('stop');
      }
    } catch (_) {}

    try {
      final voiceObj = js.context['professorCravouVoice'];
      if (voiceObj != null) {
        voiceObj.callMethod('stop');
      } else {
        html.window.speechSynthesis?.cancel();
      }
    } catch (_) {}
    _onDone?.call();
  }

  @override
  bool get isSpeaking {
    try {
      final elevenPlayer = js.context['elevenLabsPlayer'];
      if (elevenPlayer != null && elevenPlayer.callMethod('isPlaying') == true) {
        return true;
      }
    } catch (_) {}

    try {
      final voiceObj = js.context['professorCravouVoice'];
      if (voiceObj != null) {
        return voiceObj.callMethod('isSpeaking') == true;
      }
      return html.window.speechSynthesis?.speaking ?? _speaking;
    } catch (_) {
      return _speaking;
    }
  }
}
