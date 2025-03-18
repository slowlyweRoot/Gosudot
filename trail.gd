extends Sprite2D

var noiseAmount = material.get_shader_parameter("amount")
var noiseTexture = material.get_shader_parameter("noise_texture")

func _physics_process(delta):
	noiseAmount -= delta
	material.set_shader_parameter("amount",noiseAmount) 	
	scale += Vector2(delta*2,delta*2)
	#noiseTexture.noise.seed += 1 
	
