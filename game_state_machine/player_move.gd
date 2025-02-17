extends State

@export var story_interaction_state: State
@export var player: Player
@export var board: GameBoard

var num_spaces_left: int = 0


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	if data.has("dice_roll"):
		num_spaces_left = data.dice_roll
	
	while num_spaces_left > 0:
		num_spaces_left -= 1
		player.game_space += 1
		
		if player.game_space >= board.board_spaces.size():
			player.laps += 1
			print("laps: %d" % player.laps)
			player.game_space -= board.board_spaces.size()
		
		player.move_to_space(board.get_space_location(player.game_space))
		# check squares for "passing" effects
		
		# rotate on corners
		
		await get_tree().create_timer(1.0).timeout
	
	finished.emit(story_interaction_state)
