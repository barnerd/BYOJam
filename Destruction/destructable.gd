class_name Destructable
extends Node

var thread: Thread = Thread.new()

@onready var rigid_body: RigidBody3D = get_node('RigidBody3D')
@onready var destronoi_node: DestronoiNode = get_node('RigidBody3D/DestronoiNode')


# Thread must be disposed (or "joined"), for portability.
func _exit_tree() -> void:
	thread.wait_to_finish()


func generate_destruction_mesh() -> void:
	destronoi_node.generate()
	run_destruction.call_deferred()


func destroy() -> void:
	thread.start(generate_destruction_mesh, Thread.PRIORITY_LOW)


func run_destruction() -> void:
	rigid_body.set_gravity_scale(0.5)
	destronoi_node.destroy(4, 4, 2.0)


func _on_timer_timeout() -> void:
	destroy()
