extends RigidBody2D

var impulse_force = 8000
var last_position
var checking_floor = false
var first_flight = false

var current_state

var img_default = preload("res://Assets/Img/nick_default.png")
var img_laughing = preload("res://Assets/Img/nick_laughing.png")
var img_shades = preload("res://Assets/Img/nick_shades.png")

enum STATE {DEFAULT, FLYING, WINNING}

signal lvl_win


func add_explosion(block):
	apply_central_impulse((transform.origin - block.transform.origin).normalized() * impulse_force)


# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = STATE.FLYING
	last_position = position


func _physics_process(_delta):
	if current_state != STATE.FLYING:
		if $FloorChecker.get_overlapping_bodies().empty():
			$Sprite.set_texture(img_laughing)
			current_state = STATE.FLYING
			if !first_flight:
				AchievementManager.initiate_achievement("ach2")
#				first_flight = true
	elif current_state == STATE.FLYING:
		if not $FloorChecker.get_overlapping_bodies().empty():
			$Sprite.set_texture(img_default)
			current_state = STATE.DEFAULT


func check_for_target():
	checking_floor = true
	var entered_bodies_array = $FloorChecker.get_overlapping_bodies()
	for body in entered_bodies_array:
		if body.is_in_group("target"):
			$Sprite.set_texture(img_shades)
			$Timer.stop()
			emit_signal("lvl_win")
#			implement win_func()


func _on_Timer_timeout():
	if position == last_position:
		check_for_target()
	else:
		last_position = position
