extends Node


const SENSITIVITY := 0.7


var recoil_spring = Spring.new(8, 3, 2)
var mouse_drag: Vector3
var strength := 0.0

@onready var cam: Camera3D   #camera path




static func lerp_number(a: float,    b: float,    t: float):
	if t >= 1:		return b
	t = min(t, 1.0)
	a = float(a)
	b = float(b)
	
	return lerp(a, b, t)


func recoil() -> void:
	var y := 8.0
	var x := strength / 6.0
	
	strength += 4
	recoil_spring.shove(Vector3(x, y, 0))
	


func _process(delta: float) -> void:
	var recoil_vector: Vector3 = recoil_spring.update(delta) / 100.0
	
	strength = lerp_number(strength, 0, 0.1)
	
	
	
	cam.rotation = mouse_drag + recoil_vector


func _input(event: InputEvent) -> void:
	if ((event is InputEventScreenDrag) or (event is InputEventMouseMotion)):
		mouse_drag.x  = -event.relative.y * SENSITIVITY
		mouse_drag.y  = -event.relative.x * SENSITIVITY
	
	elif event.is_action_pressed('fire'): # ADD FIRE ACTION
		recoil()
