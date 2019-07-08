extends Node2D

var x = false
var damage = 15

func _on_MD7_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_MD5_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_MD3_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)


func _on_DetectArea_body_entered(body):
	if body == Global.Player and x == false:
		$AnimationPlayer.play("Throw")
		x = true
