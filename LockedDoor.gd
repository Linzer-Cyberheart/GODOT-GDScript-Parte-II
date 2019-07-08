extends "res://Scripts/Door.gd"


var combination
export var lock_group = ""

func _input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/NumberPad.popup_centered()


func _on_Door_body_exited(body):
	if body == Global.Player:
		can_click = false
		$CanvasLayer/NumberPad.hide()
		$CanvasLayer/NumberPad.reset_lock()


func _on_NumberPad_combination_correct():
	open()


func _on_Computer_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(0, combination)
	get_tree().call_group("interface", "sendcode", combination)
	

func _on_Computer2_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(1, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_Computer3_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(2, combination)
	get_tree().call_group("interface", "sendcode", combination)

func _on_Computer4_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(3, combination)
	get_tree().call_group("interface", "sendcode", combination)

func _on_Computer5_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(4, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_Computer6_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(5, combination)
	get_tree().call_group("interface", "sendcode", combination)
	

func _on_ExitDectection_body_entered(body):
	open()

func _on_HousePC1_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(6, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_HousePC2_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(7, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_HousePC3_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(8, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_TutoPC1_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(9, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_TutoPC2_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(10, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_OfficePC2_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(11, combination)
	get_tree().call_group("interface", "sendcode", combination)


func _on_OfficePC1_combination(numbers, lock_group):
	combination = numbers
	$CanvasLayer/NumberPad.combination = combination
#	$Label.text = lock_group
	Global.combi.insert(12, combination)
	get_tree().call_group("interface", "sendcode", combination)
