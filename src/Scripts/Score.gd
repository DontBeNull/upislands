extends RichTextLabel

func _physics_process(delta):
	text = "Score: "+str(get_parent().score)
