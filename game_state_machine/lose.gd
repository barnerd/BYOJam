extends State

@export var game_over_state: State


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	print("lose!")
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_over_state)
