extends Node2D

const SCREEN_X = 1024
const SCREEN_Y = 768

var player_score = 0
var fighter = preload("res://scenes/fighter.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$crosshair.connect("shoot", self, "_signal_shoot")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _signal_shoot():
	print("Dbg: signal_shoot")
	$mgsound.play()

func _on_spawn_timer_timeout():
	var fighter_instance = fighter.instance()
	fighter_instance.position = Vector2(rand_range(0, SCREEN_X), rand_range(0, SCREEN_Y))
	add_child(fighter_instance)
	$crosshair.connect("shoot", fighter_instance, "_signal_shoot")
	fighter_instance.connect("score", self, "_on_score")
	$spawn_timer.start()

func _on_score():
	player_score += 1
	$ui/score.text = "Score: " + str(player_score)
	