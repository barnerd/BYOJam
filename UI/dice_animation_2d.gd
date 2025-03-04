class_name DiceAnimation22D
extends PanelContainer

signal dice_rolled(selected_value: int, rolled_values: Array[int])

var dice_prefab: PackedScene = preload("res://characters/player/dice_pool/dice_2d.tscn")
var dice_pool: Array[Dice2D] = []

@onready var dice_container: Container = $MarginContainer/MarginContainer/GridContainer


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)


func game_reset() -> void:
	dice_pool.clear()
	
	for child in dice_container.get_children():
		child.queue_free()
	
	add_new_dice()
	add_new_dice()


func add_new_dice() -> void:
	var new_dice = dice_prefab.instantiate() as Dice2D
	
	dice_container.add_child(new_dice)
	dice_pool.append(new_dice)
	
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
