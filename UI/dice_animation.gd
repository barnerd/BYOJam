class_name DiceAnimation
extends PanelContainer

signal dice_rolled(selected_value: int, rolled_values: Array[int])

var dice_prefab: PackedScene = preload("res://characters/player/dice_pool/dice.tscn")
var dice_pool: Array[Dice] = []

@onready var dice_container: Container = $GridContainer


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)

func game_reset() -> void:
	dice_pool.clear()
	
	for child in dice_container.get_children():
		child.queue_free()
	
	add_new_dice(0, 0, Color.WHITE)
	add_new_dice(1, 1, Color.WHITE)
	add_new_dice(3, 3, Color.WHITE)
	add_new_dice(4, 4, Color.WHITE)
	add_new_dice(6, 6, Color.WHITE)
	add_new_dice(12, 12, Color.WHITE)


func add_new_dice(_min: int, _max: int, _color: Color) -> void:
	var new_dice = dice_prefab.instantiate() as Dice
	
	dice_container.add_child(new_dice)
	dice_pool.append(new_dice)
	
	new_dice.set_color(_color)
	new_dice.set_min_max(_min, _max)
	
	new_dice.on_select_signal.connect(on_dice_selected)


func roll_dice() -> void:
	visible = true
	for die in dice_pool:
		die.roll_dice()


func on_dice_selected(_selected_value: int) -> void:
	var rolled_values: Array[int] = []
	for die in dice_pool:
		rolled_values.append(die.roll_value)
		die.is_rolled = false
	dice_rolled.emit(_selected_value, rolled_values)
	visible = false
