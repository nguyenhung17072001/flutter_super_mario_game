import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:super_mario_game/levels/level_component.dart';
import 'package:super_mario_game/levels/level_option.dart';


class SuperMarioBrosGame extends FlameGame {
  late CameraComponent cameraComponent;
  final World world = World();
  LevelComponent? _currentLevel;
  

  @override
  Future<void> onLoad() async {
    

    cameraComponent = CameraComponent(world: world)
    //..viewfinder.visibleGameSize = Vector2(450, 50)
    ..viewfinder.position = Vector2(0, 0)
    ..viewfinder.anchor = Anchor.topLeft
    ..viewport.position = Vector2(0, 0); 
    

    addAll([world, cameraComponent]);

    loadLevel(LevelOption.lv_1_1);
    
    return super.onLoad();
  }

  void loadLevel(LevelOption option) {
    _currentLevel?.removeFromParent();
    _currentLevel = LevelComponent(option);
    add(_currentLevel!);
  }


}