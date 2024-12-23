extends RigidBody2D

var impulse_force = 4000


func add_explosion(block):
	apply_central_impulse((transform.origin - block.transform.origin).normalized() * impulse_force)


# Called when the node enters the scene tree for the first time.
func _ready():
	set_max_contacts_reported(1)





func _on_Mainy_body_entered(body):
	if body.is_in_group("floor"):
		print("landed")
		print(get_global_transform().x)
