import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:super_mario_game/constants/globals.dart';


class SuperMarioBrosGame extends FlameGame {

  @override
  Future<void> onLoad() async {
    TiledComponent map = await TiledComponent.load(
      Globals.lv_1_1,
      Vector2.all(Globals.tileSize)
    );

    add(map);

    return super.onLoad();
  }
}