@tool
extends MarginContainer

@export var label_text: String
@export var signal_name: String

var time_elapsed: float = 0
var current_rotation: int = 1
var current_value: float

@onready var arrow: TextureRect = $VBoxContainer/Background/Arrow


func _ready() -> void:
	$VBoxContainer/Label.text = label_text
	
	if not Engine.is_editor_hint():
		SignalBus.connect_to_signal(signal_name, set_value)
		
	start_new_tween()


#func _process(delta: float) -> void:
	#time_elapsed += delta / 10
	#set_value(time_elapsed - floorf(time_elapsed))


func set_value(_value: float) -> void:
	current_value = clampf(_value, 0.0, 1.0)


func start_new_tween() -> void:
	current_rotation *= -1
	var tween = get_tree().create_tween()
	# " - .2 * PI" because of slice of arrow. remove with actual image
	tween.tween_property(arrow, "rotation", current_rotation * randf_range(PI / 200.0, PI / 100.0) + current_value * PI - .2 * PI, randf_range(0.25, 0.5))
	tween.set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_OUT)
	tween.tween_callback(start_new_tween)
