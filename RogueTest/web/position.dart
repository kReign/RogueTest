library position;

class Position {
  int x;
  int y;

  Position.Zero() : this.x = 0, this.y = 0;
  Position(this.x, this.y);
  
  void copy(Position p) {
    x = p.x;
    y = p.y;
  }

  /*
   * A function like DistanceTo is going to need to take
   * into account obstacles. Obviously that is going to require
   * the use of Dijkstra's or A* or something similar.
   */
  Position distanceTo(Position p) => new Position(this.x - p.x, this.y - p.y);
  
  Position operator *(Position rhs) => new Position(this.x * rhs.x, this.y * rhs.y);
}