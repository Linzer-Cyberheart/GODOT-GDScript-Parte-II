extends CanvasLayer

func _ready():
	$Popup.hide()


func _on_Sword_PickUP_body_entered(body):
	$Popup.show()
	$AnimationPlayer.play("Default")


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()