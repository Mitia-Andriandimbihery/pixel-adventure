import 'dart:async';

import 'package:flame/game.dart';
import 'package:pixel_adventure/game/background.dart';

class PixelAdventureGame extends FlameGame {
  Background _background = Background();

  @override
  FutureOr<void> onLoad() {
    add(_background);
    return super.onLoad();
  }
}
