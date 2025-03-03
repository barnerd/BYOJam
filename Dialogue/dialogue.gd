class_name Dialogue
extends PanelContainer

signal story_moves_player(num_spaces: int)
signal story_section_complete

@onready var story_label: RichTextLabel = $CenterContainer/HBoxContainer/VBoxContainer/MarginContainer/HBoxContainer/ColorRect/MarginContainer/Label
@onready var choices_container = $CenterContainer/HBoxContainer/VBoxContainer/MarginContainer2/ChoicesContainer
@onready var character_portrait = $Portrait
@onready var speech_bubble_arrow = $CenterContainer/HBoxContainer/VBoxContainer/MarginContainer/HBoxContainer/SpeechBubbleArrow
@onready var name_tag: Label = $CenterContainer/HBoxContainer/VBoxContainer/MarginContainer/NameTag/Background/MarginContainer/Label

var choice_button: PackedScene = preload("res://Dialogue/choice_button.tscn")
var regex = RegEx.new()

var portrait_file_names: Dictionary = {
	"rosey": "res://ArtAssets/2D Art/Characters/Bluey-Main-Character.png",
	"allison_wheeler": "res://ArtAssets/2D Art/Characters/Allison-Wheeler.png",
	"ringo": "res://ArtAssets/2D Art/Characters/Ringo-Wheeler.png",
	"wolfgang_crimson": "res://ArtAssets/2D Art/Characters/Wolfgang-Crimson.png",
	"lotta": "res://ArtAssets/2D Art/Characters/Lotta-Scoops.png",
	"bug": "res://ArtAssets/2D Art/Characters/Caterpillar.png",
	"columbone": "res://ArtAssets/2D Art/Characters/Dogtective-Columbone.png",
	"kayleigh": "res://ArtAssets/2D Art/Characters/Kayleigh-Buzzbone.png",
	"ruby": "res://ArtAssets/2D Art/Characters/Ruby-Ruffington.png",
}


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
	if not StoryManager.is_story_loaded:
		await StoryManager.ink_player.loaded
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
	#print("continue story")
	if tags:
		story_tags(tags)
	
	story_label.text = remap_style_tags(text)
	
	if StoryManager.ink_player.has_choices:
		StoryManager.ink_player.continue_story()


func _prompt_choices(choices: Array) -> void:
	#print("prompt choices")
	if not choices.is_empty():
		choices_container.visible = true
		#print(choices)
		
		for choice in choices:
			var new_choice_button = choice_button.instantiate() as DialogueChoiceButton
			choices_container.add_child(new_choice_button)
			
			new_choice_button.update_text(remap_style_tags(choice.text))
			new_choice_button.connect_to_button_signal(_select_choice.bind(choice.index))
			#print(choice.index)


func on_story_ended() -> void:
	#print("The End")
	visible = false
	story_section_complete.emit()


func _select_choice(index: int) -> void:
	#print(index)
	choices_container.visible = false
	for child in choices_container.get_children():
		child.queue_free()
	
	StoryManager.ink_player.choose_choice_index(index)
	StoryManager.ink_player.continue_story()


func _on_next_button_pressed() -> void:
	StoryManager.ink_player.continue_story()


func story_tags(tags) -> void:
	for tag in tags:
		if tag.left(7) == "speaker":
			var speaker: String = tag.right(-8)
			change_name_tag(speaker)
			swap_portrait(speaker)
			continue
		match tag:
			"highlight_temperature_lever":
				pass
			"highlight_ingredients":
				pass
			"unhighlight":
				pass
			_:
				print("unused tag: %s" % tag)


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
	#StoryManager.ink_player.continue_story()


func change_name_tag(_name: String) -> void:
	name_tag.text = _name.to_upper()


func swap_portrait(_name: String) -> void:
	var speaker_name = _name.trim_prefix(" ").to_snake_case()
	if portrait_file_names.has(speaker_name):
		character_portrait.texture = load(portrait_file_names[speaker_name])
		character_portrait.visible = true
		speech_bubble_arrow.visible = true
	else:
		print("%s filename not found" % speaker_name)
		character_portrait.visible = false
		speech_bubble_arrow.visible = false
