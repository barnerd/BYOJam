class_name DialogueChoiceButton
extends PanelContainer

var on_pressed_callable: Callable

@onready var text: RichTextLabel = $MarginContainer/Button/OptionText


func update_text(_text: String) -> void:
	text.text = _text


func connect_to_button_signal(_call: Callable) -> void:
	on_pressed_callable = _call


func _on_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			on_pressed_callable.call()
