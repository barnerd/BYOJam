extends State

@export var dice_roll_state: State


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	#await get_tree().create_timer(2.0).timeout
	
	finished.emit(dice_roll_state)
