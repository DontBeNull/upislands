extends RigidBody2D

func _physics_process(delta):
	if(position.y > 1000):
		queue_free()
