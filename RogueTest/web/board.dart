library board;

import 'dart:html';
import 'game_object.dart';
import 'position.dart';
import 'comps/components.dart';
import 'tile.dart';
import 'camera.dart';

class Board {

  static num tileWidth = 32;
  static num tileHeight = 32;
  
  static bool creaturesCanMove = false;

  Map<int, Tile> tiles;

  List<List<int>> currentMap;
  static int curMapWidth = 10;
  static int curMapHeight = 10;
  
  int curScreenWidth;
  int curScreenHeight;

  GameObject player = new GameObject("player", new Position.Zero());
  static List<GameObject> objects = new List<GameObject>();

	Camera camera = new Camera();

  Board(CanvasElement canvas) {

    // ~/ is truncating division
    curScreenWidth = canvas.width~/Board.tileWidth;
    curScreenHeight = canvas.height~/Board.tileHeight;

    tiles = new Map<int, Tile>();
    currentMap = new List<List<int>>(curMapWidth);

    for(int i = 0; i < curMapWidth; i++) {
      
      currentMap[i] = new List<int>(curMapHeight);
      
      for(int j = 0; j < curMapHeight; j++) {
        currentMap[i][j] = 1;
        tiles.putIfAbsent(currentMap[i][j], () => new Tile(currentMap[i][j], Board.tileWidth, Board.tileHeight));
      }
    }
    
    objects.add(new GameObject("ghost", new Position(5, 5)));
    player.addComponent("Player_Move", new Player_Move(player));
    
    camera.target = player;
    
  }

  void load(String mapName) {
  }

  /*
   * function to get gameobject at x,y
   * should return GameObject?
   * probably just loop through list of all active game objects and check coordinates
   *
   *
   *
   */
  
  

  static bool isOccupied(Position p) {

    objects.forEach((e) {
      if (e.position.x == p.x && e.position.y == p.y) {
        //if object takes up space
        return true;
      }
    });

    return false;
  }
  
  static bool isOpen(Position p) {
    bool open = true;
    
    if(isOccupied(p) || p.x < 0 || p.y < 0 || p.x >= curMapWidth || p.y >= curMapHeight) {
      open = false;
    }
    
    return open;
    
  }

  void update(double dt) {
		//camera.centerOn(new Position(5, 20), curMapWidth, curMapHeight);
    
    player.update(dt);
    
    objects.forEach((e) {
      e.update(dt);
    });
    
    camera.update(curScreenWidth, curScreenHeight);
    
    
  }

  void draw(CanvasRenderingContext2D ctx) {

    for( int i = 0; i < curMapWidth; i++ ) {
      for( int j = 0; j < curMapHeight; j++ ) {
        
        tiles[currentMap[i][j]].draw(ctx, new Position(i, j), camera);
      }
    }
    
    player.draw(ctx, camera);
    objects.forEach((e) {
      e.draw(ctx, camera);
    });
    
  }

}