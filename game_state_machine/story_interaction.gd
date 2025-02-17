extends State

@export var turn_end_state: State
@export var dialogue_screen: Dialogue


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	dialogue_screen.visible = true
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	dialogue_screen.start_knot("murder_scene")


func _on_section_complete() -> void:
	finished.emit(turn_end_state)


func exit() -> void:
	dialogue_screen.visible = false
