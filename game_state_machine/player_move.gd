extends State

@export var story_interaction_state: State
@export var player: Player
@export var board: GameBoard

var num_spaces_left: int = 0
var backwards: bool


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	if _data.has("num_spaces"):
		num_spaces_left = _data.num_spaces
	
	backwards = num_spaces_left < 0
	num_spaces_left = abs(num_spaces_left)
	
	while num_spaces_left > 0:
		num_spaces_left -= 1
		player.move_to_next_space(backwards)
		
		if not (_data.has("story_push") and _data.story_push):
			board.perform_passing_effect(player.current_game_space, player)
		
		# rotate on corners
		
		await get_tree().create_timer(1.0).timeout
	
	board.perform_landing_effect(player.current_game_space, player)
	
	finished.emit(story_interaction_state, { "space_num": player.current_game_space })
