class_name DicePool
extends PanelContainer

@onready var output_label = $MarginContainer/VBoxContainer/Label
@onready var roll_dice_button = $MarginContainer/VBoxContainer/Button

signal dice_rolled(value: int)

func reset() -> void:
	output_label.text = ""
	roll_dice_button.disabled = false


func _on_button_pressed() -> void:
	var value: int = randi_range(1, 6)
	
	output_label.text = "You rolled a %d!" % value
	
	#roll_dice_button.disabled = true
	$MarginContainer/VBoxContainer/GridContainer/SubViewportContainer.roll_dice()
	$MarginContainer/VBoxContainer/GridContainer/SubViewportContainer2.roll_dice()
	dice_rolled.emit(value)
