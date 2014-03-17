library game_object;

import 'dart:html';
import 'board.dart';
import 'position.dart';
import 'sprite.dart';
import 'camera.dart';
import 'comps/components.dart';

class GameObject {
  Position position;
  Sprite sprite;
  
  String name;
  
  Map<String, Component> components = new Map<String, Component>();
  
  GameObject(this.name, this.position) {
    sprite = new Sprite(name, 32, 32, 2);
  }
  
  Component getComponent(String comp) => components[comp];
  
  void addComponent(String name, Component c) {
    components.putIfAbsent(name, () => c);
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