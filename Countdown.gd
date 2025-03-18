extends Control
var count=6

@onready var GameMain = $"../.."
	
func _on_timer_timeout():	
	if get_tree().paused==false:
		count-=1
		if count == -5:
			$"../../StartWalls".queue_free()
			$"../../StartWalls2".queue_free()
		#print(is_instance_valid($Counter)) 
		if is_instance_valid($Counter):
			$Counter.set_text(str(count))
			if  count == 0 :
				$Counter.set_text("GO")					
				GameMain.score = 0
				%Score.set_visible(true)
			elif count < 0:		
				$Counter.queue_free()

func _process(delta):
	var framePerSecond= Engine.get_frames_per_second()
	%FpsCounter.set_text(str(framePerSecond))
