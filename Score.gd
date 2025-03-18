extends Label

@onready var GameMain = get_parent().get_parent()

	
func _process(delta):			
	var score = GameMain.score
	set_text(str(score))
	
	
	if GameMain.isGameOver:		
		$".".global_position = Vector2(300,200)
		set("theme_override_font_sizes/font_size", 100)
		set("theme_override_colors/font_color", Color(1,0,0))
