extends Node2D

func _on_Area2D_body_entered(body):
	if body == Global.Player:
		$Area2D/Roof.load("res://Tilesets/Roof_Tile.tres")

func _on_Area2D_body_exited(body):
	if body == Global.Player:
		$Area2D/Roof.load("res://Tilesets/empty.tres")
