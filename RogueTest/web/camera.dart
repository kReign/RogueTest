library camera;
import 'position.dart';

class Camera {
  Position pos = new Position.Zero();

	get x => pos.x;
	set x(int n) => pos.x = n;

	get y => pos.y;
	set y(int n) => pos.y = n;

	void CenterOn(Position p, curMapWidth, curMapHeight) {
		pos.x = p.x - curMapWidth~/2;
		pos.y = p.y - curMapHeight~/2;
	}
}