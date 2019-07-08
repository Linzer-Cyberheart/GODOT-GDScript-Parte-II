extends Node2D

var x = false
var y = false
var z = false
var j = false

func _ready():
	Global.level1a = false
	Global.level2a = true
	Global.level3a = false
	Global.epilogoa = false
	
	x = Global.level1a
	y = Global.level2a
	z = Global.level3a
	j = Global.epilogoa
	
	get_tree().call_group("interface", "level", x, y, z, j)
	
	$MusicStart.play()
	$Ambience.play()
	$World/Space/Roofs/Roof11.hide()
	$World/Space/Roofs/Roof12.hide()
	$World/Space/Roofs/Roof13.hide()

func _on_Human_shoot(bullet, _position, _direction):
	var b = bullet.instance()
	add_child(b)
	b.start(_position, _direction)
	$WeaponEffects/Shoot_SFX.play()
	
var clear = false
func _on_ClearARea_body_entered(body):
	if body == Global.Player and clear == false:
		$World/Space/Roofs/Roof11.show()
		$World/Space/Roofs/Roof12.show()
		$World/Space/Roofs/Roof13.show()
		get_node("World/Structure").queue_free()
		get_node("World/BrokenPieces").queue_free()
		get_node("World/Fire").queue_free()
		get_node("World/Others").queue_free()
		get_node("Cars").queue_free()
		get_node("World/Space/WallUP").queue_free()
		get_node("World/Space/FloorUP").queue_free()
		clear = true
		$AlmaCut/AnimationPlayer.play("AlmaCut")
