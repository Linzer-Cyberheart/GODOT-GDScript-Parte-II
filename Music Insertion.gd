extends Node2D


func _on_Start_body_entered(body):
	if body == Global.Player and Global.music_on == false:
		$Insertion.play()
		Global.music_on = true




func _on_Stop_body_entered(body):
	if body == Global.Player and Global.music_on == true:
		$Insertion.stop()
		Global.music_on = false
