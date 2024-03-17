extends Area2D

@onready var path_follow: PathFollow2D = get_parent()
@export var speed = 100
var downscore = 0

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() +(speed * delta))

func _input(event):
	if Input.is_key_pressed(KEY_DOWN) && downscore >= 1:
		print("Got it! Downs: ", downscore)
		queue_free()
	if Input.is_key_pressed(KEY_DOWN) && downscore <= 0:
		print("Missed!")

func _on_transparent_blue_arrow_down_area_entered(area):
	downscore += 1
