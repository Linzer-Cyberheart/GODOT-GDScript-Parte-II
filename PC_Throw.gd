extends Node2D

var throw = false
var damage = 50

func _on_Room1Area_body_entered(body):
	if body == Global.Player and throw == false:
		$Room1.play("PC_Throw_Room1")
		throw = true

var voice = false

func _on_Room1Area_body_exited(body):
	if body == Global.Player and voice == false:
		$AlmaVoice.play()
		voice = true

var throw2 = false

func _on_Room2Area2_body_entered(body):
	if body == Global.Player and throw2 == false:
		$Room2.play("PC_Throw_Room2")
		throw2 = true

func _on_DamageArea_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)