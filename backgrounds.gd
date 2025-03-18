extends StaticBody2D
@export var backgroundAlpha = 100.0/100.0
var backgroundsList =[preload("res://osuprojectsz/backgrounds/6 (11).jpg"), preload("res://osuprojectsz/backgrounds/a37c13327006f00eec9897155e4ff7a99cc170e0.jpg"), preload("res://osuprojectsz/backgrounds/aawe.jpg"), preload("res://osuprojectsz/backgrounds/AWOO7.jpg"), preload("res://osuprojectsz/backgrounds/background (28).jpg"), preload("res://osuprojectsz/backgrounds/BG (38).jpg"), preload("res://osuprojectsz/backgrounds/bg (630).jpg"), preload("res://osuprojectsz/backgrounds/BG (660).jpg"), preload("res://osuprojectsz/backgrounds/bg (746).jpg"), preload("res://osuprojectsz/backgrounds/bg (797).jpg"), preload("res://osuprojectsz/backgrounds/BG (831).jpg"), preload("res://osuprojectsz/backgrounds/bg (852).jpg"), preload("res://osuprojectsz/backgrounds/bg (880).jpg"), preload("res://osuprojectsz/backgrounds/bg_flash.jpg"), preload("res://osuprojectsz/backgrounds/BG_THE_ONE.jpg"), preload("res://osuprojectsz/backgrounds/glory daysss.jpg"), preload("res://osuprojectsz/backgrounds/kantoku lolis.jpg"), preload("res://osuprojectsz/backgrounds/kizunabg.jpg"), preload("res://osuprojectsz/backgrounds/miku e.jpg"), preload("res://osuprojectsz/backgrounds/new.jpg"), preload("res://osuprojectsz/backgrounds/old.jpg"), preload("res://osuprojectsz/backgrounds/orz54.jpg"), preload("res://osuprojectsz/backgrounds/sabre.jpg"), preload("res://osuprojectsz/backgrounds/SANTA BG.jpg"), preload("res://osuprojectsz/backgrounds/that bg fills me with some nostalgic thoughts.jpg"), preload("res://osuprojectsz/backgrounds/tri3.jpg"), preload("res://osuprojectsz/backgrounds/Void.jpg"), preload("res://osuprojectsz/backgrounds/wallpaperflare.com_wallpaper (2).jpg"), preload("res://osuprojectsz/backgrounds/wallpaperflare.com_wallpaper.jpg")]
var backgroundColor= Color(0.3,0.3,0.3,backgroundAlpha)

func _ready():
	%Sprite2D.texture = backgroundsList[randi_range(0,backgroundsList.size()-1)]
	%Sprite2D.scale.x = 1280.0/float(%Sprite2D.texture.get_width())
	%Sprite2D.scale.y = 720.0/float(%Sprite2D.texture.get_height())
	set_rotation_degrees(randf_range(-35,35))
	set_modulate(backgroundColor)

func _physics_process(delta):
	position.x -= 1
	
func _on_area_2d_area_entered(area):
	queue_free() 
	
