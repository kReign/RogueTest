library position;

class Position {
  int x;
  int y;

  Position(this.x, this.y) {}

  Position DistanceTo(Position p) => new Position(this.x - p.x, this.y - p.y);

}