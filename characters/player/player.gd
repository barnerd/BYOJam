class_name Player
extends Node3D

signal lap_completed(laps: int)
signal player_moved(space: int)
signal turn_taken(turns: int)

var current_game_space: int = 0
var laps: int = 0
var turns_taken: int = 0

@onready var board: GameBoard = $"../GameBoard"
@onready var pet: Pet = $Pet
@onready var animation_player: AnimationPlayer = $bluey/AnimationPlayer

@export var position_offset: Vector3

func _init() -> void:
	SignalBus.register_signal("lap_completed", lap_completed)
	SignalBus.register_signal("player_moved", player_moved)
	SignalBus.register_signal("turn_taken", turn_taken)
	
	GameAutoload.player = self


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)
	
	animation_player.play("idle")


func game_reset() -> void:
	laps = 0
	turns_taken = 0
	move_to_space(0, false)


func move_to_space(target_space: int, use_signal: bool = true) -> void:
	current_game_space = target_space
	
	if current_game_space >= board.board_spaces.size():
		laps += 1
		
		lap_completed.emit(laps)
		current_game_space -= board.board_spaces.size()
	
	# TODO: Check for negative space, if moving backwards
	
	if use_signal:
		player_moved.emit(current_game_space)
	
	var target_position = board.get_space_location(current_game_space)
	
	var move_tween = get_tree().create_tween()
	move_tween.tween_property(self, "position", target_position + position_offset, 1.5 if use_signal else 0.1)
	
	await move_tween.finished


func move_to_next_space(backwards: bool = false) -> void:
	await move_to_space(current_game_space + (1 if not backwards else -1))


func turn_corner() -> void:
	rotate_y(-PI / 2)
	position_offset = position_offset.rotated(Vector3.UP, -PI / 2)


func finish_turn() -> void:
	turns_taken += 1
	turn_taken.emit(turns_taken)
