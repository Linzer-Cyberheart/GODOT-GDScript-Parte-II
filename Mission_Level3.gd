extends Node2D

var x = false
var y = false
var z = false
var Arch = false
var Cont = false


func _on_TakeFiles_body_entered(body):
	if body == Global.Player and x == false:
		if Global.recorder == 7 and Global.files == 8 and Global.suitcase == 5:
			y = true
			x = true
			Global.Archives = true
			Arch = Global.Archives
			$AnimationPlayer.play("Close")
			get_tree().call_group("interface", "taken", Arch)
		if Global.recorder != 7 and Global.files != 8 and Global.suitcase != 5:
			x = false
			y = false
			Global.Archives = false
			Arch = Global.Archives
			get_tree().call_group("interface", "taken", Arch)

func _on_DetectArea_body_entered(body):
	if body == Global.Player and z == false:
		Global.Contact3 = true
		Cont = Global.Contact3
		$AnimationPlayer.play("Open")
		z = true
		get_tree().call_group("interface", "_ready", "Cont")
	
