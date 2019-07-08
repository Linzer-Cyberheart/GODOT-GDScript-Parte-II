extends Node2D

var x = false
var y = false
var z = false
var j = false


func _ready():
	Global.level1a = true
	Global.level2a = false
	Global.level3a = false
	Global.epilogoa = false
	
	x = Global.level1a
	y = Global.level2a
	z = Global.level3a
	j = Global.epilogoa
	
	get_tree().call_group("interface", "level", x, y, z, j)