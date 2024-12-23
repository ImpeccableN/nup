extends RigidBody2D

var impulse_force = 4000
var last_position
var checking_floor = false


func add_explosion(block):
	apply_central_impulse((transform.origin - block.transform.origin).normalized() * impulse_force)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	pass


func check_for_target():
	checking_floor = true
	var entered_bodies_array = $FloorChecker.get_overlapping_bodies()
	for body in entered_bodies_array:
		if body.is_in_group("target"):
			$Timer.stop()
			print("you win")
#			implement win_func()


func _on_Timer_timeout():
	if position == last_position:
		check_for_target()
	else:
		last_position = position
