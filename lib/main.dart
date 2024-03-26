import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_mario_game/constants/globals.dart';
import 'package:super_mario_game/constants/sprite_sheets.dart';
import 'package:super_mario_game/games/super_mario_bros_game.dart';
final SuperMarioBrosGame _superMarioBrosGame = SuperMarioBrosGame();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  await SpriteSheets.load();
  await FlameAudio.audioCache.loadAll(
    [
      Globals.jumpSmallSFX,
      Globals.pauseSFX,
      Globals.bumpSFX,
      Globals.powerUpAppearsSFX,
      Globals.breakBlockSFX,
    ]
  ); 
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () => SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive),
        child: GameWidget(
          game: _superMarioBrosGame,
        ),
      ),
    )
  );
}

