extends StaticBody2D

func collected():
	var diamond_scene = load("res://Scenes/Diamond.tscn")
	var diamond_instance = diamond_scene.instance()
	diamond_instance.position = Vector2(randf()*800.0+100.0, randf()*450.0+50.0)
	diamond_instance.add_to_group("diamonds")
	$"../Hero".connect("hero_death", diamond_instance, "_on_Hero_hero_death")
	get_parent().call_deferred("add_child", diamond_instance)	
	get_parent().score += 1
	queue_free()

func _on_Hero_hero_death():
	queue_free()
