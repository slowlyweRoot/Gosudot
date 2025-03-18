extends Control
@onready var GameMain = $"../../"
var currentPressedKey 
var button2Pressed=false
var button1Pressed=false

var defaultDifficulty=2.5
var difficultySlider= 0

func _physics_process(delta):
	#print(difficultySlider)
	if  -30  < difficultySlider && difficultySlider < 0:
		%slidertext.set_text("easy")
	elif difficultySlider <= -30:
		%slidertext.set_text("very easy")
	elif 80  > difficultySlider && difficultySlider >50:
		%slidertext.set_text("hard")
	elif 110 > difficultySlider && difficultySlider >= 80:
		%slidertext.set_text("very hard")
	elif 130 > difficultySlider && difficultySlider >= 110:	
		%slidertext.set_text("HARDEST")
	elif difficultySlider >= 130:	
		%slidertext.set_text("HARDESTEST")		
	else:
		%slidertext.set_text("normal")
	
	#if button2Pressed  :		
		#if currentPressedKey is InputEventKey && str(currentPressedKey.as_text()) != "Escape":
			#InputMap.action_erase_events("xjump")	
			#InputMap.action_add_event("xjump" , currentPressedKey)
			#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button2".set_text(str(currentPressedKey.as_text()))
	#if button1Pressed  :		
		#if currentPressedKey is InputEventKey && str(currentPressedKey.as_text()) != "Escape":
			#InputMap.action_erase_events("zjump")	
			#InputMap.action_add_event("zjump" , currentPressedKey)
			#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button1".set_text(str(currentPressedKey.as_text()))
			#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button1".set("button_pressed", false)
			#button1Pressed=false

func _on_resume_pressed():
	GameMain.pause_menu()

func _on_restart_pressed():
	GameMain.paused = false
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_exit_pressed():
	get_tree().quit()	

func _on_h_slider_drag_ended(value_changed):
	#GameMain.currentDifficulty = defaultDifficulty+ defaultDifficulty*(difficultySlider/100) 
	GameMain.currentDifficulty=difficultySlider

func _on_h_slider_value_changed(value):
	difficultySlider = value


#func _on_button_2_toggled(toggled_on):			
			#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button2".set_text("Press any key")
			#if currentPressedKey is InputEventKey:
				#InputMap.action_erase_events("xjump")	
				#InputMap.action_add_event("xjump" , currentPressedKey)
				#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button2".set_text(str(currentPressedKey.as_text()))
		
#func _unhandled_key_input(event):
	#if event.is_pressed():
		#currentPressedKey = event
		#print(event.as_text())
		#
#func _on_button_2_pressed():	
	#
	#button2Pressed=!button2Pressed
	#if button2Pressed:
		#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button2".set_text("Press any key")
#
#func _on_button_1_pressed():	
	#button1Pressed=true
	#$"TabContainer/Game Settings/VBoxContainer/KeyMap/Button1".set_text("Press any key")


func _on_check_button_toggled(toggled_on):	
	if !GameMain.get_node("NightMode").visible:
		GameMain.get_node("NightMode").visible = true
		GameMain.get_node("cursorLayer/cursorCircle/NightLight").visible = true
	else:
		GameMain.get_node("NightMode").visible = false
		GameMain.get_node("cursorLayer/cursorCircle/NightLight").visible = false
