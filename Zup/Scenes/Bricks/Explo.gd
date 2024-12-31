extends RigidBody2D

var exploded = false

var sound_array = ["res://Assets/Sound/explosion_1.wav",
"res://Assets/Sound/explosion_2.wav",
"res://Assets/Sound/explosion_3.wav",
"res://Assets/Sound/explosion_4.wav",
"res://Assets/Sound/explosion_5.wav"]


func _on_ExploRad_explode():
	if not exploded:
		$Sprite.play("explosion")
		var audio_player = AudioStreamPlayer.new()
		get_parent().add_child(audio_player)
		play_rand_sound(audio_player)
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




func play_rand_sound(player):
	var sound_num = randi() % 5
	print(sound_num)
	player.stream = load(sound_array[sound_num])
	player.play()
