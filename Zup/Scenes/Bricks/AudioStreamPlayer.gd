extends AudioStreamPlayer

var sound_array = ["res://Assets/Sound/explosion_1.wav",
"res://Assets/Sound/explosion_2.wav",
"res://Assets/Sound/explosion_3.wav",
"res://Assets/Sound/explosion_4.wav",
"res://Assets/Sound/explosion_5.wav"]





func play_rand_sound():
	var sound_num = randi() % 5
	print(sound_num)
	stream = load(sound_array[sound_num])
	play()
