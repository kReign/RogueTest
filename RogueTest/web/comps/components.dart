library components;

import "../game_object.dart";
import "dart:html";
import "../board.dart";
import "../position.dart";
import "../input.dart";

part "player_move.dart";

abstract class Component {
  
  GameObject parent;
  
  static Map<String, Function> comps = new Map<String, Function>();
  
  void update(double dt);
  
  static void init() {
    comps["Player_Move"] = (GameObject g) => new Player_Move(g);
  }
}