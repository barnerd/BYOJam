@tool
extends Node2D

@export var signal_name: String

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
	current_rotation *= -1
	var tween = get_tree().create_tween()
	# " - .2 * PI" because of slice of arrow. remove with actual image
	var random_rotation = current_rotation
	random_rotation *= randf_range(0.5, 1.0) * PI / 100# * 4 * current_value
	random_rotation += current_value * PI - 0.5 * PI
	var random_time = randf_range(0.25, 0.5)# + 0.25 * current_value
	tween.tween_property(arrow, "rotation", random_rotation, random_time)
	tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(start_new_tween)
