extends Node2D

var boid_scene = preload("res://Boid.tscn")

const MAP_DIM = 100
const MAX_BOIDS = 25


const neighbor_distance = 100
const vision_radius = 270

var boids = []

func _ready():
	spawn_boids()
	pass # Replace with function body.

func instantiate():
	pass


func spawn_boids():
	boids.resize(MAX_BOIDS)
	for i in range(MAX_BOIDS):
		
		var x = randi() % MAP_DIM
		var y = randi() % MAP_DIM
		var spawn = Vector2(x,y)
		
		var rotation = randf() * PI * 2
		
		var boid = boid_scene.instance()
		
		boid.rotate(rotation)
		boid.position = spawn
		add_child(boid)
		boids[i]= boid
	pass
	
func _process(delta):
	for boid in boids:
		yield (boid)
		#get neighbors
	pass

func get_boid_neighbors(boid):
	neigh = []
	for other in boids
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
