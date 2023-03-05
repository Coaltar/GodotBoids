extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const min_speed = 0;
const max_speed = 50;
const turn_rate = 30;

const min_distance = 10;

var speed = 100


func _process(delta):
	var dir = Vector2(cos(self.rotation), sin(self.rotation))
	
	self.position += delta * speed * dir
	self.rotate(delta)
