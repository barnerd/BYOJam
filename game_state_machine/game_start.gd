extends State

@export var turn_start_state: State
@export var game_start_splash: Control


func enter(previous_state: Node, data: Dictionary = {}) -> void:
	# show game start splash
	game_start_splash.visible = true
	
	await get_tree().create_timer(2.0).timeout
	
	finished.emit(turn_start_state)


func exit() -> void:
	game_start_splash.visible = false
