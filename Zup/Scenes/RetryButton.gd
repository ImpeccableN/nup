extends Button

func _on_RetryButton_pressed():
	AchievementManager.current_achievement_array.clear()
	get_tree().reload_current_scene()
