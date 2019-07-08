extends Area2D



func _on_SuitCase_body_entered(body):
	Global.Player.collect_suitcase()
	queue_free()