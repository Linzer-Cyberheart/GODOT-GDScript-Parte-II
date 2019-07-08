extends Node2D


func _on_Start_body_entered(body):
	if body == Global.Player and Global.music_on == false:
		$Power_Armor.play()
		Global.music_on = true




func _on_Stop_body_entered(body):
	if body == Global.Player and Global.music_on == true:
		$Power_Armor.stop()
		Global.music_on = false