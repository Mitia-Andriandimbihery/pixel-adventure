import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:pixel_adventure/game/player.dart';

class Background extends ParallaxComponent with HasGameRef {
  final Player player = Player();
  final int groundHeight = 80;
  final int playerHeight = 32;
  final double playerStartPosition = 80.0;

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('Jungle/background1.png'),
        ParallaxImageData('Jungle/background2.png'),
        ParallaxImageData('Jungle/background3.png'),
        ParallaxImageData('Jungle/ground.png'),
      ],
      baseVelocity: Vector2(20, 0),
      velocityMultiplierDelta: Vector2(1.8, 1.0),
    );

    final screenSize = game.size;
    player.position = Vector2(playerStartPosition, screenSize.y - groundHeight - playerHeight);
    add(player);
  }
}
