extends CharacterBody2D


var speed: float = 2000
var acceleration: float = 20000
var friction: float = speed/acceleration

func _process(delta: float) -> void:
	apply_traction(delta)
	apply_friction(delta)
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
func apply_traction(delta: float) -> void:
	
	var traction = Vector2()
	
	if Input.is_action_pressed("up"):
		traction.y -=1
	if Input.is_action_pressed("down"):
		traction.y +=1
	if Input.is_action_pressed("left"):
		traction.x -=1
	if Input.is_action_pressed("right"):
		traction.x +=1
	traction = traction.normalized()
	velocity = traction * acceleration * delta
	
func apply_friction(delta: float) -> void:
	velocity -= velocity*friction*delta
	
	
	
