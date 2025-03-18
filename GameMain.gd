extends Node2D

var defaultLocation= Vector2(1600, 0)
@export var distanceBetweenDefaults= Vector2(0,470)
var extraTimerForCalculations= 0
var directionOfDefaultCurrent= "up"	
var defaultDirection= ["up","down","still"]
var score= 0
var currentDifficulty= 0
var isGameOver = false
var scoreprinteD = false
var jumpImpulseDifficulty = 0
@onready var pauseMenu= $CanvasLayer/PauseMenu
var paused= false

func spawn_background():
	var new_backgrounds= preload("res://backgrounds.tscn").instantiate()
	var new_backgrounds2= preload("res://backgrounds.tscn").instantiate()
	var new_backgrounds3= preload("res://backgrounds.tscn").instantiate()
	new_backgrounds.global_position = defaultLocation +Vector2(350,350)
	new_backgrounds2.global_position = defaultLocation +Vector2(350,350) +Vector2(0,500)
	new_backgrounds3.global_position = defaultLocation +Vector2(350,350) +Vector2(0,-500)
	
	add_child(new_backgrounds)
	add_child(new_backgrounds2)
	add_child(new_backgrounds3)
	
	
func spawn_defaults():
	#Preload the defaults	
	var new_defaultCeil=   preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultCeil2=  preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultCeil3=  preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultFloor=  preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultFloor2= preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultFloor3= preload("res://default_hit_circle.tscn").instantiate()
	var randomVectorForDefaultgaps= Vector2(randi_range(0,60) ,randi_range(0,30))
		
	#Choose Spawn Location for defaults < gap between ceil and floor diffuculty		
	new_defaultCeil.global_position = defaultLocation + randomVectorForDefaultgaps
	new_defaultCeil2.global_position = defaultLocation + Vector2(0,110) + randomVectorForDefaultgaps
	new_defaultCeil3.global_position = defaultLocation + Vector2(randi_range(0,40),randi_range(220,240))
	
	new_defaultFloor.global_position = defaultLocation + distanceBetweenDefaults 
	new_defaultFloor2.global_position = defaultLocation + distanceBetweenDefaults + Vector2(0,110)
	new_defaultFloor3.global_position = defaultLocation + distanceBetweenDefaults + Vector2(0,220)	
	
	add_child(new_defaultCeil)	
	add_child(new_defaultCeil2)	
	add_child(new_defaultCeil3)
	
	add_child(new_defaultFloor)	
	add_child(new_defaultFloor2)	
	add_child(new_defaultFloor3)	
	
func _ready():		
	#spawn_defaults()	
	spawn_background()
	
	
	
func _physics_process(delta):
	## Shift Key to Quick Restart
	#print(currentDifficulty)
	#print(paused)	
		
	if Input.is_action_pressed("restart") && get_tree().paused==false:
		get_tree().paused = false
		get_tree().reload_current_scene()
		
	if Input.is_action_just_released("pause"):
		pause_menu()
		
		
	## SCORE CALCULATIONS <<<<< improve?
	if !isGameOver && !paused :
		#print(str(delta*currentDifficulty*20) +"<difficulty > "+str(delta*1000)) 
		
		score += int(delta*1000) + int(delta*currentDifficulty*10)
	elif isGameOver && !scoreprinteD:		
		score ="SCORE IS >"+ str(score)  + "\ngame Over" + "\n\nPress Shift To Restart"
		
		scoreprinteD= true
	


func _on_spawn_timer_timeout():	
	
	#print(distanceBetweenDefaults)   # check for distance 
	#print(directionOfDefaultCurrent) # check for direction
	extraTimerForCalculations +=1
	## DefaultGaps
	
	if extraTimerForCalculations %3 ==0 && get_tree().paused==false:
		distanceBetweenDefaults += Vector2(0,randi_range(-22,20)) 
	## Limitation to Default gap	
		
	if distanceBetweenDefaults.y < 420 :
		distanceBetweenDefaults.y = 420
	elif distanceBetweenDefaults.y > 550:      # OLD DEFAULT FUNCTION USES min 440 max 600
		distanceBetweenDefaults.y = 550
	
	
	## Default Direction
	if extraTimerForCalculations %5 == 0:
		directionOfDefaultCurrent = defaultDirection[randi_range(0,defaultDirection.size()-1)]	
	if directionOfDefaultCurrent == "still":
		defaultDirection = defaultDirection
	elif directionOfDefaultCurrent == "down" &&get_tree().paused==false:
		defaultLocation += Vector2(0,randi_range(20,70))
	elif directionOfDefaultCurrent == "up" &&get_tree().paused==false :
		defaultLocation -= Vector2(0,randi_range(20,70))	
			
	if get_tree().paused==false:
		spawn_defaults_test()
		
	
	## Background Timer < add custom var if needed currently 20 is fine
	
	if extraTimerForCalculations %16 == 0:				 
		spawn_background()
		
	
	
func spawn_defaults_test():
	#Preload the defaults	
	var new_defaultCeil=   preload("res://default_hit_circle.tscn").instantiate()
	var new_defaultFloor=  preload("res://default_hit_circle.tscn").instantiate()
	
	var randomVectorForDefaultgaps= Vector2(randi_range(0,30) ,randi_range(0,30))
		
	new_defaultCeil.global_position = defaultLocation + randomVectorForDefaultgaps	
	new_defaultFloor.global_position = defaultLocation + distanceBetweenDefaults 		
	#add_child(new_defaultCeil)		
	#add_child(new_defaultFloor)	
	var testListFloor = []
	var testListCeil = []
	for i in range(5):
		testListFloor.append(preload("res://default_hit_circle.tscn").instantiate())  
		testListFloor[i-1].global_position = Vector2(-20,300) + defaultLocation + randomVectorForDefaultgaps +distanceBetweenDefaults + Vector2(0,i*30)  
		add_child(testListFloor[i-1])
		
		testListCeil.append(preload("res://default_hit_circle.tscn").instantiate())  
		testListCeil[i-1].global_position = Vector2(-20,300) + defaultLocation + randomVectorForDefaultgaps - Vector2(0,i*30)  
		add_child(testListCeil[i-1]) 
		
		

func pause_menu():
	if paused && !isGameOver :
		pauseMenu.hide()
		get_tree().paused = false
		paused = false
	
	elif paused && isGameOver:
		pauseMenu.hide()	
		paused=false
	
	else:
		pauseMenu.show()
		get_tree().paused = true
		paused = true
	
	
	
	
