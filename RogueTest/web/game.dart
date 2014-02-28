import 'dart:html';
import 'board.dart';
import 'camera.dart';

class Game {
  
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  
  int height;
  int width;
  
  num elapsedTime = 0.0;
  num dt = 0.0;
  
  Board board;
  Camera camera;
  
  void init() {
    canvas = querySelector("#mainCanvas");
    ctx = canvas.getContext("2d");
    
    height = canvas.height;
    width = canvas.width;
    
    board = new Board(canvas);
    camera = new Camera();
  }
  
 
  void GameLoop(newTime) {
    
    dt = (newTime - elapsedTime) / 1000;
    elapsedTime = newTime;
    
    ctx.fillStyle = "#FFFFFF";
    ctx.fillRect(0, 0, width, height);
    
    board.Update(dt);
    board.Draw(ctx, camera.pos);
    
    ctx.fillStyle = "#000000";
    ctx.fillText((1/dt).toString(), 10, 10);
      
    window.animationFrame.then(GameLoop);
  }
  
  
}