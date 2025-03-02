class_name Destructable
extends Node

@onready var rigid_body = get_node('RigidBody3D')
@onready var destronoi_node = get_node('RigidBody3D/DestronoiNode')

func destroy() -> void:
	rigid_body.set_gravity_scale(1)
	destronoi_node.destroy(4,4, 1.0)
