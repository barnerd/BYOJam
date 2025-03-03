extends State

@export var load_state: State
@export var restart_game_button: Control
@export var dialogue_screen: Dialogue


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	#restart_game_button.visible = true
	
	#restart_game_button.connect_button(on_restart_game_request)
	
	dialogue_screen.visible = true
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	dialogue_screen.start_knot("game_over")


func exit() -> void:
	#restart_game_button.visible = false
	
	dialogue_screen.story_section_complete.disconnect(_on_section_complete)
	dialogue_screen.visible = false


func on_restart_game_request() -> void:
	finished.emit(load_state)


func _on_section_complete() -> void:
	finished.emit(load_state)
