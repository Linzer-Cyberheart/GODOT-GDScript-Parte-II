extends Node2D

var x = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$Area2D/Paxton_SFX1.play()
		x = true


func _on_Paxton_SFX1_finished():
	queue_free()
