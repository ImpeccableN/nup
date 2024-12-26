extends ColorRect

export var level_name : String



# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("level")
	var nick_node = get_tree().get_nodes_in_group("nick")[0]
	nick_node.connect("lvl_win", self, "level_won")
	AchievementManager.initiate_achievement("start" + level_name)


func level_won():
	print("you won")

