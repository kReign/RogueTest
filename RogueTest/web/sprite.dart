library sprite;

import 'dart:html';

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

  Sprite(this.name, this.width, this.height, this.numFrames, {animDelay, image}) {
    if(image != null) {
      this.img = image;
    }
    else {
      this.img = new ImageElement(src:"media/img/$name.png");
    }

    img.onLoad.listen((e) {
      this.loaded = true;
    });

    this.currentFrame = 0;
  }

  Update(double dt) {

    if(this.numFrames > 1) {

      this.delayCounter += dt;

      if(this.delayCounter >= this.animDelay) {

        this.currentFrame += 1;
        if(this.currentFrame == this.numFrames) {
          this.currentFrame = 0;
        }
        this.delayCounter = 0.0;
      }
    }
  }

  Draw(CanvasRenderingContext2D ctx, x, y, camera) {

    if(this.loaded) {
      if(this.numFrames > 1) {
        ctx.drawImageScaledFromSource(this.img, (this.width*this.currentFrame), 0, this.width, this.height, x, y, this.width, this.height);
      }
      else {
        ctx.drawImage(this.img, x-camera.x, y-camera.y);
      }
    }
  }


}