extends Node2D

func _ready():
	Global.Horror_Secret = self

func _on_Area2D_body_entered(body):
	if body == Global.Player and not $Timer.start():
		$Timer.start()


func _on_Timer_timeout():
	queue_free()


func _on_Area2D_My_Self(body):
	if body == Global.Player and not $Sprite41/Area2D/AudioStreamPlayer2D.is_playing():
		$Sprite41/Area2D/AudioStreamPlayer2D.play()


func _on_AudioStreamPlayer2D_finished():
	$Sprite41.queue_free()
	queue_free()
