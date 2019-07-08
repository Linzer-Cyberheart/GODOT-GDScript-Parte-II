extends Area2D


func _on_Knife_body_entered(body):
	Global.Player.collect_knife()
	queue_free()
