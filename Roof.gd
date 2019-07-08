extends Node2D

	
func _on_Area2D_body_entered(body):
	if body == Global.Player:
		get_node(".").hide()

func _on_Area2D_body_exited(body):
	if body == Global.Player:
		get_node(".").show()
	