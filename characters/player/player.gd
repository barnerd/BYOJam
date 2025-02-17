class_name Player
extends Node3D

var game_space: int = 0
var laps: int = 0
var turns_taken: int = 0


func move_to_space(target_location: Vector3) -> void:
	set_position(target_location)
