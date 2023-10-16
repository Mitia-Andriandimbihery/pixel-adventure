import 'package:flame/components.dart';
import 'package:flame/parallax.dart';

class Background extends ParallaxComponent with HasGameRef {
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
  }
}
