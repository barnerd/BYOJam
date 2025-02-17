extends State

@export var game_start_state: State
@export var player: Player
@export var board: GameBoard


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	player.move(board.get_space_location(0))
	
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_start_state)
