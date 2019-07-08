extends Sprite

var damage = 70

func _ready():
	$Engine.play()


func _on_DamageArea_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
