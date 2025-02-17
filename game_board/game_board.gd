class_name GameBoard
extends Node3D

@export var board_spaces: Array[Node3D]


func get_space_location(num: int) -> Vector3:
	return board_spaces[num].position
