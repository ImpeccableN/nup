extends ColorRect

export var level_name : int
onready var win_menu = get_tree().get_nodes_in_group("win_menu")[0]



# Called when the node enters the scene tree for the first time.
func _ready():
	AchievementManager.current_achievement_array.clear()
	add_to_group("level")
	var nick_node = get_tree().get_nodes_in_group("nick")[0]
	nick_node.connect("lvl_win", self, "level_won")
	AchievementManager.initiate_achievement("start" + str(level_name))


func level_won():
	win_menu.pop_up(level_name)
	AchievementManager.initiate_achievement("done" + str(level_name))

