extends Node2D

var level_timer = 0
var drop_point = Vector2(randf()*500+100, -100.0)
var init_spots: = [
	Vector2(500.0, 500.0), Vector2(275.0, 370.0),
	Vector2(500.0, 225.0), Vector2(700.0, 80.0),
	Vector2(587.0, -70.0)
]
var playing = false
var th_inc = 1.3
var threshold = th_inc
var score = 0
var high_score = 0

func _physics_process(delta):
	if(playing):
		level_timer += delta
		if level_timer > threshold:
			var island_scene = load("res://Scenes/Island.tscn")
			var island_instance = island_scene.instance()
			island_instance.position = drop_point
			$Hero.connect("hero_death", island_instance, "_on_Hero_hero_death")
			call_deferred("add_child", island_instance)
			
			if(drop_point.x < 500.0):
				drop_point.x += randf()*300-100
			else:
				drop_point.x += randf()*300-200
			threshold += th_inc
		
func _on_PlayButton_button_up():
	playing = true
	score = 0
	var diamond_scene = load("res://Scenes/Diamond.tscn")
	var diamond_instance = diamond_scene.instance()
	diamond_instance.position = Vector2(randf()*800.0+100.0, randf()*450.0+50.0)
	diamond_instance.add_to_group("diamonds")
	$Hero.connect("hero_death", diamond_instance, "_on_Hero_hero_death")	
	call_deferred("add_child", diamond_instance)	
	
func _on_Hero_hero_death():
	playing = false
	if score > high_score: high_score = score
	$PlayButton/Highscore.text = "Highscore: "+str(high_score)
