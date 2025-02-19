extends Node3D

signal pet_hunger_starving
signal pet_hunger_full
signal pet_hunger_changed(num: int)

enum EvolutionStage { CATERPILLAR, COCOON, MOTH } 

@export var min_hunger: int
@export var max_hunger: int
@export var food_on_lap: int
@export var starting_hunger: int
@export var starting_lap_bonus_food: int
@export var laps_per_morph: int

var current_hunger: int
var current_lap_bonus_food: int
var current_stage: EvolutionStage = EvolutionStage.CATERPILLAR


func _init() -> void:
	SignalBus.register_signal("pet_hunger_starving", pet_hunger_starving)
	SignalBus.register_signal("pet_hunger_full", pet_hunger_full)
	SignalBus.register_signal("pet_hunger_changed", pet_hunger_changed)


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)
	SignalBus.connect_to_signal("story_variable_changed", on_story_variable_changed)
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)


func game_reset() -> void:
	current_lap_bonus_food = starting_lap_bonus_food
	current_hunger = starting_hunger
	pet_hunger_changed.emit(current_hunger)


func on_story_variable_changed(variable_name: String, delta: float) -> void:
	if variable_name == "hunger":
		change_hunger(delta)
	if variable_name == "lap_bonus_food":
		add_lap_bonus(delta)


func on_lap_completed(_laps: int) -> void:
	change_hunger(food_on_lap + current_lap_bonus_food)
	if _laps % laps_per_morph == 0:
		morph_pet()


func add_lap_bonus(_bonus: int) -> void:
	current_lap_bonus_food += _bonus


func change_hunger(_delta: int) -> void:
	var prev_hunger = current_hunger
	
	current_hunger += _delta
	
	pet_hunger_changed.emit(current_hunger)
	
	current_hunger = clamp(current_hunger, min_hunger, max_hunger)
	if current_hunger == min_hunger:
		pet_hunger_starving.emit()
	
	if current_hunger == max_hunger:
		pet_hunger_full.emit()


func morph_pet() -> void:
	match current_stage:
		EvolutionStage.CATERPILLAR:
			current_stage = EvolutionStage.COCOON
			print("morph pet into Cocoon")
		EvolutionStage.COCOON:
			current_stage = EvolutionStage.MOTH
			print("morph pet into Moth")
