extends Node2D

var damage = 15

func _ready():
	$Timer.start()

func _on_Timer_timeout():
	$Timer.start()
	$AnimationPlayer.play("Karma")
	


func _on_Area2D_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
