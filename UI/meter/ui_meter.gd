@tool
extends Node2D

@export var signal_name: String
@export var is_right_high: bool = true

var time_elapsed: float = 0
var current_rotation: int = 1
var current_value: float

@onready var arrow: Sprite2D = $Background/Arrow


func _ready() -> void:
	if not Engine.is_editor_hint():
		SignalBus.connect_to_signal(signal_name, set_value)
		
		start_new_tween()


func set_value(_value: float) -> void:
	current_value = clampf(_value, 0.0, 1.0)

func start_new_tween() -> void:
	var current_impulse = current_value if is_right_high else (1 - current_value)
	# flip direction
	current_rotation *= -1
	var random_rotation = current_rotation * (current_impulse + randf_range(1.0, 2.0)) * PI / 100
	random_rotation += current_value * PI - 0.5 * PI
	var random_time = -0.65 * current_impulse + randf_range(0.75, 1.0)
	
	var tween = get_tree().create_tween()
	tween.tween_property(arrow, "rotation", random_rotation, random_time)
	tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(start_new_tween)
