extends State

@export var game_over_state: State


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	print("lose!")
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_over_state)
