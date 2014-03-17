part of components;

class Player_Move extends Component {
  
  GameObject parent;
  
  Player_Move(this.parent);
  
  void update(double dt) {
    
    Position newPos = new Position(parent.position.x, parent.position.y);
    
    if(Input.isPressed(KeyCode.W)) {
      newPos.y = parent.position.y - 1;
    }
    else if(Input.isPressed(KeyCode.A)) {
      newPos.x = parent.position.x - 1;
    }
    else if(Input.isPressed(KeyCode.S)) {
      newPos.y = parent.position.y + 1;
    }
    else if(Input.isPressed(KeyCode.D)) {
      newPos.x = parent.position.x + 1;
    }
    
    if(Board.isOpen(newPos) && (newPos.x != parent.position.x || newPos.y != parent.position.y)) {
      parent.position.copy(newPos);
    }
    
    
  }
}