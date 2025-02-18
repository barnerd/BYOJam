extends State

@export var player_move_state: State
@export var turn_end_state: State
@export var dialogue_screen: Dialogue

var move_player: bool
var num_spaces: int


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	SignalBus.connect_to_signal("story_moves_player", story_moves_player)

	dialogue_screen.visible = true
	
	if not dialogue_screen.story_section_complete.is_connected(_on_section_complete):
		dialogue_screen.story_section_complete.connect(_on_section_complete)
	
	print(_data)
	
	if _data.has("space_num"):
		dialogue_screen.start_knot("space%d" % _data.space_num)
	else:
		dialogue_screen.start_knot("space0")


func story_moves_player(_num: int) -> void:
	move_player = true
	num_spaces = _num


func _on_section_complete() -> void:
	if move_player:
		finished.emit(player_move_state, { "num_spaces": num_spaces })
	else:
		finished.emit(turn_end_state)


func exit() -> void:
	dialogue_screen.visible = false
