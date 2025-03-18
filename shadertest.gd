extends RigidBody2D

func _physics_process(delta):
	apply_force(Vector2(-1000,randi_range(-4000,2000)))
	if %trail.noiseAmount < 0.0:		
		queue_free()
	else:
		pass
