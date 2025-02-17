extends State

@export var game_start_state: State
@export var player: Player


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	# move player to start
	player.game_reset()
	
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_start_state)
