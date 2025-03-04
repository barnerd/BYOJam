extends State

@export var story_interaction_state: State

var num_spaces_left: int = 0
var backwards: bool
var is_story_push: bool = false
var is_moving: bool = false


func _ready() -> void:
	SignalBus.connect_to_signal("board_fear_max", on_fear_crisis)
	SignalBus.connect_to_signal("pet_hunger_starving", on_hunger_crisis)
	SignalBus.connect_to_signal("pet_morphed", on_pet_morphed)


func enter(_previous_state: Node, _data: Dictionary = {}) -> void:
	is_moving = false
	if _data.has("num_spaces"):
		num_spaces_left = _data.num_spaces
	
	backwards = num_spaces_left < 0
	num_spaces_left = abs(num_spaces_left)
	if _data.has("story_push"):
		is_story_push = _data.story_push
	else:
		is_story_push = false
	
	move_spaces()


func move_spaces() -> void:
	is_moving = true
	GameAutoload.player.animation_player.play("move")
	GameAutoload.player.pet.play_animation("move")
	
	while num_spaces_left > 0:
		num_spaces_left -= 1
		await GameAutoload.player.move_to_next_space(backwards)
		
		if GameAutoload.board.CORNER_SPACES.has(GameAutoload.player.current_game_space):
			GameAutoload.player.turn_corner()

		if not is_story_push:
			GameAutoload.board.perform_passing_effect(GameAutoload.player.current_game_space, GameAutoload.player)
		
		await get_tree().create_timer(0.3).timeout
	
	GameAutoload.player.animation_player.play("idle")
	GameAutoload.player.pet.play_animation("idle")
	
	GameAutoload.board.perform_landing_effect(GameAutoload.player.current_game_space, GameAutoload.player)
	
	is_moving = false
	finished.emit(story_interaction_state, { "space_num": GameAutoload.player.current_game_space })


func on_fear_crisis() -> void:
	if is_moving:
		print("moving and fear happened")


func on_hunger_crisis() -> void:
	if is_moving:
		print("moving and hunger happened")


func on_pet_morphed() -> void:
	if is_moving:
		print("moving and morph happened")
