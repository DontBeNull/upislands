extends RigidBody2D

func _physics_process(delta):
	rotation = 0
	if(position.y > 850):
		queue_free()
		
func _on_PlayButton_button_up():
	sleeping = false
	
func _on_Hero_hero_death():
	self.gravity_scale = 15.0
