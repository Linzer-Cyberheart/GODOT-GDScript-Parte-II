extends CanvasLayer


func _ready():
	if Global.Zerado == true:
		$NinePatchRect2.texture = load("res://GFX/Interface/PNG/bardanger.png")
		$Eyes1.show()
		$Eyes2.show()
	$Timer.start()

func _on_Timer_timeout():
	loadscreen()

func loadscreen():
	if Global.Zerado == true:
		$NinePatchRect2.texture = load("res://GFX/Interface/PNG/bardanger.png")
		$Eyes1.show()
		$Eyes2.show()
			
		
####################################GAME STAGES###############################################

	if Global.gameover == true:
		get_tree().change_scene("res://Scenes/Levels/SplashScreen.tscn")
		Global.gameover = false


	elif Global.tuto == true:
		get_tree().change_scene("res://Scenes/Levels/Tutorial.tscn")
		Global.tuto = false


	elif Global.intro == true:
		get_tree().change_scene("res://Scenes/CHAPTER ONE.tscn")
		Global.intro = false


	elif Global.level1 == true:
		get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
		Global.level1 = false

		
	elif Global.prologo == true:
		get_tree().change_scene("res://Scenes/Goodbye.tscn")
		Global.prologo = false


	elif Global.level2 == true:
		get_tree().change_scene("res://Scenes/Levels/Level2.tscn")
		Global.level2 = false


	elif Global.level3 == true:
		get_tree().change_scene("res://Scenes/CHAPTER TWO.tscn")
		Global.level3 = false
		
	elif Global.epilogo == true:
		get_tree().change_scene("res://Scenes/CHAPTER THREE.tscn")
		Global.epilogo = false
	
	elif Global.final == true:
		get_tree().change_scene("res://Scenes/Final.tscn")
		Global.final = false
		
	elif Global.Zerado == true:
		get_tree().change_scene("res://Scenes/SplashScreen2.tscn")
		

###########################################################################################