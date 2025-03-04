class_name Pet
extends Node3D

signal pet_morphed(stage: EvolutionStage)
signal pet_hunger_starving
signal pet_hunger_full
signal pet_hunger_changed(num: int)
signal pet_hunger_percent_changed(percent: float)

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

@onready var caterpillar_mesh: Node3D = $caterpillar
@onready var cocoon_mesh: Node3D = $caccoon
@onready var moth_mesh: Node3D = $mothra

@onready var caterpillar_animation_player: AnimationPlayer = $caterpillar/AnimationPlayer
@onready var cocoon_animation_player: AnimationPlayer = $caccoon/AnimationPlayer
@onready var moth_animation_player: AnimationPlayer = $mothra/AnimationPlayer


func _init() -> void:
	SignalBus.register_signal("pet_morphed", pet_morphed)
	SignalBus.register_signal("pet_hunger_starving", pet_hunger_starving)
	SignalBus.register_signal("pet_hunger_full", pet_hunger_full)
	SignalBus.register_signal("pet_hunger_changed", pet_hunger_changed)
	SignalBus.register_signal("pet_hunger_percent_changed", pet_hunger_percent_changed)


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)
	SignalBus.connect_to_signal("story_variable_changed", on_story_variable_changed)
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)


func game_reset() -> void:
	current_stage = EvolutionStage.CATERPILLAR
	current_lap_bonus_food = starting_lap_bonus_food
	current_hunger = starting_hunger
	pet_hunger_changed.emit(current_hunger)
	pet_hunger_percent_changed.emit(current_hunger / float(max_hunger))
	
	caterpillar_mesh.visible = true
	cocoon_mesh.visible = false
	moth_mesh.visible = false
	
	play_animation("idle")


func on_story_variable_changed(variable_name: String, delta: float) -> void:
	match variable_name:
		"hunger":
			change_hunger(int(delta))
		"lap_bonus_food":
			add_lap_bonus(int(delta))


func on_lap_completed(_laps: int) -> void:
	change_hunger(food_on_lap + current_lap_bonus_food)
	print("a lap! lap #%d. need %d laps" % [_laps, laps_per_morph])
	if _laps % laps_per_morph == 0:
		morph_pet()


func add_lap_bonus(_bonus: int) -> void:
	current_lap_bonus_food += _bonus


func change_hunger(_delta: int) -> void:
	current_hunger += _delta
	
	current_hunger = clamp(current_hunger, min_hunger, max_hunger)
	
	if current_hunger == min_hunger:
		current_hunger = max_hunger
		pet_hunger_starving.emit()
	
	#if current_hunger == max_hunger:
		#pet_hunger_full.emit()
	
	pet_hunger_changed.emit(current_hunger)
	pet_hunger_percent_changed.emit(current_hunger / float(max_hunger))


func play_animation(_animation: String) -> void:
	if not (_animation == "move" or _animation == "idle"):
		return
	
	match current_stage:
		EvolutionStage.CATERPILLAR:
			caterpillar_animation_player.play(_animation)
		EvolutionStage.COCOON:
			cocoon_animation_player.play("idle")
		EvolutionStage.MOTH:
			moth_animation_player.play(_animation)


func morph_pet() -> void:
	# TODO: set the correct animation
	match current_stage:
		EvolutionStage.CATERPILLAR:
			current_stage = EvolutionStage.COCOON
			caterpillar_mesh.visible = false
			cocoon_mesh.visible = true
			pet_morphed.emit(current_stage)
		EvolutionStage.COCOON:
			current_stage = EvolutionStage.MOTH
			cocoon_mesh.visible = false
			moth_mesh.visible = true
			pet_morphed.emit(current_stage)
	print("switch to pet morph knot: %d" % current_stage)
