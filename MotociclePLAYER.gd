extends "res://Scripts/Character.gd"

export var disguises = 3 # how many disguises you start
export var disguise_duration = 5 # how long last
export var disguise_slowdown = 0.25 # diguise move
export var motocycle_velocity = 5 # velocity of moto

var motion = Vector2()
var vision_change_on_cooldown = false

var disguised = false
var velocity_multiplier = 1
var moto = false
var lantern = false


enum vision_mode {DARK, NIGHTVISION, HOUSEVISION}


func _ready():
	Global.Player = self
	vision_mode = DARK
	$Particles2D.emitting = false
	$Torch.enabled = false
	$Timer.wait_time = disguise_duration
	$Moto_SFX.stop()
	update_diguise_display()
	reveal()

func _process(delta):
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	if disguised:
		$Label.rect_rotation = - rotation_degrees
		$Label.text = str($Timer.time_left).pad_decimals(2)


func update_motion(delta):
	
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
		if Input.is_action_just_pressed("lantern"):
			toggle_lantern()


func cycle_vision_mode():
	if vision_mode == DARK:
		get_tree().call_group("interface", "NightVision_mode")
		vision_mode = NIGHTVISION
		
	elif vision_mode == NIGHTVISION:
		get_tree().call_group("interface", "DarkVision_mode")
		vision_mode = DARK


func _on_VisionModeTimer_timeout():
	vision_change_on_cooldown = false
	
func lantern():
	$Sprite.texture = load(Global.lantern_sprite)
	$Light2D.texture = load(Global.lantern_sprite)
	$Light2D.enabled = true
	$LightOccluder2D.occluder = load(Global.lantern_occluder)
	$CollisionShape2D.shape = load(Global.lantern_shape)
	$Particles2D.emitting = false
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
	$Torch.enabled = false
	$Moto_SFX.stop()
	$CircleLight.enabled = false
	$Particles2D2.emitting = false
	collision_layer = 1

	velocity_multiplier = 1
	
	disguised = false
	moto = false
	lantern = false

func disguise():
	$Label.visible = true
	$Sprite.texture = load(Global.box_sprite)
	$Light2D.enabled = false
	$LightOccluder2D.occluder = load(Global.box_occluder)
	$CollisionShape2D.shape = load(Global.box_shape)
	$Particles2D.emitting = false
	$Torch.enabled = false
	$Moto_SFX.stop()
	$CircleLight.enabled = false
	$Particles2D2.emitting = false
	
	collision_layer = 128

	velocity_multiplier = disguise_slowdown
	$Timer.start()

	disguises -= 1
	update_diguise_display()
	disguised = true

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
	
#Things to get

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

