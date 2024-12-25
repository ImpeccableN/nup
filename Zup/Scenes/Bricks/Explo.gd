extends RigidBody2D

var exploded = false


func _on_ExploRad_explode():
	if not exploded:
		$Sprite.play("explosion")
		$AudioStreamPlayer.play_rand_sound()
		var colliding_bricks = $ExploRad.get_overlapping_bodies()
		exploded = true
		yield(manipulate_bricks(colliding_bricks), "completed")
		queue_free()


func manipulate_bricks(bricks_array):
	yield(get_tree().create_timer(0.1), "timeout")
	for brick in bricks_array:
			if brick.has_method("add_explosion"):
				brick.add_explosion(get_node("."))
			if brick.has_method("_on_ExploRad_explode"):
				brick._on_ExploRad_explode()
	yield(get_tree().create_timer(0.1), "timeout")

