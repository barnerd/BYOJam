class_name Player
extends Node3D


func move(target_location: Vector3) -> void:
	print("move to %v" % target_location)
	print("before %v" % position)
	set_position(target_location)
	print("after %v" % position)
