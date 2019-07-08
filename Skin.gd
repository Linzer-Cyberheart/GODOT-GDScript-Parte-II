extends Area2D



func _on_Skin_body_entered(body):
	Global.skin = true
	Global.Player.collect_skin()
	queue_free()
