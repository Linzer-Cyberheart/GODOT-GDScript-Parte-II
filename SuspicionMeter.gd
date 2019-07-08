extends TextureProgress

var suspicion = 0

export var suspicion_step = 1 #How much it get's high when being seen
export var suspicion_dropoff = 0.25 #How much it decreases

func _process(delta):
	suspicion -= suspicion_dropoff
	suspicion = clamp(suspicion, 0, max_value)
	value = suspicion
	

func player_seen():
	suspicion += suspicion_step
	if suspicion == max_value:
		end_game()

func end_game():
	get_tree().change_scene("res://Scenes/GameOver_SCREEN.tscn")
	