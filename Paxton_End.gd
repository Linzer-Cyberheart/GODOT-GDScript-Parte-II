extends Node2D

var x = false

func _ready():
	get_node(".").hide()

func _on_DetectArea_body_entered(body):
	if body == Global.Player and x == false:
		if Global.suitcase == 5 and Global.recorder == 7 and Global.files == 8:
			get_node(".").show()
			$AnimationPlayer.play("Pax")
			x = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
