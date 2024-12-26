extends Label


signal hide_achievement


func initiate(headtext, achtext):
	raise()
	$Headline.text = headtext
	$AchTex.text = achtext
	$Timer.start()


func _on_Timer_timeout():
	emit_signal("hide_achievement")
	queue_free()

