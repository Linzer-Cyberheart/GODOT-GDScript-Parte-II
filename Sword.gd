extends Node2D

var damage = 150

func _on_Lamina_body_entered(body):
	if body != Global.Player:
		if body.has_method("take_damage"):
			$Lamina/Blood_SFX.play()
			body.take_damage(damage)

	if body == Global.bullet:
		$Parry/Parry_SFX.play()


func _on_Parry_body_entered(body):
	if body == Global.bullet:
		$Parry/Parry_SFX.play()


func _on_AnimationPlayer_animation_started(anim_name):
	$Sword_Art.show()
	$Sword_Guard.hide()
	
func _on_AnimationPlayer_animation_finished(anim_name):
	$Sword_Art.hide()
	$Sword_Guard.show()


