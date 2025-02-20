class_name TileSpace
extends Node3D

enum TileType { FOOD, FEAR, UPGRADE, DESTROYED }
enum UpgradeType { NONE, MAX_FEAR_BONUS, BONUS_LAP_FOOD }

@export var current_type: TileType
@export var current_upgrade: UpgradeType

@export var food_type_color: Color
@export var fear_type_color: Color
@export var upgrade_type_color: Color
@export var destroyed_type_color: Color


func perform_passing_effect(_player: Player) -> void:
	_player.pet.change_hunger(-1)


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


func destory_tile() -> void:
	current_type = TileType.DESTROYED
	# TODO: change color to red
	# TODO: call function to animate destroying tile
