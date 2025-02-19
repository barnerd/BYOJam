extends State

@export var story_interaction_state: State
@export var player: Player

var num_spaces_left: int = 0


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	if _data.has("num_spaces"):
		num_spaces_left = _data.num_spaces
	
	while num_spaces_left > 0:
		num_spaces_left -= 1
		player.move_to_next_space()
		
		# check squares for "passing" effects
		
		# rotate on corners
		
		await get_tree().create_timer(1.0).timeout
	
	finished.emit(story_interaction_state, { "space_num": player.current_game_space })
