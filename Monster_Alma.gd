extends Node2D

var active = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$AnimationPlayer.play("Run")
		active = true
