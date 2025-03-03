extends State

@export var turn_start_state: State
@export var game_start_splash: Control
@export var dialogue_screen: Dialogue


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	# show game start splash
	#game_start_splash.visible = true
	
	#await get_tree().create_timer(2.0).timeout
	
	dialogue_screen.visible = true
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	dialogue_screen.start_knot("game_intro")


func exit() -> void:
	dialogue_screen.story_section_complete.disconnect(_on_section_complete)
	game_start_splash.visible = false
	dialogue_screen.visible = false


func _on_section_complete() -> void:
	finished.emit(turn_start_state)
