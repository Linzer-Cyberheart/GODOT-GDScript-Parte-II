extends Node2D

var entered = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and entered == false:
		$Military_SFX.play()
		$Off_SFX.stop()
		entered = true


func _on_MusicStop1_body_entered(body):
	if body == Global.Player and entered == true:
		$Military_SFX.stop()
		$Off_SFX.play()
		entered = false


func _on_MusicStop2_body_entered(body):
	if body == Global.Player and entered == true:
		$Military_SFX.stop()
		$Off_SFX.play()
		entered = false
