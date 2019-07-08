extends CanvasLayer

var a = false

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Moto_Area_body_entered(body):
	if body == Global.Player and a == false:
		$Popup.show()
		$Sound_SFX.play()
		$AnimationPlayer.play("Default")
		a = true
