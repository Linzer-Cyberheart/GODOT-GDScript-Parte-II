extends CanvasLayer



func _on_Laseron_body_entered(body):
	$Popup.show()
	$AnimationPlayer.play("Default")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()