extends "res://Scripts/Character.gd"


export var disguises = 3 # how many disguises you start
export var disguise_duration = 5 # how long last
export var disguise_slowdown = 0.25 # diguise move
export var motocycle_velocity = 4 # velocity of moto

var motion = Vector2()
var vision_change_on_cooldown = false

var disguised = false
var velocity_multiplier = 1
var moto = false
var lantern = false
var reveal = true

enum vision_mode {DARK, NIGHTVISION, HOUSEVISION}

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
var guard = false

func _ready():
	Global.Player = self
	vision_mode = DARK
	$Particles2D.emitting = false
	$Torch.enabled = false
	$Timer.wait_time = disguise_duration
	$Moto_SFX.stop()
	$Weapon2/Laseron_ON.hide()
	update_diguise_display()
	reveal()
	health = max_health
	emit_signal("health_changed", health * 100/max_health)
	$GunTimer.wait_time = gun_cooldown

func _physics_process(delta):
	if not alive:
		return
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	
	if disguised:
		$Label.rect_rotation = - rotation_degrees
		$Label.text = str($Timer.time_left).pad_decimals(2)
		
	if Global.camera == true:
		$Camera2D2.zoom = Vector2(1,1)


func update_motion(delta):
	
	if moto == false:
		look_at(get_global_mouse_position())

		if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
			motion.y = clamp((motion.y - SPEED), -MAX_SPEED, 0)
		elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
			motion.y = clamp((motion.y + SPEED), 0, MAX_SPEED)
		else:
			motion.y = lerp(motion.y, 0, FRICTION)

		if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
			motion.x = clamp((motion.x - SPEED), -MAX_SPEED, 0)
		elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("left"):
			motion.x = clamp((motion.x + SPEED), 0, MAX_SPEED)
		else:
			motion.x = lerp(motion.x, 0, FRICTION)
			
	if moto == true:
		var rotation_speed = 3
		var speed = 200
		var rot_dir = 0
		
		if Input.is_action_pressed("ui_right"):
			rot_dir += 1
		elif Input.is_action_pressed("ui_left"):
			rot_dir -= 1
		
		rotation += rotation_speed * rot_dir * delta
		motion = Vector2()
		
		if Input.is_action_pressed("ui_up"):
			motion = Vector2(speed, 0).rotated(rotation)
		elif Input.is_action_pressed("ui_down"):
			motion = Vector2(-speed/2, 0).rotated(rotation)

func take_damage(amount):
	health -= amount
	get_tree().call_group("interface", "hited")
	emit_signal("health_changed", health * 100/max_health)
	if health >= 0.5 * max_health:
		$BloodStep.hide()
		$HealthLow_SFX.stop()
		$HealthDown_SFX.stop()
		emit_signal("health_changed", health * 100/max_health)
	if health < 0.4 * max_health:
		$HealthLow_SFX.play()
		$HealthDown_SFX.stop()
		emit_signal("health_changed", health * 100/max_health)
	if health <= 0.25 * max_health:
		$BloodStep.show()
		$HealthLow_SFX.stop()
		$HealthDown_SFX.play()
		emit_signal("health_changed", health * 100/max_health)
	if health <= 0:
		by_alma()
		
#func take_heal(amount):
#	health += amount
#	health = clamp(health, 0, max_health)
#	emit_signal("health_changed", health * 100/max_health)

####################################################DEATH SCENES#################################################
func by_alma():
	get_node("Death_Scenes/By_Alma").show()
	$Death_Scenes/AnimationPlayer.play("ByAlma")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://Scenes/GameOver_SCREEN.tscn")

#################################################################################################################

func shoot():
	if can_shoot:
		if Global.rifle == false:
			can_shoot = false
			$GunTimer.start()
			var dir = Vector2(1,0).rotated($Weapon.global_rotation)
			emit_signal("shoot", Bullet, $Weapon/Muzzle1.global_position, dir)
			emit_signal("shoot", Bullet, $Weapon/Muzzle2.global_position, dir)
		if Global.rifle == true:
			if Global.skin == true:
				$Weapon2.texture = load("res://GFX/PNG/Armored/PlayerSkinArmed2.png")
			can_shoot = false
			$GunTimer.start()
			var dir = Vector2(1,0).rotated($Weapon.global_rotation)
			$Weapon2/AnimationPlayer.play("Recoil")
			emit_signal("shoot", Bullet, $Weapon2/M1.global_position, dir)
			emit_signal("shoot", Bullet, $Weapon2/M2.global_position, dir)
			emit_signal("shoot", Bullet, $Weapon2/M3.global_position, dir)
			emit_signal("shoot", Bullet, $Weapon2/M4.global_position, dir)

func _on_GunTimer_timeout():
	can_shoot = true

