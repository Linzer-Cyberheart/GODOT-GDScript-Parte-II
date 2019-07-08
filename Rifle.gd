extends Area2D

func _on_Rifle_body_entered(body):
	if body == Global.Player:
		Global.rifle = true
		Global.Player.collect_rifle()
		queue_free()