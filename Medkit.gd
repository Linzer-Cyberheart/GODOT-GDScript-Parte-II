extends Area2D



func _on_Medkit_body_entered(body):
	if Global.Player.health < Global.Player.max_health:
		Global.Player.collect_medkit()
		queue_free()
	else:
		pass
