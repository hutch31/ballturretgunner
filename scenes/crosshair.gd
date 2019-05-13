extends Area2D

export var MOVE_AMOUNT = 100.0
var movement = Vector2()
signal shoot
const SCREEN_X = 1024
const SCREEN_Y = 768
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	movement.x = 0
	movement.y = 0
	
	if Input.is_action_pressed("ui_up"):
		movement.y = -1
	elif Input.is_action_pressed("ui_down"):
		movement.y = 1
	if Input.is_action_pressed("ui_left"):
		movement.x = -1
	elif Input.is_action_pressed("ui_right"):
		movement.x = 1
		
	if Input.is_action_pressed("ui_select") and can_shoot:
		print("dbg: shoot")
		emit_signal("shoot")
		can_shoot = false
		$gun_timer.start()

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += movement * delta * MOVE_AMOUNT
	
	# Set max limits on traverse
	if position.x < -SCREEN_X/2:
		position.x = -SCREEN_X/2
	elif position.x > 1.5*SCREEN_X:
		position.x = 1.5*SCREEN_X
	if position.y < -SCREEN_Y/2:
		position.y = -SCREEN_Y/2
	elif position.y > 1.5*SCREEN_Y:
		position.y = 1.5*SCREEN_Y


func _on_Timer_timeout():
	can_shoot = true
