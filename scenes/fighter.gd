extends Area2D

export var speed = 200.0
const SCREEN_X = 1024
var direction = Vector2(1.0, 0.0)
var in_crosshair = false
var explosion = preload("res://scenes/explosion.tscn")
signal score

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * delta * speed
	
	# Set plane to fly back and forth
	if position.x < -(SCREEN_X/2):
		direction.x = 1.0
		$Sprite.flip_h = false
	elif position.x > SCREEN_X * 1.5:
		$Sprite.flip_h = true
		direction.x = -1.00


func _on_fighter_area_entered(area):
	if area.is_in_group("crosshair"):
		in_crosshair = true

func _on_fighter_area_exited(area):
	if area.is_in_group("crosshair"):
		in_crosshair = false

func _signal_shoot():
	if in_crosshair:
		var explosion_instance = explosion.instance()
		explosion_instance.position = position
		$"..".add_child(explosion_instance)
		emit_signal("score")
		queue_free()
		