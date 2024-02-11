import 'package:ant_quest/actors/hostile_animal.dart';
import 'package:ant_quest/objects/food.dart';
import 'package:flame/components.dart';
import '../objects/ground_block.dart';
import '../objects/platform_block.dart';

class Block {
  // gridPosition position is always segment based X,Y.
  // 0,0 is the bottom left corner.
  // 10,10 is the upper right corner.
  final Vector2 gridPosition;
  final Type blockType;
  Block(this.gridPosition, this.blockType);
}

final segments = [segment0, segment1, segment2];

final segment0 = [
  //bottom
  Block(Vector2(0, 0), GroundBlock),
  Block(Vector2(1, 0), GroundBlock),
  Block(Vector2(2, 0), GroundBlock),
  Block(Vector2(3, 0), GroundBlock),
  Block(Vector2(4, 0), GroundBlock),
  Block(Vector2(5, 0), GroundBlock),
  Block(Vector2(6, 0), GroundBlock),
  Block(Vector2(5, 1), HostileAnimal),
  //left
  Block(Vector2(-1, 1), PlatformBlock),
  Block(Vector2(-1, 2), PlatformBlock),
  Block(Vector2(-1, 3), PlatformBlock),
  Block(Vector2(-1, 4), PlatformBlock),
  Block(Vector2(-1, 5), PlatformBlock),
  Block(Vector2(-1, 6), PlatformBlock),
  Block(Vector2(-1, 7), PlatformBlock),
  Block(Vector2(-1, 8), PlatformBlock),
  Block(Vector2(-1, 9), PlatformBlock),
  Block(Vector2(-1, 10), PlatformBlock),
  //right
  Block(Vector2(6, 1), PlatformBlock),
  Block(Vector2(6, 2), PlatformBlock),
  Block(Vector2(6, 3), PlatformBlock),
  Block(Vector2(6, 4), PlatformBlock),
  Block(Vector2(6, 5), PlatformBlock),
  Block(Vector2(6, 6), PlatformBlock),
  Block(Vector2(6, 7), PlatformBlock),
  Block(Vector2(6, 8), PlatformBlock),
  Block(Vector2(6, 9), PlatformBlock),
  Block(Vector2(6, 10), PlatformBlock),
  Block(Vector2(6, 11), PlatformBlock),
  Block(Vector2(6, 12), PlatformBlock),
  //top
  Block(Vector2(0, 12), PlatformBlock),
  Block(Vector2(1, 12), PlatformBlock),
  Block(Vector2(2, 12), PlatformBlock),
  Block(Vector2(3, 12), PlatformBlock),
  Block(Vector2(4, 12), PlatformBlock),
  Block(Vector2(5, 12), PlatformBlock),
  //food
  Block(Vector2(0, 10), Food),
  Block(Vector2(5, 11), Food),
  Block(Vector2(2, 7), Food),
  Block(Vector2(5, 2), Food),
  //obstackle
  Block(Vector2(0, 9), PlatformBlock),
  Block(Vector2(1, 9), PlatformBlock),
  Block(Vector2(1, 3), PlatformBlock),
  Block(Vector2(1, 4), PlatformBlock),
  Block(Vector2(1, 6), PlatformBlock),
  Block(Vector2(2, 6), PlatformBlock),
  Block(Vector2(3, 6), PlatformBlock),
  Block(Vector2(3, 7), PlatformBlock),
  Block(Vector2(3, 8), PlatformBlock),
  Block(Vector2(3, 9), PlatformBlock),
  Block(Vector2(3, 3), PlatformBlock),
  Block(Vector2(5, 3), PlatformBlock),
  Block(Vector2(4, 3), PlatformBlock),
  Block(Vector2(4, 9), PlatformBlock),
  Block(Vector2(5, 7), PlatformBlock),
  Block(Vector2(1, 8), PlatformBlock),
  Block(Vector2(1, 10), PlatformBlock),
  Block(Vector2(3, 11), PlatformBlock),
  //hostile animal
  Block(Vector2(5, 10), HostileAnimal),
];

final segment1 = [];

final segment2 = [];
