class_name GameBoard
extends Node3D

signal board_fear_max
signal board_fear_changed(num: int)

@export var board_spaces: Array[Node3D]

@export var max_fear_threshold: int
@export var starting_fear: int
var current_fear: int


func _init() -> void:
	SignalBus.register_signal("board_fear_max", board_fear_max)
	SignalBus.register_signal("board_fear_changed", board_fear_changed)


func game_reset() -> void:
	current_fear = starting_fear
	board_fear_changed.emit(current_fear)


func get_space_location(num: int) -> Vector3:
	return board_spaces[num].global_position


func change_fear(_delta: int) -> void:
	var prev_fear = current_fear
	
	current_fear += _delta
	board_fear_changed.emit(current_fear)
	
	if (prev_fear < max_fear_threshold and 
	current_fear > max_fear_threshold):
		board_fear_max.emit()
