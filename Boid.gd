extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const min_speed = 0;
const max_speed = 50;
const turn_rate = 30;
const min_distance = 10;

var count = randi() % 1000
#var has_neighbors = false
#var neighbor_avg_position = Vector2.ZERO
#var neighbor_avg_bearing =  Vector2.ZERO
#var closest_neighbor

var velocity = 100
var bearing = Vector2.ZERO

func _process(delta):
	
	#self.count += delta
	#var newbearing = Vector2(cos(count), sin(count))
	#self.rotate_towards(delta, newbearing)
	
	
	# MOVE
	self.position += self.bearing*self.velocity*delta
	# Rotate
	self.rotation = self.bearing.angle()


func rotate_towards(delta, target):
	self.bearing = self.bearing.slerp(target.normalized(), delta)

#func adjust_speed(delta, target):
#	self.velocity = self.velocity.lerp(self.velocity, target, delta)

func adjust_speed(accel):
	self.velocity += accel;
