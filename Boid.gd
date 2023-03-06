extends Node2D


const min_speed = 1;
const max_speed = 5;
const TURN_RATE = 0.5
const ACCEL_RATE = 0.05;


var velocity = Vector2(randf(), randf())
var prev_vel = Vector2.ZERO

func _process(_delta):
	
	rotate_towards_velocity()
	
	self.position += self.velocity
	
	pass

func rotate_towards_velocity():
	self.rotation = self.velocity.normalized().angle()
	pass

func update_velocity(velocity, weight):
	
	var direction = self.velocity.normalized().slerp(velocity.normalized(), TURN_RATE)
	var magnitude = lerp(self.velocity.length(), velocity.length(), ACCEL_RATE)
	magnitude = clamp(magnitude, min_speed, max_speed)
	self.velocity = direction * magnitude
	
	#self.prev_vel = self.velocity
	#self.velocity = self.velocity.slerp(velocity, 1)
	
	
	#var clamped_vel = velocity.normalized() * clamp(velocity.length(), min_speed, max_speed)
	#var clamped_mag =  clamp(velocity.length(), min_speed, max_speed)
	#var current_mag = self.velocity.length()
	
	
	
	
