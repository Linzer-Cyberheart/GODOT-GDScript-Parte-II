extends Area2D


func _on_Sword_PickUP_body_entered(body):
	if body == Global.Player:
		Global.sword = true
		Global.Player.collect_sword()
		queue_free()
