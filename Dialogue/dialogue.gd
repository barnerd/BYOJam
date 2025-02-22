class_name Dialogue
extends Control

signal story_moves_player(num_spaces: int)
signal story_section_complete

@onready var story_label: RichTextLabel = $HBoxContainer/ColorRect/MarginContainer/VBoxContainer/Label
@onready var choices_container = $HBoxContainer/ColorRect/MarginContainer/VBoxContainer/ChoicesContainer

var choice_button: PackedScene = preload("res://Dialogue/choice_button.tscn")
var regex = RegEx.new()

## at top of main Ink File:
## EXTERNAL change_hunger_level(delta)
## EXTERNAL change_fear_level(delta)
## EXTERNAL move_player(delta)
##
## usage:
## delta can be positive or negative
## {change_hunger_level(delta)}
## {change_fear_level(delta)}
## {move_player(delta)}
##

func _init() -> void:
	SignalBus.register_signal("story_moves_player", story_moves_player)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	StoryManager.ink_player.connect("continued", _continue_story)
	StoryManager.ink_player.connect("prompt_choices", _prompt_choices)
	StoryManager.ink_player.connect("ended", on_story_ended)
	
	# connect Story variables
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)
	SignalBus.connect_to_signal("player_moved", on_player_moved)
	SignalBus.connect_to_signal("turn_taken", on_turn_taken)
	
	# bind functions
	await StoryManager.ink_player.loaded
	StoryManager.ink_player.bind_external_function("change_hunger_level", $"../../Player/Pet", "change_hunger")
	StoryManager.ink_player.bind_external_function("change_fear_level", $"../../GameBoard", "change_fear")
	StoryManager.ink_player.bind_external_function("move_player", self, "move_player")


func start_knot(knot: String = "") -> void:
	StoryManager.ink_player.choose_path(knot)
	
	StoryManager.ink_player.continue_story()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if not StoryManager.ink_player.has_choices:
				#print("Mouse Click/Unclick at: ", event.position)
				StoryManager.ink_player.continue_story()


func _continue_story(text: String, tags) -> void:
	print("continue story")
	if tags:
		story_tags(tags)
	
	story_label.text = remap_style_tags(text)
	
	if StoryManager.ink_player.has_choices:
		StoryManager.ink_player.continue_story()


func _prompt_choices(choices: Array) -> void:
	print("prompt choices")
	if not choices.is_empty():
		choices_container.visible = true
		#print(choices)
		
		for choice in choices:
			var new_button = choice_button.instantiate()
			
			new_button.text = remap_style_tags(choice.text)
			new_button.pressed.connect(_select_choice.bind(choice.index))
			choices_container.add_child(new_button)
			print(choice.index)


func on_story_ended() -> void:
	print("The End")
	visible = false
	story_section_complete.emit()


func _select_choice(index: int) -> void:
	print(index)
	choices_container.visible = false
	for child in choices_container.get_children():
		child.queue_free()
	
	StoryManager.ink_player.choose_choice_index(index)
	StoryManager.ink_player.continue_story()


func _on_next_button_pressed() -> void:
	StoryManager.ink_player.continue_story()


func story_tags(tags) -> void:
	print(tags)
	for tag in tags:
		match tag:
			"highlight_temperature_lever":
				pass
			"highlight_ingredients":
				pass
			"unhighlight":
				pass


func remap_style_tags(_text: String) -> String:
	_text = _text.replacen("<i>", "[i]")
	_text = _text.replacen("</i>", "[/i]")
	_text = _text.replacen("<b>", "[b]")
	_text = _text.replacen("</b>", "[/b]")
	
	return _text


func on_lap_completed(_lap: int) -> void:
	StoryManager.ink_player.set_variable("player_lap_count", _lap)


func on_player_moved(_space: int) -> void:
	StoryManager.ink_player.set_variable("player_space_num", _space)


func on_turn_taken(_turn: int) -> void:
	StoryManager.ink_player.set_variable("player_turns_taken", _turn)


func move_player(_delta: int) -> void:
	story_moves_player.emit(_delta)
	StoryManager.ink_player.continue_story()
