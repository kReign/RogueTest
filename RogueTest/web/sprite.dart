library sprite;

import 'dart:html';
import 'position.dart';

class Sprite {

  String name;
  int width;
  int height;
  ImageElement img;
  int currentFrame;
  int numFrames;
  double delayCounter = 0.0;
  double animDelay = .5;
  bool loaded = false;

  Sprite(this.name, this.width, this.height, {animDelay, image}) {
    if(image != null) {
      img = image;
    }
    else {
      img = new ImageElement(src:"media/img/$name.png");
    }

    img.onLoad.listen((e) {
      loaded = true;
      numFrames = img.width~/width;
    });

    currentFrame = 0;
  }

  update(double dt) {

    if(numFrames > 1) {

      delayCounter += dt;

      if(delayCounter >= animDelay) {

        currentFrame += 1;
        if(currentFrame == numFrames) {
          currentFrame = 0;
        }
        delayCounter = 0.0;
      }
    }
  }

  draw(CanvasRenderingContext2D ctx, Position pos) {

    if(loaded) {
      if(numFrames > 1) {
        ctx.drawImageScaledFromSource(img, (width*currentFrame), 0, width, height, pos.x, pos.y, width, height);
      }
      else {
        ctx.drawImage(img, pos.x, pos.y);
      }
    }
  }


}