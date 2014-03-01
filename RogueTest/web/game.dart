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

  void init() {
    canvas = querySelector("#mainCanvas");
    ctx = canvas.getContext("2d");

    height = canvas.height;
    width = canvas.width;

    board = new Board(canvas);
  }

  void GameLoop(newTime) {

    dt = (newTime - elapsedTime) / 1000;
    elapsedTime = newTime;

		Update(dt);
		Draw();

    window.animationFrame.then(GameLoop);
  }

	void Update(double dt) {
		board.Update(dt);
	}

	void Draw() {

		ctx.fillStyle = "#FFFFFF";
  	ctx.fillRect(0, 0, width, height);

		board.Draw(ctx);

    ctx.fillStyle = "#000000";
    ctx.fillText((1/dt).toString(), 10, 10);

	}


}