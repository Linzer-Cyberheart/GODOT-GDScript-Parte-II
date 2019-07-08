extends CanvasLayer

var c = false

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()

func _on_Rifle_body_entered(body):
	if body == Global.Player and c == false:
		$Popup.show()
		$Sound_SFX.play()
		$AnimationPlayer.play("Default")
		c = true
