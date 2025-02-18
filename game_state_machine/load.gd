extends State

@export var game_start_state: State
@export var board: GameBoard
@export var player: Player


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	await StoryManager.ink_player.loaded
	# move player to start
	player.game_reset()
	player.pet.game_reset()
	board.game_reset()
	
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_start_state)
