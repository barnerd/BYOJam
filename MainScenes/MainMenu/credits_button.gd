extends TextureButton

@onready var credits_window: PackedScene = preload("res://MainScenes/Credits/credits_window.tscn")
@onready var credits_pane: PanelContainer = $"../PanelContainer"
var is_visible: bool = false


func _on_settings_button_pressed() -> void:
	is_visible = !is_visible
	credits_pane.visible = is_visible
