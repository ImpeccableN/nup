extends Node2D

var current_achievement_array : Array
onready var achievement_dic = get_node("AchievementList")

const achievement_scene = preload("res://Scenes/Achievement.tscn")



func _ready():
	pass


func initiate_achievement(achvar):
	if achievement_dic.achlist[achvar]["achieved"] == "false":
		achievement_dic.achlist[achvar]["achieved"] = "true"
		var lvl_node = get_tree().get_nodes_in_group("level")[0]
		var achiev_instance = achievement_scene.instance()
		lvl_node.add_child(achiev_instance)
		achiev_instance.connect("hide_achievement", self, "_on_achievement_hide", [achiev_instance])
		achiev_instance._set_position(calculate_position())
		current_achievement_array.append(achiev_instance)
		achiev_instance.initiate(achievement_dic.achlist[achvar]["header"], achievement_dic.achlist[achvar]["text"])


func calculate_position():
	var achiev_pos = Vector2(799, 525)
	var array_length = current_achievement_array.size()
	if array_length > 0:
		for i in array_length:
			achiev_pos.y -= 78
	return achiev_pos


func _on_achievement_hide(node):
	current_achievement_array.erase(node)
