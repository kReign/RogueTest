library input;

import 'dart:html';

class Input {
  
  static Map<int, int> _keys = new Map<int, int>();
  static Map<int, int> _toRemove = new Map<int, int>();

  static init() {
    window.onKeyDown.listen((KeyboardEvent e) {
       
      // If the key is not set yet, set it with a timestamp.
      if (!_keys.containsKey(e.keyCode) && !_toRemove.containsKey(e.keyCode)) {
        _keys[e.keyCode] = e.timeStamp;
      }
       
    });
  
    window.onKeyUp.listen((KeyboardEvent e) {
      _keys.remove(e.keyCode);
      _toRemove.remove(e.keyCode);
    });
  }
  
  // A key is pressed if it has been pressed by user and not yet checked.
  // Once it is checked, it is not able to return true until after the next keyUp.
  
  static bool isPressed(int keyCode) {
    
    if (_keys.containsKey(keyCode) && !_toRemove.containsKey(keyCode)) {
      _keys.remove(keyCode);
      _toRemove[keyCode] = 1;
      
      return true;
    }
    
    return false;
    
  }

  /*static bool isAnyPressed(List<KeyCode> keys, [bool clear = false]) {
    bool ret = false;
    keys.forEach((key) {
      if (isPressed(key, clear)) ret = true;
    });

    return ret;
  }*/
}