func _input(event):
	if Input.is_action_just_pressed("ui_vision_mode_change") and not vision_change_on_cooldown:
		cycle_vision_mode()
		vision_change_on_cooldown = true
		$VisionModeTimer.start()
	
	if Input.is_action_just_pressed("toggle_disguise"):
		toggle_disguise()
	
	if Global.Player.has_node("Motocicle"):
		if Input.is_action_just_pressed("moto"):
			toggle_moto()
	
	if Global.Player.has_node("Lantern"):
		$Sprite.texture = load(Global.lantern_sprite)
		if Input.is_action_just_pressed("lantern"):
			toggle_lantern()
	
	if Global.Player.has_node("Sword"):
		if Input.is_action_just_pressed("stab"):
			if guard == true and moto == false:
				$Sword_Samurai/AnimationPlayer.play("Sword_Attack")
				
	if Global.Player.has_node("Gun") or Global.Player.has_node("Rifle"):
		if Input.is_action_just_pressed("fire") and not disguised:
			
			if Global.rifle == false:
	#			Input.set_custom_mouse_cursor(load("res://GFX/Interface/PNG/crossair_white.png"), Input.CURSOR_ARROW, Vector2(16,16))
				$Weapon.show()
				$Weapon/Muzzle1/Shoot_SFX.play()
	#			$Weapon/Muzzle2/Shoot_SFX2.play()
				$GunFire.play("GunEffect")
				$Gun_Guard2.hide()
				$Gun_Guard3.hide()
				shoot()
				guard = false
			
			if Global.rifle == true:
	#			Input.set_custom_mouse_cursor(load("res://GFX/Interface/PNG/crossair_white.png"), Input.CURSOR_ARROW, Vector2(16,16))
				$Weapon.hide()
				$Weapon/Muzzle1/Shoot_SFX.stop()
				$Weapon2.show()
				$Weapon2/M1/Rifle_Shoot_SFX.play()
				if Global.laseron == true:
					$Weapon2/Laseron_ON.show()
	#			$Weapon/Muzzle2/Shoot_SFX2.play()
				$GunFire.play("GunEffect")
				$Gun_Guard.hide()
				shoot()
				guard = false
		
		if Input.is_action_just_pressed("guard"):
			if Global.rifle == true:
				$Weapon2.hide()
				$Weapon2/Laseron_ON.hide()
				$Gun_Guard.show()
			if Global.rifle == false:
				$Weapon.hide()
				$Gun_Guard2.show()
				$Gun_Guard3.show()
			guard = true


func cycle_vision_mode():
	if vision_mode == DARK:
		get_tree().call_group("interface", "NightVision_mode")
		vision_mode = NIGHTVISION
		
	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface", "DarkVision_mode")
		vision_mode = DARK


func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false

	 
#########################################COLLECTABLES/USABLES#################################################

func lantern():
	$Sprite.texture = load(Global.lantern_sprite)
	$Light2D.texture = load(Global.lantern_sprite)
	$Light2D.enabled = true
	$LightOccluder2D.occluder = load(Global.lantern_occluder)
	$CollisionShape2D.shape = load(Global.lantern_shape)
	$Particles2D.emitting = false
	$LanternEffect.enabled = true
	$Sprite/LanterEffect2.enabled = true
	$Torch.enabled = false
	$CircleLight.enabled = true
	$Particles2D2.emitting = true
	collision_layer = 1
	$Lantern_SFX.play()
	
	lantern = true
	
func toggle_lantern():
	if lantern:
		reveal()
	else:
		lantern()


func toggle_disguise():
	if disguised:
		reveal()
	elif disguises > 0:
		disguise()

func reveal():
		$Label.visible = false
		$Sprite.texture = load(Global.player_sprite)
		$Light2D.texture = load(Global.player_sprite)
		$Light2D.enabled = true
		$LightOccluder2D.occluder = load(Global.player_occluder)
		$CollisionShape2D.shape = load(Global.player_shape)
		$Particles2D.emitting = false
		$LanternEffect.enabled = false
		$Sprite/LanterEffect2.enabled = false
		$Torch.enabled = false
		$Moto_SFX.stop()
		$CircleLight.enabled = false
		$Particles2D2.emitting = false
		if Global.skin == true:
			$SkinEyes.show()
			$SkinEyes2.show()
		collision_layer = 1
	
		velocity_multiplier = 1
		
		disguised = false
		lantern = false
		moto = false

