import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:super_mario_game/constants/globals.dart';
import 'package:super_mario_game/games/super_mario_bros_game.dart';
import 'package:super_mario_game/levels/level_option.dart';

class LevelComponent extends Component with HasGameRef<SuperMarioBrosGame> {
  final LevelOption option;

  late Rectangle _levelBounds;

  LevelComponent(this.option) : super();

  @override
  Future<void> onLoad() async {
    TiledComponent level = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize)
    );

    gameRef.world.add(level);


    _levelBounds = Rectangle.fromPoints(
      Vector2(0, 0),
      Vector2(
        level.tileMap.map.height.toDouble(),
        level.tileMap.map.width.toDouble() * Globals.tileSize
      )
    );
    
    return super.onLoad();
  }

  
}