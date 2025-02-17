extends State

@export var player_move_state: State
@export var dice_pool: DicePool


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	# show dice pool
	dice_pool.visible = true
	
	dice_pool.dice_rolled.connect(on_dice_rolled)


func exit() -> void:
	# TODO: Should I pass dice_pool and hide it after moving?
	await get_tree().create_timer(2.0).timeout
	
	dice_pool.visible = false


func on_dice_rolled(value: int) -> void:
	finished.emit(player_move_state, { "dice_roll": value })
