import 'package:ant_quest/ant_quest.dart';
import 'package:ant_quest/overlays/game_over.dart';
import 'package:ant_quest/overlays/main_menu.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    GameWidget<AntQuest>.controlled(
      gameFactory: AntQuest.new,
      overlayBuilderMap: {
        'MainMenu': (_, game) => MainMenu(game: game),
        'GameOver': (_, game) => GameOver(game: game),
      },
      initialActiveOverlays: const ['MainMenu'],
    ),
  );
}
