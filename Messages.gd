extends Node2D

var text

func _ready():
	$Contact_MessageGUI/Popup.hide()
	text = get_json()


func get_json():
	var file = File.new()
	file.open(Global.contact_messages, file.READ)
	var content = file.get_as_text()
	file.close()
	return parse_json(content)


func show_message(number):
	$Timer.start()
	$Contact_MessageGUI/Popup.show()
	$Contact_MessageGUI/AnimationPlayer.play("Transition")
	$Contact_MessageGUI/Sound_SFX.play()
	$Contact_MessageGUI/Popup/NinePatchRect/Label.text = text[str(number)]
	
#---------------------------------------------MESSAGES-------------------------------------------------------

var m0 = false
func _on_Message0_body_entered(body):
	if body == Global.Player and m0 == false:
		show_message(0)
		m0 = true



var m1 = false
func _on_Message1_body_entered(body):
	if body == Global.Player and m1 == false:
		show_message(1)
		m1 = true



var m2 = false
func _on_Message2_body_entered(body):
	if body == Global.Player and m2 == false:
		show_message(2)
		m2 = true



var m3 = false
func _on_Message3_body_entered(body):
	if body == Global.Player and m3 == false:
		show_message(3)
		m3 = true



var m4 = false
func _on_Message4_body_entered(body):
	if body == Global.Player and m4 == false:
		show_message(4)
		m4 = true



var m5 = false
func _on_Message5_body_entered(body):
	if body == Global.Player and m5 == false:
		show_message(5)
		m5 = true



var m6 = false
func _on_Message6_body_entered(body):
	if body == Global.Player and m6 == false:
		show_message(6)
		m6 = true



var m7 = false
func _on_Message7_body_entered(body):
	if body == Global.Player and m7 == false:
		show_message(7)
		m7 = true



var m8 = false
func _on_Message8_body_entered(body):
	if body == Global.Player and m8 == false:
		show_message(8)
		m8 = true



var m9 = false
func _on_Message9_body_entered(body):
	if body == Global.Player and m9 == false:
		show_message(9)
		m9 = true



var m10 = false
func _on_Message10_body_entered(body):
	if body == Global.Player and m10 == false:
		show_message(10)
		m10 = true



var m11 = false
func _on_Message11_body_entered(body):
	if body == Global.Player and m11 == false:
		show_message(11)
		m11 = true



var m12 = false
func _on_Message12_body_entered(body):
	if body == Global.Player and m12 == false:
		show_message(12)
		m12 = true



var m13 = false
func _on_Message13_body_entered(body):
	if body == Global.Player and m13 == false:
		show_message(13)
		m13 = true



var m14 = false
func _on_Message14_body_entered(body):
	if body == Global.Player and m14 == false:
		show_message(14)
		m14 = true



var m15 = false
func _on_Message15_body_entered(body):
	if body == Global.Player and m15 == false:
		show_message(15)
		m15 = true



var m16 = false
func _on_Message16_body_entered(body):
	if body == Global.Player and m16 == false:
		show_message(16)
		m16 = true



var m17 = false
func _on_Message17_body_entered(body):
	if body == Global.Player and m17 == false:
		show_message(17)
		$Music.stop()
		m17 = true




var m18 = false
func _on_Message18_body_entered(body):
	if body == Global.Player and m18 == false:
		show_message(18)
		m18 = true



var m19 = false
func _on_Message19_body_entered(body):
	if body == Global.Player and m19 == false:
		show_message(19)
		m19= true



var m20 = false
func _on_Message20_body_entered(body):
	if body == Global.Player and m20 == false:
		show_message(20)
		m20= true

var m21 = false
func _on_Message21_body_entered(body):
	if body == Global.Player and m21 == false:
		show_message(21)
		m21= true

var m22= false
func _on_Message22_body_entered(body):
	if body == Global.Player and m22 == false:
		show_message(22)
		m22= true

var m23 = false
func _on_Message23_body_entered(body):
	if body == Global.Player and m23 == false:
		show_message(23)
		m23= true



var active = false
func _on_MusicAreaStart_body_entered(body):
	if body == Global.Player and active == false:
		$Music.play()
		active = true



func _on_Timer_timeout():
	$Contact_MessageGUI/Popup.hide()


	
