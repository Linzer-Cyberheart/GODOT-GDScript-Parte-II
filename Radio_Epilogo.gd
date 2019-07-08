extends Node2D

var x = false
var y = false
var z = false
var k = false


func _on_Voice1_body_entered(body):
	if body == Global.Player and x == false:
		$Voice1/Voice_SFX.play()
		x = true


func _on_Voice2_body_entered(body):
	if body == Global.Player and y == false:
		$Voice2/Voice_SFX.play()
		y = true


func _on_Voice3_body_entered(body):
	if body == Global.Player and z == false:
		$Voice3/Voice_SFX.play()
		z = true


func _on_Voice4_body_entered(body):
	if body == Global.Player and k == false:
		$Voice4/Voice_SFX.play()
		k = true
