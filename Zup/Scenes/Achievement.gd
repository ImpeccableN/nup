extends PopupDialog

var start_position = Vector2(799, 525)

func initiate(text):
	
	$AchTex.text = text
	popup()
