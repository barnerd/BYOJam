class_name GameBoard
extends Node3D

signal board_fear_max
signal board_fear_changed(num: int, max: int)
signal board_fear_percent_changed(percent: float)

const SPACE_TYPE_MATERIALS: Dictionary = {
	TileSpace.TileType.FOOD: preload("res://ArtAssets/Materials/gameboard/food_green_mat.tres") as StandardMaterial3D,
	TileSpace.TileType.FEAR: preload("res://ArtAssets/Materials/gameboard/fear_yellow_mat.tres") as StandardMaterial3D,
	TileSpace.TileType.UPGRADE: preload("res://ArtAssets/Materials/gameboard/upgrade_blue_mat.tres") as StandardMaterial3D,
	TileSpace.TileType.DESTROYED: preload("res://ArtAssets/Materials/gameboard/destroyed_red_mat.tres") as StandardMaterial3D,
}

@export var board_spaces: Array[TileSpace]

@export var max_fear: int
@export var starting_fear: int
@export var starting_max_fear_bonus: int

@export var fear_per_turn: int

var current_fear: int
var current_max_fear_bonus: int


func _init() -> void:
	SignalBus.register_signal("board_fear_max", board_fear_max)
	SignalBus.register_signal("board_fear_changed", board_fear_changed)
	SignalBus.register_signal("board_fear_percent_changed", board_fear_percent_changed)


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)
	SignalBus.connect_to_signal("turn_taken", on_turn_taken)
	SignalBus.connect_to_signal("story_variable_changed", on_story_variable_changed)
	SignalBus.connect_to_signal("pet_hunger_starving", on_pet_starved)


func game_reset() -> void:
	current_fear = starting_fear
	current_max_fear_bonus = starting_max_fear_bonus
	board_fear_changed.emit(current_fear, max_fear + current_max_fear_bonus)
	board_fear_percent_changed.emit(current_fear / float(max_fear + current_max_fear_bonus))
	
	for space in board_spaces:
		space.set_type_material(SPACE_TYPE_MATERIALS[space.current_type])


func get_space_location(num: int) -> Vector3:
	return board_spaces[num].global_position


func on_story_variable_changed(variable_name: String, delta: float) -> void:
	if variable_name == "fear":
		change_fear(int(delta))


func on_lap_completed(_lap: int) -> void:
	current_fear = 0
	board_fear_changed.emit(current_fear, max_fear + current_max_fear_bonus)
	board_fear_percent_changed.emit(current_fear / float(max_fear + current_max_fear_bonus))


func on_turn_taken(_turns: int) -> void:
	change_fear(fear_per_turn)


func change_fear(_delta: int) -> void:
	current_fear += _delta
	
	if current_fear >= (max_fear + current_max_fear_bonus):
		current_fear = (max_fear + current_max_fear_bonus)
		current_fear = 0
		board_fear_max.emit()
		destroy_tile(randi_range(0, board_spaces.size() - 1))
	
	board_fear_changed.emit(current_fear, max_fear + current_max_fear_bonus)
	board_fear_percent_changed.emit(current_fear / float(max_fear + current_max_fear_bonus))


func on_pet_starved() -> void:
	destroy_tile(randi_range(0, board_spaces.size() - 1))


func destroy_tile(_space: int) -> void:
	board_spaces[_space].destroy_tile(SPACE_TYPE_MATERIALS[TileSpace.TileType.DESTROYED])


func perform_passing_effect(_space: int, _player: Player) -> void:
	if _space >= 0 and _space < board_spaces.size():
		board_spaces[_space].perform_passing_effect(_player)


func perform_landing_effect(_space: int, _player: Player) -> void:
	if _space >= 0 and _space < board_spaces.size():
		board_spaces[_space].perform_landing_effect(_player)
