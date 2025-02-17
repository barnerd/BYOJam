extends State

@export var turn_end_state: State


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(turn_end_state)
