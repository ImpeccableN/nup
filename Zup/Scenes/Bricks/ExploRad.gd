extends Area2D


var mouse_entered = false
signal explode()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(_delta):
	if mouse_entered and Input.is_action_just_pressed("left_click"):
		emit_signal("explode")


func _on_Explo_mouse_entered():
	mouse_entered = true


func _on_Explo_mouse_exited():
	mouse_entered = false
