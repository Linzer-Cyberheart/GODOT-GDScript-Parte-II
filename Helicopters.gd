extends Node2D

var x = false

func _ready():
	$HeliEnemy/Heli/Heli_SFX.playing = false
	$HeliEnemy2/Heli/Heli_SFX.playing = false
	$HeliEnemy3/Heli/Heli_SFX.playing = false
	$HeliEnemy4/Heli/Heli_SFX.playing = false
	$HeliEnemy5/Heli/Heli_SFX.playing = false

func _on_Area2D_body_entered(body):
	if body == Global.Player and x == false:
		$HeliEnemy/Heli/Heli_SFX.playing = true
		$HeliEnemy2/Heli/Heli_SFX.playing = true
		$HeliEnemy3/Heli/Heli_SFX.playing = true
		$HeliEnemy4/Heli/Heli_SFX.playing = true
		$HeliEnemy5/Heli/Heli_SFX.playing = true
		$AnimationPlayer.play("Helis")
		x = true


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
