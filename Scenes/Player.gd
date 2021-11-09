extends KinematicBody2D

const gravity = 300
const max_x_speed = 100
const max_jump_speed = 150

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.

func _process(delta):
	var move_vec = Vector2.ZERO
	
#	If right its positive, if left, negative. Outcome of this will decide the direction
	move_vec.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	move_vec.y = -1 if Input.is_action_just_pressed("jump") else 0
	
	if(move_vec.y < 0 && is_on_floor()):
		velocity.y = move_vec.y  * max_jump_speed		
	velocity.x = move_vec.x * max_x_speed	
	
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
