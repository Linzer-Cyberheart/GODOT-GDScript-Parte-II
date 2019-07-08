extends Node2D

func _on_Lantern_body_entered(body):
	$Lantern_PopUP/Popup.show()
	$Lantern_PopUP/AnimationPlayer.play("Default")