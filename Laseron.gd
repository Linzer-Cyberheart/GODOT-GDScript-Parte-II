extends Area2D

func _on_Laseron_body_entered(body):
	if body == Global.Player:
		Global.laseron = true
		Global.Player.collect_laseron()
		queue_free()