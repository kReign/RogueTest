library components;

import "../game_object.dart";
import "dart:html";
import "../board.dart";
import "../position.dart";
import "../input.dart";

part "player_move.dart";

abstract class Component {
  
  GameObject parent;
  
  void update(double dt);
  
  static void name() {
    
  }
}