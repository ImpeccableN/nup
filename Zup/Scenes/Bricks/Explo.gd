extends RigidBody2D

var exploded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_ExploRad_explode():
	if not exploded:
		var colliding_bricks = $ExploRad.get_overlapping_bodies()
		exploded = true
		for brick in colliding_bricks:
			if brick.has_method("add_explosion"):
				brick.add_explosion(get_node("."))
			if brick.has_method("_on_ExploRad_explode"):
				brick._on_ExploRad_explode()
		queue_free()
