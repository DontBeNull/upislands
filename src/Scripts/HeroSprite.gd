extends Sprite

var sprite_timer = 0
var i = 0
var frame_library = {
	"idle": [0, 1, 2, 3, 4, 5, 6, 7],
	"run": [8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
	"jump": [37, 38, 39, 40],
	"fall": [41, 42, 43, 44]
}

func _physics_process(delta):
	sprite_timer += delta
	if(sprite_timer > 0.15):
		i += 1
		sprite_timer = 0
	var action_string = get_action()
	var frames = frame_library[action_string]
	frame = frames[i%len(frames)]

func get_action():
	var vel = get_parent().velocity
	if vel.y < 0:
		return "jump"
	elif vel.y > 0:
		return "fall"
	elif vel.x != 0:
		return "run"
	return "idle"
