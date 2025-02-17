extends State

@export var story_interaction_state: State
@export var player: Player

var num_spaces_left: int = 0


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	if data.has("dice_roll"):
		num_spaces_left = data.dice_roll
	
	while num_spaces_left > 0:
		num_spaces_left -= 1
		player.move_to_next_space()
		
		# check squares for "passing" effects
		
		# rotate on corners
		
		await get_tree().create_timer(1.0).timeout
	
	finished.emit(story_interaction_state)
