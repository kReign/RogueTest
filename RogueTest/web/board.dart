library board;

import 'dart:html';
import 'game_object.dart';
import 'position.dart';
import 'sprite.dart';
import 'camera.dart';

class Board {

  static const num tileWidth = 32;
  static const num tileHeight = 32;

  List<List<int>> currentMap;
  int curMapWidth;
  int curMapHeight;

  List<GameObject> objects;

	Sprite player = new Sprite("player", Board.tileWidth, Board.tileHeight, 2);
	Sprite ghost = new Sprite("ghost", Board.tileWidth, Board.tileHeight, 2, animDelay:0.5);
	Sprite grass = new Sprite("grass", Board.tileWidth, Board.tileHeight, 1);

	Camera camera = new Camera();

  Board(CanvasElement canvas) {

    // ~/ is truncating division
    curMapWidth = canvas.width~/Board.tileWidth;
    curMapHeight = canvas.height~/Board.tileHeight;

    currentMap = new List(curMapHeight);
    currentMap.forEach((e) {
      e = new List(curMapWidth);
      e.forEach((f) {
        f = 1;
      });
    });

  }

  void Load(String mapName) {

  }

  /*
   * function to get gameobject at x,y
   * should return GameObject?
   * probably just loop through list of all active game objects and check coordinates
   *
   *
   *
   */

  bool IsOccupied(Position p) {


    return false;
  }

  void Update(double dt) {
		ghost.Update(dt);
		camera.CenterOn(new Position.Zero(), curMapWidth, curMapHeight);
  }

  void Draw(CanvasRenderingContext2D ctx) {

    ctx.fillStyle = "#00FF00";

    for( int i = 0; i < curMapWidth; i++ ) {
      for( int j = 0; j < curMapHeight; j++ ) {

        /*ctx.fillRect((i - cam.x)*Board.tileWidth,
                     (j - cam.y)*Board.tileHeight,
                     Board.tileWidth,
                     Board.tileHeight);*/

				grass.Draw(ctx, (i - camera.x)*Board.tileWidth, (j - camera.y)*Board.tileHeight, camera);
      }
    }

		player.Draw(ctx, 0, 0, camera);
		ghost.Draw(ctx, 5*Board.tileWidth, 5*Board.tileHeight, camera);
  }

}