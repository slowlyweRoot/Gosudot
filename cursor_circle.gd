extends RigidBody2D

@export var jump_impulse = 0
@onready var GameMain = get_parent().get_parent()
var FORCE = Vector2(0,-jump_impulse)

func _ready():
	set_gravity_scale(0.0)

func _physics_process(delta):
	#print(str(jump_impulse) + "= jump impulse") 
	
	
	if Input.is_action_just_pressed("zjump"):        
		apply_force(FORCE)
		var new_trail = preload("res://shadertest.tscn").instantiate()
		new_trail.global_position = self.global_position
		add_child(new_trail)
	if Input.is_action_just_pressed("xjump"):    
		apply_force(FORCE)  
		var new_trail2 = preload("res://shadertest.tscn").instantiate()
		new_trail2.global_position = self.global_position
		add_child(new_trail2)
	

func _on_area_2d_area_entered(area):
	get_tree().paused = true	
	var endScore = GameMain.score
	GameMain.isGameOver= true
	GameMain.paused = true
	
	


func _on_timer_timeout():	
	jump_impulse = (GameMain.currentDifficulty * -5) + 1700
	FORCE = Vector2(0,-jump_impulse)
	set_gravity_scale(2.0)
	
	