func disguise():
	$Label.visible = true
	$Sprite.texture = load(Global.box_sprite)
	$Light2D.enabled = false
	$LightOccluder2D.occluder = load(Global.box_occluder)
	$CollisionShape2D.shape = load(Global.box_shape)
	$Particles2D.emitting = false
	$LanternEffect.enabled = false
	$Sprite/LanterEffect2.enabled = false
	$Torch.enabled = false
	$Moto_SFX.stop()
	$CircleLight.enabled = false
	$Particles2D2.emitting = false
	can_shoot = false
	$SkinEyes.hide()
	$SkinEyes2.hide()
	$Weapon.hide()
	
	collision_layer = 128

	velocity_multiplier = disguise_slowdown
	$Timer.start()

	disguised = true
	disguises -= 1
	update_diguise_display()

func pilot():
		$Sprite.texture = load(Global.motocicle_sprite)
		$Light2D.texture = load(Global.motocicle_sprite)
		$Light2D.enabled = true
		$LightOccluder2D.occluder = load(Global.moto_occluder)
		$CollisionShape2D.shape = load(Global.moto_shape)
		$Particles2D.emitting = true
		$Torch.enabled = true
		$CircleLight.enabled = false
		$Particles2D2.emitting = false
		collision_layer = 1
		$Moto_SFX.play()
		
		velocity_multiplier = motocycle_velocity
	
		moto = true

func toggle_moto():
	if moto:
		reveal()
	else:
		pilot()
		
func update_diguise_display():
	get_tree().call_group("DisguiseDisplay", "update_diguises", disguises)


func collect_suitcase():
	var loot = Node.new()
	loot.set_name("Suitcase")
	add_child(loot)
	$Suitcase_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Suitcase")
	Global.suitcase = Global.suitcase + 1
	get_tree().call_group("interface", "update_suitcase", "Suitcase")
	
	
func collect_files():
	var loot = Node.new()
	loot.set_name("Files")
	add_child(loot)
	$Files_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Files")
	Global.files = Global.files + 1
	get_tree().call_group("interface", "update_files", "Files")
	
func collect_lantern():
	var loot = Node.new()
	loot.set_name("Lantern")
	add_child(loot)
	$Lantern_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Lantern")
	
func collect_motocicle():
	var loot = Node.new()
	loot.set_name("Motocicle")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot", "Motocicle")
	

func collect_knife():
	var loot = Node.new()
	loot.set_name("Knife")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot", "Knife")
	

func collect_gun():
	var loot = Node.new()
	loot.set_name("Gun")
	add_child(loot)
	$Weapon_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Gun")
	
func collect_rifle():
	Global.rifle = true
	var loot = Node.new()
	loot.set_name("Rifle")
	add_child(loot)
	$Rifle_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Rifle")
	
func collect_recorder():
	var loot = Node.new()
	loot.set_name("Recorder")
	add_child(loot)
	$Recorder_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Recorder")
	Global.recorder = Global.recorder + 1
	get_tree().call_group("interface", "update_recorder", "Recorder")
	
func collect_message():
	var loot = Node.new()
	loot.set_name("Message")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot", "Message")
	
func collect_paxton():
	var loot = Node.new()
	loot.set_name("Paxton")
	add_child(loot)
	get_tree().call_group("interface", "collect_loot", "Paxton")
	
func collect_medkit():
	var loot = Node.new()
	loot.set_name("Medkit")
	add_child(loot)
	$Medkit_SFX.play()
	var healing
	if health < max_health:
		healing = 0.2 * max_health
		health = clamp((health + healing), 0, max_health)
		emit_signal("health_changed", health * 100/max_health)
	get_tree().call_group("interface", "collect_loot", "Medkit")
	
func collect_laseron():
	var loot = Node.new()
	loot.set_name("Laseron")
	add_child(loot)
	$Armor_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Laseron")
	
func collect_skin():
	var loot = Node.new()
	loot.set_name("Skin")
	add_child(loot)
	$SkinEffect_Audio.play()
	$Skin_SFX.play()
	get_tree().call_group("interface", "collect_loot", "Skin")
	if Global.skin == true:
		$SkinEyes.show()
		$SkinEyes2.show()
		$Eyes_Light1.show()
		$Eyes_Light2.show()
		$Sprite.texture = load("res://GFX/PNG/Armored/PlayerSkin.png")
		Global.player_sprite = "res://GFX/PNG/Armored/PlayerSkin.png"
		Global.lantern_sprite = "res://GFX/PNG/Armored/PlayerSkinLantern.png"
		Global.motocicle_sprite = "res://GFX/PNG/Moto/skinmoto.png"
		$Weapon.texture = load("res://GFX/PNG/Armored/PlayerSkinArmed.png")
		max_health = 400
		health = max_health
		emit_signal("health_changed", health * 100/max_health)
		get_tree().call_group("interface", "skintrue", "Skin")

func collect_sword():
	var loot = Node.new()
	loot.set_name("Sword")
	add_child(loot)
	$SkinEffect_Audio.play()
	get_tree().call_group("interface", "collect_loot", "Sword")
	if Global.sword == true:
		$Sword_Samurai.show()