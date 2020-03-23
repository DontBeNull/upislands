extends TextureButton

func _on_CreditsButton_button_up():
	if($CreditsLabel.text == " Credits"):
		$CreditsLabel.text = " Menu"
	else:
		$CreditsLabel.text = " Credits"
		
	var vis = $CreditsNode.visible
	$CreditsNode.visible = not vis
