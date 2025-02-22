extends State

@export var player_move_state: State
@export var dice_pool: DicePool


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	# show dice pool
	dice_pool.reset()
	dice_pool.visible = true
	
	if not dice_pool.dice_rolled.is_connected(on_dice_rolled):
		dice_pool.dice_rolled.connect(on_dice_rolled)


func exit() -> void:
	# TODO: Should I pass dice_pool and hide it after moving?
	await get_tree().create_timer(2.0).timeout
	
	#dice_pool.visible = false


func on_dice_rolled(value: int) -> void:
	finished.emit(player_move_state, { "num_spaces": value })
