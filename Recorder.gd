extends Area2D



func _on_Recorder_body_entered(body):
	Global.Player.collect_recorder()
	queue_free()
