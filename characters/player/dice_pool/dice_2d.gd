class_name Dice2D
extends PanelContainer

signal on_select_signal(value: int)

enum TILT {LEFT=0, NONE=1, RIGHT=2}
var tilt_to_string: Dictionary = {
	TILT.LEFT: "left",
	TILT.NONE: "none",
	TILT.RIGHT: "right",
}

var last_pip: int = 1
var last_tilt: int = int(TILT.NONE)

var roll_value: int
var is_hover: bool = false
var is_rolled: bool = false

var wait_time: float = 0.1

@onready var dice_image: TextureRect = $GFX


func roll_dice() -> void:
	is_rolled = false
	wait_time = 0.1
	roll_animation()


func roll_animation() -> void:
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
	if wait_time < 0.5:
		roll_animation()
	else:
		roll_complete()


func roll_complete() -> void:
	is_rolled = true
	
	roll_value = last_pip + 1


func _on_mouse_entered() -> void:
	if is_rolled:
		is_hover = true
		self.theme_type_variation = StringName("DiceHighlight")


func _on_mouse_exited() -> void:
	if is_rolled:
		is_hover = false
		self.theme_type_variation = StringName("Dice")


func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and is_rolled:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			is_hover = false
			self.theme_type_variation = StringName("Dice")
			on_select_signal.emit(roll_value)
