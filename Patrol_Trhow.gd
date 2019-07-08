extends Node2D

var damage = 50
var x = false

func _on_Car(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)

func _on_DetectArea_body_entered(body):
	if body == Global.Player and x == false:
		$AnimationPlayer.play("Rush")
		x = true


func _on_AnimationPlayer_animation_finished(anim_name):
	$Patrol_Car5/Alma_Child.hide()
