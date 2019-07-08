extends Node2D

var active = false
var damage = 35

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$AnimationPlayer.play("run")
		if body.has_method("take_damage"):
			body.take_damage(damage)
		active = true
		
		
func _on_DamageArea_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

	

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


