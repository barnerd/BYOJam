extends State

@export var player_move_state: State
@export var turn_end_state: State
@export var event_story_state: State
@export var dialogue_screen: Dialogue

var move_player: bool
var num_spaces: int

var has_event: bool = false
var event_knot: String


func _ready() -> void:
	SignalBus.connect_to_signal("story_moves_player", story_moves_player)
	
	SignalBus.connect_to_signal("crisis_occurred", on_crisis_occurred)
	SignalBus.connect_to_signal("pet_morphed", on_pet_morphed)


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	dialogue_screen.visible = true
	move_player = false
	num_spaces = 0
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	var knot_to_play: String
	
	if _data.has("space_num"):
		# Pull knot name from TileSpace
		var story_knot: String = GameAutoload.board.get_story_knot(_data.space_num)
		if GameAutoload.board.is_tile_destroyed(_data.space_num):
			story_knot = story_knot + "_destroyed"
		knot_to_play = story_knot
	else:
		print("TODO: story space to play not found; not sure what to do here")
		return
	
	dialogue_screen.start_knot(knot_to_play)


func exit() -> void:
	dialogue_screen.story_section_complete.disconnect(_on_section_complete)
	dialogue_screen.visible = false


func story_moves_player(_num: int) -> void:
	move_player = true
	num_spaces = _num


func _on_section_complete() -> void:
	if move_player:
		if has_event:
			var data: Dictionary = {}
			data.event_knot = event_knot
			data.next_state = player_move_state
			data.next_data = {}
			data.next_data.num_spaces = num_spaces
			data.next_data.story_push = true
			finished.emit(event_story_state, data)
			has_event = false
			event_knot = ""
		else:
			finished.emit(player_move_state, { "num_spaces": num_spaces, "story_push": true })
	else:
		if has_event:
			var data: Dictionary = {}
			data.event_knot = event_knot
			data.next_state = turn_end_state
			data.next_data = {}
			finished.emit(event_story_state, data)
			has_event = false
			event_knot = ""
		else:
			finished.emit(turn_end_state)


func on_crisis_occurred(type: String, space_knot: String) -> void:
	if has_event:
		print("another event is already queued up!")
	has_event = true
	event_knot = "%s_destoryed_by_%s" % [space_knot, type]


func on_pet_morphed(stage: String) -> void:
	if has_event:
		print("another event is already queued up!")
	has_event = true
	event_knot = "evolution_stage_%s" % stage
