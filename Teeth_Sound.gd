extends Node2D

var active = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$Teeth_SFX.play()
		active = true


func _on_Teeth_SFX_finished():
	queue_free()
