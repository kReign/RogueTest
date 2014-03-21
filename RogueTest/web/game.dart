import 'dart:html';
import 'board.dart';
import 'input.dart';
import 'comps/components.dart';
import 'game_object.dart';

class Game {

  CanvasElement canvas;
  CanvasRenderingContext2D ctx;

  int height;
  int width;

  num elapsedTime = 0.0;
  num dt = 0.0;

  Board board;

  void init() {
    canvas = querySelector("#mainCanvas");
    ctx = canvas.getContext("2d");

    height = canvas.height;
    width = canvas.width;
    
    Component.init();
    board = new Board(canvas);
    Input.init();
  }

  void gameLoop(newTime) {

    dt = (newTime - elapsedTime) / 1000;
    elapsedTime = newTime;

		update(dt);
		draw();

    window.animationFrame.then(gameLoop);
  }

	void update(double dt) {
		board.update(dt);
	}

	void draw() {

		ctx.fillStyle = "#FFFFFF";
  	ctx.fillRect(0, 0, width, height);

		board.draw(ctx);

    ctx.fillStyle = "#FFFFFF";
    ctx.fillText((1/dt).toString(), 10, 10);
    
    ctx.fillText((Input.isPressed(KeyCode.E).toString()), 10, 20);

	}


}