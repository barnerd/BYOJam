class_name TileSpace
extends Node3D

enum TileType { FOOD, FEAR, UPGRADE, DESTROYED }
enum UpgradeType { NONE, MAX_FEAR_BONUS, BONUS_LAP_FOOD }

@export var space_num: int = 0
@export var story_knot: String

@export var current_type: TileType
@export var current_upgrade: UpgradeType

@export var passing_hunger_effect: int

@export var tile_mesh: GeometryInstance3D


func set_type_material(_mat: StandardMaterial3D) -> void:
	# TODO: change material to destroyed material
	#print("TODO!")
	tile_mesh.material_override = _mat


func perform_passing_effect(_player: Player) -> void:
	_player.pet.change_hunger(passing_hunger_effect)


func perform_landing_effect(_player: Player) -> void:
	match current_type:
		TileType.FOOD:
			_player.pet.change_hunger(-1)
		TileType.FEAR:
			_player.board.change_fear(1)
		TileType.UPGRADE:
			match current_upgrade:
				UpgradeType.MAX_FEAR_BONUS:
					_player.board.current_max_fear_bonus += 1
				UpgradeType.BONUS_LAP_FOOD:
					_player.pet.current_lap_bonus_food += 1
		TileType.DESTROYED:
			_player.board.change_fear(3)


func destroy_tile(_destroyed_mat: StandardMaterial3D) -> void:
	current_type = TileType.DESTROYED
	set_type_material(_destroyed_mat)
	# TODO: call function to animate destroying tile
