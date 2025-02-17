class_name Player
extends Node3D

signal lap_completed(num: int)

var current_game_space: int = 0
var laps: int = 0
var turns_taken: int = 0

@onready var board = $"../GameBoard"
@onready var pet = $Pet


func _init() -> void:
	SignalBus.register_signal("lap_completed", lap_completed)


func game_reset() -> void:
	laps = 0
	turns_taken = 0
	move_to_space(0)


func move_to_space(target_space: int) -> void:
	current_game_space = target_space
	
	if current_game_space >= board.board_spaces.size():
		laps += 1
		lap_completed.emit(laps)
		current_game_space -= board.board_spaces.size()
	
	# TODO: Check for negative space, if moving backwards
	
	var target_position = board.get_space_location(current_game_space)
	set_position(target_position)


func move_to_next_space() -> void:
	move_to_space(current_game_space + 1)
