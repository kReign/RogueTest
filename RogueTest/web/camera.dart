library camera;

import 'position.dart';
import 'game_object.dart';

class Camera {
  Position pos = new Position.Zero();
  
  GameObject target;

	get x => pos.x;
	set x(int n) => pos.x = n;

	get y => pos.y;
	set y(int n) => pos.y = n;

	void centerOn(Position p, curMapWidth, curMapHeight) {
		pos.x = p.x - curMapWidth~/2;
		pos.y = p.y - curMapHeight~/2;
	}
	
	void update(int screenW, int screenH) {
	  if(target != null) {
	    centerOn(target.position, screenW, screenH);
	  }
	}
}