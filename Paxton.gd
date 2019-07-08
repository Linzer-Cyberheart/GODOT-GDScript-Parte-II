extends Node2D

var x = false

func _ready():
	get_node(".").hide()
	$Sprite/StaticBody2D/CollisionShape2D.disabled = true

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$Timer.start()
		$Sprite/StaticBody2D/CollisionShape2D.disabled = false
		get_node(".").show()
		x = true


func _on_Timer_timeout():
	queue_free()
