extends Node2D

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