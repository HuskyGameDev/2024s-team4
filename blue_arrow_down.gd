extends Area2D

@onready var path_follow: PathFollow2D = get_parent()
@export var speed = 300
var downscore = false

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() +(speed * delta))

func _input(event):
	if Input.is_key_pressed(KEY_DOWN) && downscore == true:
		print("Got it! Downs: ", downscore)
		queue_free()
	if Input.is_key_pressed(KEY_DOWN) && downscore == false:
		print("Missed!")

func _on_transparent_blue_arrow_down_area_entered(area):
	downscore = true

func _on_transparent_blue_arrow_down_area_exited(area):
	downscore = false
