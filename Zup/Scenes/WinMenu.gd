extends Panel

var nxt_lvl_num


func pop_up(level_num):
	set_visible(true)
	nxt_lvl_num = str(level_num + 1)


func _on_NextLvlButton_pressed():
	get_tree().change_scene("res://Level/Level" + nxt_lvl_num + ".tscn")
