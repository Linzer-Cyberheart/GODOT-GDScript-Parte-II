extends CanvasLayer

func _ready():
	$AnimationPlayer.play("MainMenu2")

func _on_Start_Game_pressed():
	Global.intro = true
	get_tree().change_scene("res://Scenes/Loadscreen.tscn")


func _on_Start_Tutorial_pressed():
	Global.tuto = true
	get_tree().change_scene("res://Scenes/Loadscreen.tscn")

func _on_Quit_pressed():
	get_tree().quit()
	
func change_bg(x):
	if x == true or Global.Zerado == true:
		$CenterContainer/NinePatchRect2.texture = null
		$CenterContainer/NinePatchRect4.texture = load("res://GFX/Interface/PNG/Main2.png")