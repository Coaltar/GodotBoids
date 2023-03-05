extends Node2D

var boid_scene = preload("res://Boid.tscn")

const MAP_DIM = 500
const MAX_BOIDS = 25


const min_proximity = 100

const vision_distance = 500
const vision_radius = PI/3

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
		
		var x = MAP_DIM/2 + randi() % + MAP_DIM
		var y = MAP_DIM/2 + randi() % + MAP_DIM
		var spawn = Vector2(x,y)
		
		var x_dir = -1 + 2*randf() 
		var y_dir = -1 + 2*randf() 
		var bearing = Vector2(x_dir, y_dir).normalized()
		
		var boid = boid_scene.instance()
		
		boid.bearing = bearing
		boid.position = spawn
		add_child(boid)
		boids[i]= boid
	pass
	
func _process(delta):
	
	for boid in boids:
		var neighbors = get_boid_neighbors(boid)
		
		if(len(neighbors) > 0):
			
			var positions = []
			var bearings = []
			#var velocities = []
			
			var nearest_distance = self.position.distance_to(neighbors[0].position)
			var nearest_boid = neighbors[0]
			
			for n in neighbors:
				positions.append(n.position)
				bearings.append(n.bearing)
				#velocities.append(n.velocity * n.bearing)
				
				var dist = boid.position.distance_to(n.position)
				if(dist < nearest_distance):
					nearest_distance = dist
					nearest_boid = n
			
			
			var desired_pos = avg_vec2(positions)
			if(nearest_distance < min_proximity):
				desired_pos = (boid.position - nearest_boid.position).normalized() * (min_proximity - nearest_distance)

			
			var desired_bearing = avg_vec2(bearings)
			var offset_bearing = (desired_pos - boid.position).normalized()
			desired_bearing = avg_vec2([desired_bearing, offset_bearing]).normalized()
			
			var angle_delta = boid.bearing.angle_to(desired_bearing)
			#var accel_val = -1 + 2*abs(angle_delta) / PI
			#var avg_vel = avg_vec2(velocities)
			
			
			boid.rotate_towards(delta, desired_bearing)
			
			
			#boid.adjust_speed(accel_val)
			#var target_vel = 
			#var target_rot = 
			
			
			#if(has_neighbors):
		
			
			#calculate average position, bearing, and velocity 
			#target that position
			#then shift away from nearest neighbor
		else:
			pass
			
			
		

	
	pass

func get_boid_neighbors(boid):
	var nearby = []
	var heading = boid.bearing
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
	

func avg_vec2(vecs):
	var x = 0
	var y = 0
	var n = 0
	for vec in vecs:
		x += vec.x
		y += vec.y
		n += 1
	
	return Vector2(x/n, y/n)
		
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
