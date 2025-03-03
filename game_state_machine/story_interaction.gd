extends State

@export var player_move_state: State
@export var turn_end_state: State
@export var dialogue_screen: Dialogue

var move_player: bool
var num_spaces: int


func _ready() -> void:
	SignalBus.connect_to_signal("story_moves_player", story_moves_player)


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	dialogue_screen.visible = true
	move_player = false
	num_spaces = 0
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	if _data.has("space_num"):
		# Pull knot name from TileSpace
		var story_knot: String = GameAutoload.board.get_story_knot(_data.space_num)
		if GameAutoload.board.is_tile_destroyed(_data.space_num):
			story_knot = story_knot + "_destroyed"
		dialogue_screen.start_knot(story_knot)
		# space_4_destroyed
	else:
		print("TODO: story space to play not found; not sure what to do here")


func exit() -> void:
	dialogue_screen.story_section_complete.disconnect(_on_section_complete)
	dialogue_screen.visible = false


func story_moves_player(_num: int) -> void:
	move_player = true
	num_spaces = _num


func _on_section_complete() -> void:
	if move_player:
		finished.emit(player_move_state, { "num_spaces": num_spaces, "story_push": true })
	else:
		finished.emit(turn_end_state)
