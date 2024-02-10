import 'package:ant_quest/ant_quest.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const GameWidget<AntQuest>.controlled(gameFactory: AntQuest.new));
}
