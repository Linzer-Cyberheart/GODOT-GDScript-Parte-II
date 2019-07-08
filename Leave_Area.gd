extends CanvasLayer

func _ready():
	$Popup.hide()

func taken(Arch):
	if Arch == true:
		$Popup.show()
		$AnimationPlayer.play("Default")
	else:
		pass