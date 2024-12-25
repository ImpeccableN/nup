extends Node2D

var current_achievement_array : Array

const achievement_scene = preload("res://Scenes/Achievement.tscn")


func _ready():
	pass


func initiate_achievement(text):
	var lvl_node = get_parent().get_child(1)
	var achiev_instance = achievement_scene.instance()
	lvl_node.add_child(achiev_instance)
	achiev_instance.connect("hide_achievement", self, "_on_achievement_hide", [achiev_instance])
	achiev_instance._set_position(calculate_position())
	current_achievement_array.append(achiev_instance)
	achiev_instance.initiate(text)


func calculate_position():
	var achiev_pos = Vector2(799, 525)
	var array_length = current_achievement_array.size()
	if array_length > 0:
		for i in array_length:
			achiev_pos.y -= 78
	return achiev_pos


func _on_achievement_hide(node):
	current_achievement_array.erase(node)
