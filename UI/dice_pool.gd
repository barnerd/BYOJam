class_name DicePool
extends PanelContainer

signal dice_selected(value: int)

@export var dice_animation: DiceAnimation

var dice_pip_images: Array = [
	[
		"res://ArtAssets/2D Art/Dice/1-roll-tilt-left.PNG",
		"res://ArtAssets/2D Art/Dice/1-roll-tilt-right.PNG",
		"res://ArtAssets/2D Art/Dice/1-roll.PNG",
		],
	[
		"res://ArtAssets/2D Art/Dice/2-roll-tilt-left.PNG",
		"res://ArtAssets/2D Art/Dice/2-roll-tilt-right.PNG",
		"res://ArtAssets/2D Art/Dice/2-roll.PNG",
		],
	[
		"res://ArtAssets/2D Art/Dice/3-roll-tilt-left.PNG",
		"res://ArtAssets/2D Art/Dice/3-roll-tilt-right.PNG",
		"res://ArtAssets/2D Art/Dice/3-roll.PNG",
		],
]

@onready var roll_button: TextureButton = $MarginContainer/VBoxContainer/Button


func _ready() -> void:
	dice_animation.dice_rolled.connect(on_dice_selected)


func ready_to_roll() -> void:
	roll_button.disabled = false


func _on_button_pressed() -> void:
	roll_button.disabled = true
	# dice_animation make visible
	dice_animation.roll_dice()


func on_dice_selected(selected_value: int, rolled_values: Array[int]) -> void:
	# dice_animation make visible
	# update dice images
	$MarginContainer/VBoxContainer/GridContainer/TextureRect.texture = load(dice_pip_images[rolled_values[0]][randi_range(0, 2)])
	$MarginContainer/VBoxContainer/GridContainer/TextureRect2.texture = load(dice_pip_images[rolled_values[1]][randi_range(0, 2)])
	
	dice_selected.emit(selected_value)
