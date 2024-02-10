import 'package:ant_quest/actors/ant_player.dart';
import 'package:ant_quest/managers/segment_manager.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AntQuest extends FlameGame {
  late AntPlayer _ant;
  double objectSpeed = 0.0;

  void initializeGame() {
    // Assume that size.x < 3200
    final segmentsToLoad = (size.x / 640).ceil();
    segmentsToLoad.clamp(0, segments.length);

    for (var i = 0; i <= segmentsToLoad; i++) {
      loadGameSegments(i, (640 * i).toDouble());
    }

    _ant = AntPlayer(
      position: Vector2(128, canvasSize.y - 70),
    );
    world.add(_ant);
  }

  @override
  Future<void> onLoad() async {
    await images.loadAll([
      'block.png',
      'ember.png',
      'ground.png',
      'star.png',
      'water_enemy.png'
    ]);

    camera.viewfinder.anchor = Anchor.topLeft;
    initializeGame();
  }
}
