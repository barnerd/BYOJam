extends Node2D

enum TILT {LEFT=0, NONE=1, RIGHT=2}
var tilt_to_string: Dictionary = {
	TILT.LEFT: "left",
	TILT.NONE: "none",
	TILT.RIGHT: "right",
}

var last_pip: int = 1
var last_tilt: int = int(TILT.NONE)

var wait_time: float = 0.1

@onready var dice_image: Sprite2D = $GFX


func _ready() -> void:
	roll_dice()


func roll_dice() -> void:
	var next_pip = randi_range(0, 2)
	var next_tilt = randi_range(0, 2)
	
	if next_pip == last_pip:
		next_pip = (next_pip + 1) % 3
	if next_tilt == last_tilt:
		next_tilt = (next_tilt + 1) % 3
	
	last_pip = next_pip
	last_tilt = next_tilt
	
	dice_image.texture = load("res://ArtAssets/2D Art/Dice/%d-%s.PNG" % [next_pip + 1, tilt_to_string[next_tilt]])
	await get_tree().create_timer(wait_time).timeout
	wait_time += wait_time * wait_time * randf()
	print(wait_time)
	if wait_time < 1:
		roll_dice()
	else:
		print("done. rolled a %d" % (last_pip + 1))
	
