import 'package:ant_quest/ant_quest.dart';
import 'package:flame/components.dart';

class GroundBlock extends SpriteAnimationComponent
    with HasGameReference<AntQuest> {
  GroundBlock({required super.position})
      : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('ground.png'),
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.12, textureSize: Vector2.all(16)));
  }
}
