extends KinematicBody2D

var velocity: = Vector2(0.0, 0.0)
var speed: = Vector2(300.0, 1200.0)
export var gravity = 49.0
var wall_jumping = false
signal hero_death

func _physics_process(delta):
	if(is_on_floor()):
		wall_jumping = false
		speed.x = 300.0
	if(position.y > 850):
		_on_die()
	var direction = get_direction()
	velocity.x = speed.x * direction.x
	velocity.y += speed.y * direction.y + gravity
	velocity = move_and_slide(velocity, Vector2(0, -1), false, 4, 3.14/4, false)
	
	for i in range(get_slide_count()):
		var body = get_slide_collision(i).collider
		if body.is_in_group("diamonds"):
			body.collected()

func _on_die():
	position = Vector2(875.0, -100.0)
	emit_signal("hero_death")
	
func get_direction():
	var horizontal = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	if(horizontal > 0.0): $HeroSprite.set_flip_h(false)
	elif(horizontal < 0.0): $HeroSprite.set_flip_h(true)
	
	var vertical: = float()
	if(Input.is_action_just_pressed("move_up")):
		if(is_on_floor()):
			vertical = -1.0
		elif(is_on_wall() and not wall_jumping):
			wall_jumping = true
			speed.x = 900.0
			vertical = -1.0
		else:
			vertical = 0.0
	else:
		vertical = 0.0
	return Vector2(
		horizontal,
		vertical
	)
