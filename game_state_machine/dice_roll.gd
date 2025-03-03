extends State

@export var player_move_state: State
@export var dice_pool: DicePool


func _ready() -> void:
	dice_pool.dice_selected.connect(on_dice_selected)


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	# show dice pool
	dice_pool.ready_to_roll()


func on_dice_selected(value: int) -> void:
	await get_tree().create_timer(0.75).timeout
	finished.emit(player_move_state, { "num_spaces": value })
