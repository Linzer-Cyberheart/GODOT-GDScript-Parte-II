extends Area2D



func _on_Lantern_body_entered(body):
	Global.Player.collect_lantern()
	queue_free()
