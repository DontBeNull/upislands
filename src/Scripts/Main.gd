extends Node2D

func _ready():
	var timer = Timer.new()
	timer.connect("timeout", self, "_on_Main_timeout")
	timer.one_shot = true
	timer.wait_time = 5.0
	add_child(timer)
	timer.start()
	
func _on_Main_timeout():
	remove_child($LoadingScreen)
	var level_scene = load("res://Scenes/Level.tscn")
	var level_instance = level_scene.instance()
	add_child(level_instance)
