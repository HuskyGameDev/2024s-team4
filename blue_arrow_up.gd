extends Area2D

@onready var path_follow: PathFollow2D = get_parent()
@export var speed = 100
var upscore = 0

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() +(speed * delta))

func _on_transparent_blue_arrow_up_area_entered(area):
	upscore += 1

func _input(event):
	if Input.is_key_pressed(KEY_UP) && upscore >= 1:
		print("Got it! Ups: ", upscore)
		queue_free()
	if Input.is_key_pressed(KEY_UP) && upscore <= 0:
		print("Missed!")
