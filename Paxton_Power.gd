extends Node2D

var x = false

func _on_DetectArea_body_entered(body):
	if body == Global.Player and x == false:
		$AnimationPlayer.play("Within")
		x = true
