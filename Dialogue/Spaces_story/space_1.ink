== space_1 ==

This is space 1.

///Add one to the hunger. 
~ change_hunger_level(1)
///What does the hunger say now?

This is lap number: {player_lap_count+1}!
{player_lap_count== 0: You have a whole journey ahead of you!}

Let's play a dice game!
~ temp dice_roll = RANDOM(1, 6)
+ [roll!]
- This is the result {dice_roll}. 

-> DONE
