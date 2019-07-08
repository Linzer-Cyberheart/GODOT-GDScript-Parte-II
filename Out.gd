extends Node2D

var x = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$Camera2D2.zoom = Vector2(1,1)
		x = true


func _on_Area2D_body_exited(body):
	if body == Global.Player and x == true:
		$Camera2D2.zoom = Vector2(0.7,0.7)
		x = false
