library game_object;

import 'dart:html';
import 'board.dart';
import 'position.dart';
import 'sprite.dart';
import 'camera.dart';
import 'object_data.dart' as od;
import 'dart:convert';
import 'comps/components.dart';

class GameObject {
  static Map objectData = JSON.decode(od.objectData);
  
  Position position;
  Sprite sprite;
  String name;
  
  bool occupiesSpace;
  
  Map<String, Component> components = new Map<String, Component>();
  
  GameObject(this.name, this.position) {
    sprite = new Sprite(name, Board.tileWidth, Board.tileHeight, objectData[this.name]["numFrames"]);
    occupiesSpace = objectData[this.name]["occupiesSpace"];
    
    if(objectData[this.name]["components"]!=null) {
      objectData[this.name]["components"].forEach((e) {
        addComponent(e);
      });
    }
    
  }
  
  Component getComponent(String comp) => components[comp];
  
  void addComponent(String name) {
    components.putIfAbsent(name, () => Component.comps[name](this));
  }
  
  void update(double dt) {
    sprite.update(dt);
    
    components.forEach((k, v) {
      v.update(dt);   
    });
  }
  
  void draw(CanvasRenderingContext2D ctx, Camera camera) {
    sprite.draw(ctx, new Position((position.x - camera.x)*Board.tileWidth, (position.y - camera.y)*Board.tileHeight));
  }
  
}