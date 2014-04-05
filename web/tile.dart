library tile;

import 'sprite.dart';
import 'dart:html';
import 'board.dart';
import 'position.dart';

class Tile {

  static Map<int, String> tileNames = {
    0 : "dirt",
    1 : "grass",
    2 : "other"
  };

  int type;
  Sprite sprite;

  Tile(this.type, tileWidth, tileHeight) {

    sprite = new Sprite(Tile.tileNames[type], tileWidth, tileHeight, 1);
  }

  void update(dt) {
    sprite.update(dt);
  }

  void draw(CanvasRenderingContext2D ctx, Position pos, camera) {
    sprite.draw(ctx, new Position((pos.x - camera.x)*Board.tileWidth, (pos.y - camera.y)*Board.tileHeight));
  }

}
