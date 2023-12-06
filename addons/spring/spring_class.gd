extends Node
class_name Spring


var target		:= Vector3.ZERO
var position	:= Vector3.ZERO
var velocity	:= Vector3.ZERO

var mass		:= 3.0
var force		:= 50.0
var damping		:= 3.0
var speed		:= 10.0
var ITERATIONS	:= 8.0



func _init(_mass: float = mass,     _force: float = force,    _damping: float = damping,    _speed: float = speed)   -> void: #to create it like Spring.new( args... )
	self.mass = _mass
	self.force = _force
	self.damping = _damping
	self.speed = _speed


func shove(force: Vector3) -> void:
	var x: float = force.x
	var y: float = force.y
	var z: float = force.z
	
	if x != x or x == INF or x == -INF:
		x = 0
	if y != y or y == INF or y == -INF:
		y = 0
	if z != z or z == INF or z == -INF:
		z = 0
	
	velocity += Vector3(x, y, z)

func update(dt: float) -> Vector3:
	var scaled_dt: float = min(dt, 1) * speed / ITERATIONS
	
	for i in ITERATIONS:
		var acceleration = ((target - position) * force) / mass
		
		acceleration -= velocity * damping
		
		velocity += acceleration * scaled_dt
		position += velocity * scaled_dt
	
	return position
