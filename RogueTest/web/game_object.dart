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
  bool transparent;
  
  Map<String, Component> components = new Map<String, Component>();
  
  GameObject(this.name, this.position) {
    sprite = new Sprite(name, Board.tileWidth, Board.tileHeight);
    occupiesSpace = objectData[this.name]["occupiesSpace"];
    transparent = objectData[this.name]["transparent"];
    
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
    ctx.globalAlpha = (transparent) ? 0.5 : 1.0;
    
    sprite.draw(ctx, new Position((position.x - camera.x)*Board.tileWidth, 
                                  (position.y - camera.y)*Board.tileHeight));
    ctx.globalAlpha = 1.0;
  }
  
}