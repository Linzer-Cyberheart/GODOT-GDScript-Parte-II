extends Node2D


func _on_Area2D_body_entered(body):
		Global.Player.collect_motocicle()
		queue_free()
