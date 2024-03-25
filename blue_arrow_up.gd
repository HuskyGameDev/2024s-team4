extends Area2D

@onready var path_follow: PathFollow2D = get_parent()
@export var speed = 300
var upscore = false

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() +(speed * delta))

func _input(event):
	if Input.is_key_pressed(KEY_UP) && upscore == true:
		print("Ok!")
		queue_free()
	if Input.is_key_pressed(KEY_UP) && upscore == false:
		print("Missed!")

func _on_transparent_blue_arrow_up_area_entered(area):
	if area.is_in_group("HitArea"):
		upscore = true

func _on_transparent_blue_arrow_up_area_exited(area):
	if area.is_in_group("HitArea"):
		upscore = false
