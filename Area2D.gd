extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$sprite.play()
	$exp_sound.play()


func _on_exptime_timeout():
	queue_free()
