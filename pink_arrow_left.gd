extends Area2D

@onready var path_follow: PathFollow2D = get_parent()
@export var speed = 300
var leftscore = 0

func _physics_process(delta):
	path_follow.set_progress(path_follow.get_progress() +(speed * delta))

func _input(event):
	if Input.is_key_pressed(KEY_LEFT) && leftscore >= 1:
		print("Got it! Lefts: ", leftscore)
		queue_free()
	if Input.is_key_pressed(KEY_LEFT) && leftscore <= 0:
		print("Missed!")

func _on_transparent_pink_arrow_left_area_entered(area):
	leftscore += 1
