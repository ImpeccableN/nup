extends Label


signal hide_achievement


func initiate(text):
	raise()
	$AchTex.text = text
	print("popped up at position" + str(rect_position))
	$Timer.start()


func _on_Timer_timeout():
	emit_signal("hide_achievement")
	queue_free()
