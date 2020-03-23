extends Sprite

var sprite_timer = 0
var i = 0

func _physics_process(delta):
	sprite_timer += delta
	if(sprite_timer > 0.1):
		i += 1
		sprite_timer = 0
	frame = i%4
