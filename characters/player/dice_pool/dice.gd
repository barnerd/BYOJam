class_name Dice
extends PanelContainer

signal on_select_signal(value: int)

@export var roll_time: float
@export var dice_color: Color

var random_roll: Vector3i = Vector3i.ZERO

var min_roll: int = 0
var max_roll: int = 0

var roll_value: int
var is_hover: bool = false
var is_rolled: bool = false

@onready var dice_gfx: CSGBox3D = $SubViewportContainer/SubViewport/CSGBox3D
@onready var value_label: Label = $Label


func set_color(_color: Color) -> void:
	var mat = dice_gfx.material as StandardMaterial3D
	mat = mat.duplicate()
	dice_color = _color
	mat.albedo_color = dice_color
	dice_gfx.material = mat


func set_min_max(_min: int, _max: int) -> void:
	min_roll = _min
	max_roll = _max


func roll_dice() -> void:
	value_label.visible = false
	
	random_roll = Vector3i(randi_range(2, 4), randi_range(2, 4), randi_range(2, 4))
	
	var tween = get_tree().create_tween()
	tween.tween_property(dice_gfx, "rotation", random_roll * PI, roll_time * randf_range(0.75, 1.25)).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(roll_complete)


func roll_complete() -> void:
	is_rolled = true
	
	roll_value = randi_range(min_roll, max_roll)
	value_label.text = str(roll_value)
	value_label.visible = true


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
