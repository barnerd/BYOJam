extends PanelContainer

@onready var restart_button: Button = $MarginContainer/Button


func connect_button(_callable: Callable) -> void:
	if not restart_button.pressed.is_connected(_callable):
		restart_button.pressed.connect(_callable)
