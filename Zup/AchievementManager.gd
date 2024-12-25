extends Node

var current_achievement_array : Array
const achievement_scene = preload("res://Scenes/Achievement.tscn")

func initiate_achievement(text):
	var achiev_instance = achievement_scene.instance()
	add_child(achiev_instance)
	achiev_instance.connect("hide", self, "_on_achievement_hide", [achiev_instance])
	achiev_instance._set_position(calculate_position())
	current_achievement_array.append(achiev_instance)
	


func calculate_position():
	var achiev_pos = Vector2(799, 525)
	var array_length = current_achievement_array.size()
	if array_length > 0:
		for i in array_length:
			achiev_pos.y -= 78
	return achiev_pos


func _on_achievement_hide(node):
	current_achievement_array.erase(node)
