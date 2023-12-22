# spring
3d spring,   awesome for recoil



# Create
```gdscript
var recoil_spring := Spring.new(8, 3, 2, 8)   # mass, force, damping, speed
```


# Shove
```gdscript
func recoil() -> void:
   var y := 8.0
   var x := 1.0

   recoil_spring.shove(Vector3(x, y, 0))
```


# Get / Update
```gdscript
func _process(delta: float) -> void:
  var recoil_vector: Vector3 = recoil_spring.update(delta) / 100.0

   cam.rotation = mouse_drag + recoil_vector
```


# Mouse Drag
```gdscript
func _input(event: InputEvent) -> void:
   if ((event is InputEventScreenDrag) or (event is InputEventMouseMotion)):
      mouse_drag.x  = -event.relative.y * SENSITIVITY
      mouse_drag.y  = -event.relative.x * SENSITIVITY

  elif event.is_action_pressed('fire'): # ADD FIRE ACTION IN INPUTMAP
      recoil()
```
