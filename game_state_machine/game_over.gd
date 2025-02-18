extends State

@export var load_state: State
@export var restart_game_button: Control


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	restart_game_button.visible = true
	
	restart_game_button.connect_button(on_restart_game_request)


func exit() -> void:
	restart_game_button.visible = false


func on_restart_game_request() -> void:
	finished.emit(load_state)
