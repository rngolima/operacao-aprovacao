import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Permite rolagem fluida por arrasto com mouse, touch e trackpad em qualquer plataforma (Web, Mobile, Desktop).
class AppScrollBehavior extends MaterialScrollBehavior {
  const AppScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
