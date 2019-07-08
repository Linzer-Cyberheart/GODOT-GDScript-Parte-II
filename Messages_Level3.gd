extends Node2D


var text
var x = 0

func _ready(Cont):
	if Cont:
		$Timer.start()
		text = get_json()
		update_message(x)
		$ContactLevel3/Popup.show()
	else:
		pass


func get_json():
	var file = File.new()
	file.open(Global.ContactLevel3, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)
	

func update_message(number):
	$ContactLevel3/AnimationPlayer.play("Transition")
	$ContactLevel3/Sound_SFX.play()
	$ContactLevel3/Popup/NinePatchRect/Label.text = text[str(number)]

func taken(Arch):
	if Arch == true:
		update_message(5)
	if Arch == false:
		update_message(6)
	
func _on_Timer_timeout():
	if x <= 3:
		x = x + 1
		update_message(x)
	elif x == 3:
		pass
