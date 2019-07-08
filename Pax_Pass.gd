extends Node2D

var x = false

func _ready():
	get_node(".").hide()

func _on_DetectArea_body_entered(body):
	if body == Global.Player and x == false:
		get_node(".").show()
		$AnimationPlayer.play("Mind")
		x = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
