extends Node2D


func _on_Area2D_body_entered(body):
	if body == Global.Player:
		$CanvasModulate.Color("1e000000")


func _on_Area2D_body_exited(body):
	if body == Global.Player:
		pass
