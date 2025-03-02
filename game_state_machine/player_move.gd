extends State

@export var story_interaction_state: State

var num_spaces_left: int = 0
var backwards: bool


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	if _data.has("num_spaces"):
		num_spaces_left = _data.num_spaces
	
	backwards = num_spaces_left < 0
	num_spaces_left = abs(num_spaces_left)
	
	while num_spaces_left > 0:
		# TODO: set player moving animation
		num_spaces_left -= 1
		GameAutoload.player.move_to_next_space(backwards)
		
		if not (_data.has("story_push") and _data.story_push):
			GameAutoload.board.perform_passing_effect(GameAutoload.player.current_game_space, GameAutoload.player)
		
		# rotate on corners
		
		await get_tree().create_timer(0.8).timeout
	# TODO: set player idle animation
	
	GameAutoload.board.perform_landing_effect(GameAutoload.player.current_game_space, GameAutoload.player)
	
	finished.emit(story_interaction_state, { "space_num": GameAutoload.player.current_game_space })
