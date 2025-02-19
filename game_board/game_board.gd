class_name GameBoard
extends Node3D

signal board_fear_max
signal board_fear_changed(num: int)

@export var board_spaces: Array[Node3D]

@export var max_fear: int
@export var starting_fear: int
@export var starting_max_fear_bonus: int

var current_fear: int
var current_max_fear_bonus: int


func _init() -> void:
	SignalBus.register_signal("board_fear_max", board_fear_max)
	SignalBus.register_signal("board_fear_changed", board_fear_changed)


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)
	SignalBus.connect_to_signal("turn_taken", on_turn_taken)
	SignalBus.connect_to_signal("story_variable_changed", on_story_variable_changed)
	SignalBus.connect_to_signal("pet_hunger_starving", on_pet_starved)


func game_reset() -> void:
	current_fear = starting_fear
	current_max_fear_bonus = starting_max_fear_bonus
	board_fear_changed.emit(current_fear)


func get_space_location(num: int) -> Vector3:
	return board_spaces[num].global_position


func on_story_variable_changed(variable_name: String, delta: float) -> void:
	if variable_name == "fear":
		change_fear(delta)


func on_lap_completed(_lap: int) -> void:
	current_fear = 0
	board_fear_changed.emit(current_fear)


func on_turn_taken(_turns: int) -> void:
	change_fear(1)


func change_fear(_delta: int) -> void:
	var prev_fear = current_fear
	
	current_fear += _delta
	board_fear_changed.emit(current_fear)
	
	if current_fear >= (max_fear + current_max_fear_bonus):
		current_fear = (max_fear + current_max_fear_bonus)
		board_fear_max.emit()
		destroy_tile(randi_range(0, board_spaces.size() - 1))


func on_pet_starved() -> void:
	destroy_tile(randi_range(0, board_spaces.size() - 1))


func destroy_tile(_space: int) -> void:
	print("Destroy tile #%d" % _space)
