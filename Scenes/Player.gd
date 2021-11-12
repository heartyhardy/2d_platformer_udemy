# Always go for tight jump and move speeds
# 2-3 frames of acceleration is enough
# Best thing to do when jump is floaty, dramatically increase Gravity and Jump Speed
# Use frame rate independant lerping
# Jump should be around 3 tiles of height
# To obtain variable jump, increase gravity by a jump multiplier

extends KinematicBody2D

const gravity = 1100
const max_x_speed = 140
const max_x_acceleration = 2000
const max_jump_speed = 380
const jump_multiplier = 4

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
		
	velocity.x += move_vec.x * max_x_acceleration * delta
	if(move_vec.x == 0):
		velocity.x = lerp(0, velocity.x, pow(2, -50 * delta))
		
	velocity.x = clamp(velocity.x, -max_x_speed, max_x_speed)

	if(velocity.y < 0 && !Input.is_action_pressed("jump")):
		velocity.y += gravity * jump_multiplier * delta
	else:
		velocity.y += gravity * delta

	velocity = move_and_slide(velocity, Vector2.UP)

