extends Node2D

var can_click = false

#--------------Beep Area-----------
func _on_BeepArea_body_entered(body):
	if body == Global.Player:
		$Beep_SFX/Timer_Beep.start()

func _on_Timer_Beep_timeout():
		$Beep_SFX.play()

func _on_BeepArea_body_exited(body):
	if body == Global.Player:
		$Beep_SFX/Timer_Beep.stop()
#-----------------------------------

#-------------Click Area------------

func _input(event):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$Beep_SFX/Timer_Beep.stop()
		$Beep_SFX.stop()
		$Message_Start.play()


func _on_ClikcArea_body_entered(body):
	can_click = true


func _on_ClikcArea_body_exited(body):
	can_click = false
	
#-----------------------------------


func _on_Message_Start_finished():
	$Beep_SFX/Timer_Beep.stop()
	$Beep_SFX.stop()
	$Message.play()


func _on_Message_finished():
	$Beep_SFX/Timer_Beep.stop()
	$Beep_SFX.stop()
	$Message_End.play()


func _on_Message_End_finished():
	$Beep_SFX/Timer_Beep.start()
	$Beep_SFX.play()
	Global.Player.collect_message()
	Global.Phone5 = true
	Global.message = Global.message + 1
	get_tree().call_group("interface", "update_message", "Message")
