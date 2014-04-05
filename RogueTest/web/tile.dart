library tile;

import 'sprite.dart';
import 'dart:html';
import 'board.dart';
import 'position.dart';

class Tile {

  static Map _tiles = {
    0 : {"name":"dirt", "traversable":true},
    1 : {"name":"grass", "traversable":true},
    2 : {"name":"water", "traversable":false},
  };

  int type;
  Sprite sprite;
  
  String name() {
    return _tiles[type]["name"];
  }

  Tile(this.type, tileWidth, tileHeight) {

    sprite = new Sprite(_tiles[type]["name"], tileWidth, tileHeight);
  }
  
  bool isTraversable() => _tiles[type]["traversable"];

  void update(dt) {
    sprite.update(dt);
  }

  void draw(CanvasRenderingContext2D ctx, Position pos, camera) {
    sprite.draw(ctx, new Position((pos.x - camera.x)*Board.tileWidth, (pos.y - camera.y)*Board.tileHeight));
  }

}
