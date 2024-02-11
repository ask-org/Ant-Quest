import 'package:ant_quest/actors/hostile_animal.dart';
import 'package:ant_quest/ant_quest.dart';
import 'package:ant_quest/objects/food.dart';
import 'package:ant_quest/objects/ground_block.dart';
import 'package:ant_quest/objects/platform_block.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/services.dart';

class AntPlayer extends SpriteAnimationComponent
    with KeyboardHandler, CollisionCallbacks, HasGameReference<AntQuest> {
  int horizontalDirection = 0;
  int verticalDirection = 0;
  final Vector2 velocity = Vector2.zero();
  final double moveSpeed = 200;
  final Vector2 fromAbove = Vector2(0, -1);
  bool isOnGround = false;
  bool hitByEnemy = false;

  AntPlayer({
    required super.position,
  }) : super(size: Vector2.all(64), anchor: Anchor.center);

  @override
  void onLoad() {
    animation = SpriteAnimation.fromFrameData(
        game.images.fromCache('ember.png'),
        SpriteAnimationData.sequenced(
            amount: 4, stepTime: 0.12, textureSize: Vector2.all(16)));
    add(CircleHitbox());
  }

  @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    horizontalDirection = 0;
    verticalDirection = 0;

    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyA) ||
            keysPressed.contains(LogicalKeyboardKey.arrowLeft))
        ? -1
        : 0;
    horizontalDirection += (keysPressed.contains(LogicalKeyboardKey.keyD) ||
            keysPressed.contains(LogicalKeyboardKey.arrowRight))
        ? 1
        : 0;
    verticalDirection += (keysPressed.contains(LogicalKeyboardKey.keyW) ||
            keysPressed.contains(LogicalKeyboardKey.arrowUp))
        ? -1
        : 0;
    verticalDirection += (keysPressed.contains(LogicalKeyboardKey.keyS) ||
            keysPressed.contains(LogicalKeyboardKey.arrowDown))
        ? 1
        : 0;
    return true;
  }

  @override
  void update(double dt) {
    velocity.x = horizontalDirection * moveSpeed;
    velocity.y = verticalDirection * moveSpeed;
    position += velocity * dt;
    super.update(dt);

    if (horizontalDirection < 0 && scale.x > 0) {
      flipHorizontally();
    } else if (horizontalDirection > 0 && scale.x < 0) {
      flipHorizontally();
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is GroundBlock || other is PlatformBlock) {
      if (intersectionPoints.length == 2) {
        final mid = (intersectionPoints.elementAt(0) +
                intersectionPoints.elementAt(1)) /
            2;

        final collisionNormal = absoluteCenter - mid;
        final separationDistance = (size.x / 2) - collisionNormal.length;
        collisionNormal.normalize();

        if (fromAbove.dot(collisionNormal) > 0.9) {
          isOnGround = true;
        }

        position += collisionNormal.scaled(separationDistance);
      }
    }

    super.onCollision(intersectionPoints, other);

    void hit() {
      if (!hitByEnemy) {
        hitByEnemy = true;
      }
      add(
        OpacityEffect.fadeOut(
          EffectController(
            alternate: true,
            duration: 0.1,
            repeatCount: 6,
          ),
        )..onComplete = () {
            hitByEnemy = false;
          },
      );
    }

    if (other is Food) {
      other.removeFromParent();
    }

    if (other is HostileAnimal) {
      hit();
    }
  }
}
