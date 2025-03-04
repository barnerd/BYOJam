/// Switch this to false when exporting
VAR testing_in_ink = false


/// INK AND GODOT VARIABLES
VAR current_day = 0 /// David, this should hook into Godot and reference the number of times you've gone around the board. 
VAR number_of_spaces_destroyed = 0 /// David, this should hook into Godot and reference the number of spaces destroyed. 
VAR current_evolution_state = "caterpillar" /// Should either be "caterpillar" , "cocoon" , "butterfly"
VAR is_current_destroyed = false

/// AMOUNT VARIABLES
/// For anyone who comes after me, I'm creating these so it's easy to adjust numbers as a batch. 
VAR amount_a = 1 /// weakest effect
VAR amount_b = 2
VAR amount_c = 3
VAR amount_d = 4 
VAR amount_e = 5 /// mid effect
VAR amount_f = 6
VAR amount_g = 7 
VAR amount_h = 8 
VAR amount_i = 9
VAR amount_j = 10 /// max effect


///// LIST OF GODOT FUNCTIONS
EXTERNAL set_variable(variable_name, value)
EXTERNAL change_variable(variable_name, delta)
EXTERNAL get_variable(variable_name)
EXTERNAL move_player(delta)

/// HOW TO USE ABOVE FUNCTIONS
//Note: delta can be positive or negative
// ~ change_hunger_level(delta)
// ~ change_fear_level(delta)
// ~ move_player(delta)

/// Reference to story spaces
INCLUDE Spaces_story/space_1.ink
INCLUDE Spaces_story/space_2.ink
INCLUDE Spaces_story/space_3.ink
INCLUDE Spaces_story/space_4.ink
INCLUDE Spaces_story/space_5.ink
INCLUDE Spaces_story/space_6.ink
INCLUDE Spaces_story/space_7.ink
INCLUDE Spaces_story/space_8.ink
INCLUDE Spaces_story/space_9.ink
INCLUDE Spaces_story/space_10.ink
INCLUDE Spaces_story/space_11.ink
INCLUDE Spaces_story/space_12.ink

/// Reference to Special Events
INCLUDE Special_events_story/hunger_crisis.ink
INCLUDE Special_events_story/fear_crisis.ink
INCLUDE Special_events_story/game_over.ink
INCLUDE Special_events_story/game_intro.ink
INCLUDE Special_events_story/evolution_stages.ink


/// VARIABLES
/// Note: These variables are created in godot and can be referenced in ink.
VAR player_lap_count = 0
VAR player_space_num = 0
VAR player_turns_taken = 0

/// INK SPECIFIC VARIABLES
/// NOTE: These are variables to standardize the amounts of change. 

VAR weak_effect = 1
VAR medium_effect = 2
VAR strong_effect = 3
VAR very_strong_effect = 5

* [space_1] -> space_1
* [space_2] -> space_2
* [space_3] -> space_3
* [space_4] -> space_4
* [space_5] -> space_5
* [space_6] -> space_6
* [space_7] -> space_7
* [space_8] -> space_8
* [space_9] -> space_9
* [space_10] -> space_10
* [space_11] -> space_11
* [space_12] -> space_12

* [game_intro] -> game_intro
* [evolution states] -> game_over
* [hunger_crisis] -> hunger_crisis
* [fear_crisis] -> fear_crisis
* [game_over] -> game_over



//// EQUIVILENT INK FUNCTIONS
=== function set_variable(variable_name, value) ===
~return
=== function change_variable(variable_name, delta) ===
~return
=== function get_variable(variable_name) ===
~return
=== function move_player(delta) ===
~return

/// LIST OF INK FUNCTIONS
=== function coin_flip_for_panic_generatior() ===
~ temp dice_roll = RANDOM(1, 4)
{dice_roll == 4:
    # speaker: bug
    ~ change_variable("fear", amount_a)
    In that moment, you feel the <b>town panic</b> rising in fear of {MONSTER_NAME}...
- else: 
    # speaker: Narrator
    Luckily the town panic doesn't spike any higher than what it already is...
}