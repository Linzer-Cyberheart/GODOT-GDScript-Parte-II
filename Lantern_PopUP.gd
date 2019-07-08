extends CanvasLayer

var b = false

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Lantern_body_entered(body):
	if body == Global.Player and b == false:
		$Popup.show()
		$Sound_SFX.play()
		$AnimationPlayer.play("Default")
		b = true
