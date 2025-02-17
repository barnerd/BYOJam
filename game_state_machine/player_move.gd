extends State

@export var story_interaction_state: State


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	if data.has("dice_roll"):
		print(data.dice_roll)


func exit() -> void:
	pass
