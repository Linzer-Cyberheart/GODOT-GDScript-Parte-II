extends Node2D

var x = false

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$AnimationPlayer.play("Follow")
		$Voice_SFX.play()
		x = true
