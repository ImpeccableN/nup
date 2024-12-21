extends RigidBody2D

var impulse_force = 5000


func add_explosion(block):
	apply_central_impulse((transform.origin - block.transform.origin).normalized() * impulse_force)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



