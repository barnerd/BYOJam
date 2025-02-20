class_name DicePool
extends PanelContainer

signal dice_rolled(value: int)

var dice_prefab: PackedScene = preload("res://characters/player/dice_pool/dice.tscn")
var dice_pool: Array[Dice] = []

@onready var output_label = $MarginContainer/VBoxContainer/Label
@onready var roll_dice_button = $MarginContainer/VBoxContainer/Button
@onready var dice_container: Container = $MarginContainer/VBoxContainer/GridContainer


func _ready() -> void:
	SignalBus.connect_to_signal("game_reset", game_reset)


func game_reset() -> void:
	dice_pool.clear()
	
	for child in dice_container.get_children():
		child.queue_free()
	
	add_new_dice(1, 1, Color.FIREBRICK)
	add_new_dice(2, 2, Color.WEB_GREEN)


func add_new_dice(_min: int, _max: int, _color: Color) -> void:
	var new_dice = dice_prefab.instantiate() as Dice
	
	dice_container.add_child(new_dice)
	dice_pool.append(new_dice)
	
	new_dice.set_color(_color)
	new_dice.set_min_max(_min, _max)
	
	new_dice.on_select_signal.connect(on_dice_selected)


func reset() -> void:
	output_label.text = ""
	roll_dice_button.disabled = false


func _on_button_pressed() -> void:
	output_label.text = "Select which dice to use."
	
	roll_dice_button.disabled = true
	for die in dice_pool:
		die.roll_dice()


func on_dice_selected(_value: int) -> void:
	for die in dice_pool:
		die.is_rolled = false
	dice_rolled.emit(_value)
