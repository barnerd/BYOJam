///// LIST OF GODOT FUNCTIONS
EXTERNAL change_hunger_level(delta)
EXTERNAL change_fear_level(delta)
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


/// VARIABLES
/// Note: These variables are created in godot and can be referenced in ink.
VAR player_lap_count = 0
VAR player_space_num = 0
VAR player_turns_taken = 0

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

* [hunger_crisis] -> hunger_crisis
* [fear_crisis] -> fear_crisis
* [game_over] -> game_over


=== function change_hunger_level(delta) ===
~return

=== function change_fear_level(delta) ===
~return

=== function move_player(delta) ===
~return

