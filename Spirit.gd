extends Node2D

var x = false
var y = false

func _ready():
	get_node(".").hide()

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$Timer.start()
		$Ghost_POPUP/Popup.show()
		x = true


func _on_Timer_timeout():
	$Ghost_POPUP/Popup.hide()


func _on_DetectArea_body_entered(body):
	if body == Global.Player and y == false:
		$Timer2.start()
		$AnimationPlayer.play("Spirit")
		y = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()


func _on_Timer2_timeout():
	get_node(".").show()
