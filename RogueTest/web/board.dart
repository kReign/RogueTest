library board;

import 'dart:html';
import 'game_object.dart';
import 'position.dart';
import 'map_data.dart';
import 'tile.dart';
import 'camera.dart';

class Board {

  static num tileWidth = 32;
  static num tileHeight = 32;
  
  static bool creaturesCanMove = false;

  static Map<int, Tile> tiles;

  static List<List<int>> currentMap;
  static int curMapWidth = 10;
  static int curMapHeight = 5;
  
  int curScreenWidth;
  int curScreenHeight;

  static GameObject player = new GameObject("player", new Position.Zero());
  static List<GameObject> creatures = new List<GameObject>();

	Camera camera = new Camera();

  Board(CanvasElement canvas) {

    // ~/ is truncating division
    curScreenWidth = canvas.width~/Board.tileWidth;
    curScreenHeight = canvas.height~/Board.tileHeight;

    tiles = new Map<int, Tile>();
    currentMap = new List<List<int>>(curMapHeight);
    
    int count = 0;

    for(int i = 0; i < curMapHeight; i++) {
      
      currentMap[i] = new List<int>(curMapWidth);
      
      for(int j = 0; j < curMapWidth; j++) {
        
        currentMap[i][j] = int.parse(map_one[count]);
        //print(map_one[count] + " which should be equal to " + currentMap[i][j].toString());
        count++;
        tiles.putIfAbsent(currentMap[i][j], () => new Tile(currentMap[i][j], Board.tileWidth, Board.tileHeight));
        //print(currentMap[i][j].toString() + " which is " + tiles[currentMap[i][j]].name());
      }
      print(currentMap[i]);
    }
    
    creatures.add(new GameObject("ghost", new Position(3, 3)));
    
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
    
    bool occupied = false;

    creatures.forEach((e) {
      if (e.position.x == p.x && e.position.y == p.y) {
        if(e.occupiesSpace) {
          occupied = true;
        }
      }
    });

    return occupied;
  }
  
  static bool isOpen(Position p) {
    bool open = true;
    
    if(isOccupied(p) 
        || p.x < 0 
        || p.y < 0 
        || p.x >= curMapWidth 
        || p.y >= curMapHeight
        || !tiles[currentMap[p.y][p.x]].isTraversable()) {
      
      open = false;
    }
    
    return open;
    
  }

  void update(double dt) {
		//camera.centerOn(new Position(5, 20), curMapWidth, curMapHeight);
    
    player.update(dt);
    
    creatures.forEach((e) {
      e.update(dt);
    });
    
    tiles.forEach((k, v) {
      v.update(dt);
    });
    
    camera.update(curScreenWidth, curScreenHeight);
    
  }

  void draw(CanvasRenderingContext2D ctx) {

    for( int i = 0; i < curMapHeight; i++ ) {
      for( int j = 0; j < curMapWidth; j++ ) {
        
        tiles[currentMap[i][j]].draw(ctx, new Position(j, i), camera);
        //print("drawing " + currentMap[i][j].toString() + " at " + i.toString() + ", " + j.toString());
      }
    }
    
    player.draw(ctx, camera);
    creatures.forEach((e) {
      e.draw(ctx, camera);
    });
    
  }

}