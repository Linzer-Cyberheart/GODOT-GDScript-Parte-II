extends KinematicBody2D

signal health_changed
signal dead
signal shoot

export (PackedScene) var Bullet
export (int) var max_speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var max_health

var velocity = Vector2()
var can_shoot = true
var alive = true
var health

func _ready():
	health = max_health
	emit_signal("health_changed", health * 100/max_health)
	$GunTimer.wait_time = gun_cooldown

func control(delta):
	pass

func shoot():
	if can_shoot:
		can_shoot = false
		$GunTimer.start()
		var dir = Vector2(1,0).rotated($Weapon.global_rotation)
		var dir2 = Vector2(1,0).rotated($Body.global_rotation)
		emit_signal("shoot", Bullet, $Weapon/Muzzle1.global_position, dir)
		emit_signal("shoot", Bullet, $Weapon/Muzzle2.global_position, dir)

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)
	
func take_damage(amount):
	health -= amount
	emit_signal("health_changed", health * 100/max_health)
	if health <= 0:
		explode()
		
var dead = false
var result = []
func explode():
	dead = true
	max_speed = 0
	$GunTimer.stop()
	can_shoot = false
	$UnitDisplay/HealthMeter.hide()
	$Dead/AnimationPlayer.play("Dying")



func _on_GunTimer_timeout():
		can_shoot = true


func _on_AnimationPlayer_animation_finished(anim_name):
	pass
