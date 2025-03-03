extends State

signal game_reset

@export var game_start_state: State


func _init() -> void:
	SignalBus.register_signal("game_reset", game_reset)


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	if not StoryManager.is_story_loaded:
		await StoryManager.ink_player.loaded
	game_reset.emit()
	
	#await get_tree().create_timer(2.0).timeout
	
	finished.emit(game_start_state)
