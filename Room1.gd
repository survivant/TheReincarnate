extends Node2D

var player
var motion
var velocity
var jumping = false

const GRAVITY = 32
const MOVE_SPEED = 200
var LEFT = Vector2(-MOVE_SPEED, 0)
var RIGHT = Vector2(MOVE_SPEED, 0)
var STILL = Vector2(0, 0)

func _ready():
	player = get_node("KinematicBody2D")
	velocity = STILL
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity = LEFT
	elif Input.is_action_pressed("ui_right"):
		velocity = RIGHT
	else:
		velocity = STILL
	
	if Input.is_action_pressed("jump") and !jumping:
		# Add the jump velocity!
		velocity.y = -GRAVITY
		jumping = true
	
	player.move(velocity * delta)