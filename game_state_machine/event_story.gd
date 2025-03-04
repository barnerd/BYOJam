extends State

@export var dialogue_screen: Dialogue

var next_state: State
var next_data: Dictionary = {}


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	dialogue_screen.visible = true
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	var knot_to_play: String
	
	if _data.has("event_knot"):
		knot_to_play = _data.event_knot
	else:
		push_warning("There is no special story knot")
	
	if _data.has("next_state"):
		next_state = _data.next_state
	else:
		push_warning("Event Story doesn't know where to go next")
	
	if _data.has("next_data"):
		next_data = _data.next_data
	
	dialogue_screen.start_knot(knot_to_play)


func exit() -> void:
	dialogue_screen.story_section_complete.disconnect(_on_section_complete)
	dialogue_screen.visible = false


func _on_section_complete() -> void:
	finished.emit(next_state, next_data)
