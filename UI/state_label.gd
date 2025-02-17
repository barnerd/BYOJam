extends Label

@export var state_machine: StateMachine


func _ready() -> void:
	state_machine.state_changed.connect(on_state_changed)


func on_state_changed(_previous_state: State, current_state: State) -> void:
	text = current_state.name
