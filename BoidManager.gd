extends Node2D

var boid_scene = preload("res://Boid.tscn")

const MAP_DIM = 100
const MAX_BOIDS = 25


const min_proximity = 15

const vision_distance = 1000
const vision_radius = PI/3

const RULE1_FACTOR = 0.01;
const RULE2_FACTOR = 2;
const RULE3_FACTOR = 0.125;

var boids = []

func _ready():
	randomize()
	spawn_boids()
	pass # Replace with function body.

func instantiate():
	pass


func spawn_boids():
	boids.resize(MAX_BOIDS)
	for i in range(MAX_BOIDS):
		
		var x = 200 + randi() % + MAP_DIM
		var y = 200 + randi() % + MAP_DIM
		var spawn = Vector2(x,y)
		
		var x_dir = -1 + 2*randf() 
		var y_dir = -1 + 2*randf() 
		var bearing = Vector2(x_dir, y_dir).normalized()
		
		var boid = boid_scene.instance()
		
		boid.position = spawn
		add_child(boid)
		boids[i]= boid
	pass
	
func _process(delta):
	
	for boid in boids:
		var neighbors = get_boid_neighbors(boid)
		
		var neighbor_adjustments = Vector2.ZERO
		
		if(len(neighbors) > 0):
			
			var res_rule1 = rule1(boid, neighbors)
			var res_rule2 = rule2(boid, neighbors)
			var res_rule3 = rule3(boid, neighbors)
			
			
			neighbor_adjustments = res_rule1 + res_rule2 + res_rule3
			
			
			
			pass
		else:
			pass
			
		var adj_bpunds = boundary_rule(boid)
		var ideal_vel = boid.velocity + neighbor_adjustments + adj_bpunds
		boid.update_velocity(ideal_vel, delta)
	pass

func get_boid_neighbors(boid):
	var nearby = []
	var heading = boid.velocity.normalized()
	for other in boids:
		if(other == boid):
			continue
		var offset = Vector2(other.position.x - boid.position.x, other.position.y - boid.position.y)
		var dist = boid.position.distance_to(other.position)
		var rot = heading.angle_to(offset)
		
		if(abs(dist) > vision_distance):
			continue
		if(abs(rot) > vision_radius):
			continue
		nearby.append(other)
	return nearby
	

func rule1(boid, neighbors):
	
	var total_pos = Vector2.ZERO
	
	for n in neighbors:
		total_pos += n.position
	total_pos = total_pos / (len(neighbors))
	
	var offset = total_pos - boid.position
	return offset * RULE1_FACTOR
	

func rule2(boid, neighbors):
	
	var pos = Vector2.ZERO
	
	for n in neighbors:
		var offset = boid.position - n.position
		if(offset.length() < min_proximity):
			pos += offset
	
	return pos * RULE2_FACTOR


func rule3(boid, neighbors):

	var vel = Vector2.ZERO
	
	for n in neighbors:
		vel += n.velocity
	vel = vel/len(neighbors)
	
	return vel * RULE3_FACTOR
	

	
func boundary_rule(boid):
	var XMIN = 100
	var XMAX = 800;
	var YMIN = 100;
	var YMAX = 800;
	
	var spd_adj = 10
	var adj = Vector2.ZERO
	
	
	if(boid.position.x < XMIN ):
		adj.x += spd_adj
	if(boid.position.x > XMAX ):
		adj.x -= spd_adj
	if(boid.position.y < YMIN ):
		adj.y += spd_adj
	if(boid.position.y > YMAX ):
		adj.y -= spd_adj
		
	return adj
	
	
