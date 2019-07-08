extends Node2D

var m1 = false
var m2 = false
var m3 = false
var m4 = false
var m5 = false
var m6 = false
var m7 = false
var m8 = false
var m9 = false
var m10 = false

func _on_Music1_body_entered(body):
	if body == Global.Player and m1 == false:
		$Music_1.play()
		m1 = true


func _on_Music1_body_exited(body):
	if body == Global.Player and m1 == true:
		$Music_1.stop()
		m1 = false


func _on_Music2_body_entered(body):
	if body == Global.Player and m2 == false:
		$Music_2.play()
		m2 = true


func _on_Music2_body_exited(body):
	if body == Global.Player and m2 == true:
		$Music_2.stop()
		m2 = false


func _on_Music3_body_entered(body):
	if body == Global.Player and m3 == false:
		$Music_3.play()
		m3 = true


func _on_Music3_body_exited(body):
	if body == Global.Player and m3 == true:
		$Music_3.stop()
		m3 = false


func _on_Music4_body_entered(body):
	if body == Global.Player and m4 == false:
		$Music_4.play()
		m4 = true


func _on_Music4_body_exited(body):
	if body == Global.Player and m4 == true:
		$Music_4.stop()
		m4 = false


func _on_Music5_body_entered(body):
	if body == Global.Player and m5 == false:
		$Music_5.play()
		m5 = true


func _on_Music5_body_exited(body):
	if body == Global.Player and m5 == true:
		$Music_5.stop()
		m5 = false


func _on_Music6_body_entered(body):
	if body == Global.Player and m6 == false:
		$Music_6.play()
		m6 = true


func _on_Music6_body_exited(body):
	if body == Global.Player and m6 == true:
		$Music_6.stop()
		m6 = false


func _on_Music7_body_entered(body):
	if body == Global.Player and m7 == false:
		$Music_7.play()
		m7 = true


func _on_Music7_body_exited(body):
	if body == Global.Player and m7 == true:
		$Music_7.stop()
		m7 = false


func _on_Music8_body_entered(body):
	if body == Global.Player and m8 == false:
		$Music_8.play()
		m8 = true


func _on_Music8_body_exited(body):
	if body == Global.Player and m8 == true:
		$Music_8.stop()
		m8 = false


func _on_Music9_body_entered(body):
	if body == Global.Player and m9 == false:
		$Music_9.play()
		m9 = true


func _on_Music9_body_exited(body):
	if body == Global.Player and m9 == true:
		$Music_9.stop()
		m9 = false


func _on_Music10_body_entered(body):
	if body == Global.Player and m10 == false:
		$Music_10.play()
		m10 = true


func _on_Music10_body_exited(body):
	if body == Global.Player and m10 == true:
		$Music_10.stop()
		m10 = false

func avalanche(avalanche):
	if avalanche == true:
		get_node("Music1").queue_free()
		get_node("Music2").queue_free()
		get_node("Music3").queue_free()
		get_node("Music4").queue_free()
		get_node("Music5").queue_free()
		get_node("Music6").queue_free()
		get_node("Music7").queue_free()
		get_node("Music8").queue_free()
		get_node("Music9").queue_free()
		get_node("Music10").queue_free()
		$Music_11.play()
		