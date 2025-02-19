extends Node3D

signal pet_hunger_starving
signal pet_hunger_full
signal pet_hunger_changed(num: int)

enum EvolutionStage { CATERPILLAR, COCOON, MOTH } 

@export var starving_hunger_threshold: int
@export var full_hunger_threshold: int
@export var starting_hunger: int
var current_hunger: int
var current_stage: EvolutionStage = EvolutionStage.CATERPILLAR


func _init() -> void:
	SignalBus.register_signal("pet_hunger_starving", pet_hunger_starving)
	SignalBus.register_signal("pet_hunger_full", pet_hunger_full)
	SignalBus.register_signal("pet_hunger_changed", pet_hunger_changed)


func game_reset() -> void:
	current_hunger = starting_hunger
	pet_hunger_changed.emit(current_hunger)


func change_hunger(_delta: int) -> void:
	var prev_hunger = current_hunger
	
	current_hunger += _delta
	
	pet_hunger_changed.emit(current_hunger)
	
	if (prev_hunger > starving_hunger_threshold and 
	current_hunger < starving_hunger_threshold):
		pet_hunger_starving.emit()
	
	if (prev_hunger < full_hunger_threshold and 
	current_hunger > full_hunger_threshold):
		pet_hunger_full.emit()
