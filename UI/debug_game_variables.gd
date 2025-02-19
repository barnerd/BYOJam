extends PanelContainer

@export var state_machine: StateMachine

@onready var state_value: Label = $MarginContainer/VBoxContainer/StateContainer/Value
@onready var hunger_value: Label = $MarginContainer/VBoxContainer/HungerContainer/Value
@onready var fear_value: Label = $MarginContainer/VBoxContainer/FearContainer/Value
@onready var lap_value: Label = $MarginContainer/VBoxContainer/PlayerLapContainer/Value
@onready var turn_value: Label = $MarginContainer/VBoxContainer/PlayerTurnContainer/Value
@onready var player_space_value: Label = $MarginContainer/VBoxContainer/PlayerSpaceContainer/Value


func _ready() -> void:
	state_machine.state_changed.connect(on_state_changed)
	
	SignalBus.connect_to_signal("lap_completed", on_lap_completed)
	SignalBus.connect_to_signal("player_moved", on_player_moved)
	SignalBus.connect_to_signal("turn_taken", on_turn_taken)
	SignalBus.connect_to_signal("pet_hunger_changed", on_pet_hunger_changed)
	SignalBus.connect_to_signal("board_fear_changed", on_board_fear_changed)



func on_state_changed(_previous_state: State, current_state: State) -> void:
	state_value.text = current_state.name


func on_lap_completed(_num: int) -> void:
	lap_value.text = str(_num)


func on_player_moved(_num: int) -> void:
	player_space_value.text = str(_num + 1)


func on_turn_taken(_num: int) -> void:
	turn_value.text = str(_num)


func on_pet_hunger_changed(_num: int) -> void:
	hunger_value.text = str(_num)


func on_board_fear_changed(_num: int) -> void:
	fear_value.text = str(_num)
