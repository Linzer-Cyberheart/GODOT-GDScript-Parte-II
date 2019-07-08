extends Node2D

var active = false

func _ready():
	Global.Paxton == self

func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$AnimationPlayer.play("Lead")
		active = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()