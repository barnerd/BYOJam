extends State

@export var turn_start_state: State
@export var win_state: State
@export var lose_state: State

@export var player: Player
@export var board: GameBoard

var num_spaces_left: int = 0


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	player.turns_taken += 1
	
	await get_tree().create_timer(2.0).timeout
	
	if player.laps >= 1:
		finished.emit(win_state)
	elif player.turns_taken >= 5:
		finished.emit(lose_state)
	else:
		finished.emit(turn_start_state)
