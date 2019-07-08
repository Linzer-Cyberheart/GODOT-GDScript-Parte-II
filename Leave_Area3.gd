extends CanvasLayer

func _ready():
	$Popup.hide()

func taken(Arch):
	if Arch == true:
		$Popup.show()
		$AnimationPlayer.play("Default")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
