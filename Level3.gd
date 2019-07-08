extends Node2D

var k = false

var x = false
var y = false
var z = false
var j = false

func _ready():
	Global.level1a = false
	Global.level2a = false
	Global.level3a = true
	Global.epilogoa = false
	
	x = Global.level1a
	y = Global.level2a
	z = Global.level3a
	j = Global.epilogoa
	
	get_tree().call_group("interface", "level", x, y, z, j)

func _on_Human_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
	$Sounds/Shoot_SFX.play()

func _on_Heli_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
	$Sounds/Shoot2_SFX.play()

func _on_Clear_UP_body_entered(body):
	if body == Global.Player and k == false:
#		get_node("Enemies/Helicopters").queue_free()
		get_node("Enemies/Zombies/ZombiesAlive").queue_free()
#		get_node("Enemies/Soldiers").queue_free()
		k = true
		