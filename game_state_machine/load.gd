extends State

@export var game_start_state: State
@export var player: Player
@export var board: GameBoard


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	# move player to start
	player.game_space = 0
	player.move_to_space(board.get_space_location(0))
	player.laps = 0
	player.turns_taken = 0
	
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_start_state)
