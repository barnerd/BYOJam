extends State

@export var turn_start_state: State
@export var win_state: State
@export var lose_state: State
@export var game_over: State

var num_spaces_left: int = 0


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	GameAutoload.player.finish_turn()
	
	#await get_tree().create_timer(2.0).timeout
	
	# TODO: put win and lose conditions here
	if GameAutoload.player.laps >= 10:
		finished.emit(game_over)
		#finished.emit(win_state)
	#elif player.turns_taken >= 5:
		#finished.emit(lose_state)
	else:
		finished.emit(turn_start_state)
