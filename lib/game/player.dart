import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:pixel_adventure/game/pixel_adventure.dart';

enum PlayerState { idle, running, jumping }

class Player extends SpriteAnimationGroupComponent
    with HasGameRef<PixelAdventureGame> {
  Player({position}) : super(position: position);

  final double stepTime = 0.05;

  late List<Image> imageList;

  late final SpriteAnimation idleAnimation;
  late final SpriteAnimation runningAnimation;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  _loadAllAnimations() async {
    idleAnimation = await _spriteAnimation("Idle", 11);
    runningAnimation = await _spriteAnimation("Run", 12);

    animations = {
      PlayerState.idle: idleAnimation,
      PlayerState.running: runningAnimation
    };

    current = PlayerState.running;
  }

  Future<SpriteAnimation> _spriteAnimation(String state, int amount) async {
    return SpriteAnimation.fromFrameData(
      await game.images.load('Ninja Frog/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
