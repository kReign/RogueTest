import 'dart:html';
import 'game.dart';

void main() {
  
  Game game = new Game();
  
  game.init();
  
  window.animationFrame.then(game.GameLoop);
}
