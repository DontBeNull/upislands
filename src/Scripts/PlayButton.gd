extends TextureButton

func _on_PlayButton_button_up():
	visible = false

func _on_Hero_hero_death():
	visible = true

func _on_CreditsButton_button_up():
	visible = not visible
