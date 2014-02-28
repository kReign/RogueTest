library board;

import 'dart:html';
import 'game_object.dart';
import 'position.dart';

class Board {
  
  static const num tileWidth = 32;
  static const num tileHeight = 32;
  
  List<List<int>> currentMap;
  int curMapWidth;
  int curMapHeight;
  
  List<GameObject> objects;
  
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
    
  }
  
  void Draw(CanvasRenderingContext2D ctx, Position cam) {
    
    ctx.fillStyle = "#00FF00";
    
    for( int i = 0; i < curMapWidth; i++ ) {
      for( int j = 0; j < curMapHeight; j++ ) {
        
        ctx.fillRect((i - cam.x)*Board.tileWidth + i, 
                     (j - cam.y)*Board.tileHeight + j, 
                     Board.tileWidth, 
                     Board.tileHeight);
      }
    }
  }
  
}