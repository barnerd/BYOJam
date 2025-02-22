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
		dialogue_screen.start_knot("space_%d" % (_data.space_num + 1))
	else:
		dialogue_screen.start_knot("space_1")


func story_moves_player(_num: int) -> void:
	move_player = true
	num_spaces = _num


func _on_section_complete() -> void:
	if move_player:
		finished.emit(player_move_state, { "num_spaces": num_spaces, "story_push": true })
	else:
		finished.emit(turn_end_state)


func exit() -> void:
	dialogue_screen.visible = false
