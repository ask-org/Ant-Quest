import 'package:ant_quest/ant.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

class AntQuest extends FlameGame {
  late AntPlayer _ant;

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

    _ant = AntPlayer(
      position: Vector2(50, 50),
    );
    world.add(_ant);
  }
}
