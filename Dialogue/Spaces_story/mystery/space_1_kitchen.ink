VAR visited_kitchen = false

== space_1_interaction_1_kitchen ==

{visited_kitchen == false:
    ~ visited_kitchen = true
    # speaker: Narrator
    You and Lotta Scoops head to the kitchen. The family spends a lot of time here, so it's possible there may be some clues here to the bug's origin.
}

{kick_to_end_active == true: 
    + [Examine kitchen table] -> space_1_interaction_1_kitchen_table
    + [Examine window] -> space_1_interaction_1_kitchen_window
    + [Examine calendar] -> space_1_interaction_1_kitchen_calendar
    + [Examine microwave] -> space_1_interaction_1_kitchen_window

    * [Exit]
        Okay, we can resume investigating when you come here again. Don't forget to like, subscribe, and yada, yada, yada.
        ~ kick_to_end_active = false
        {testing_in_ink:-> space_1|-> DONE}
- else: 
    + [Examine kitchen table] -> space_1_interaction_1_kitchen_table
    + [Examine window] -> space_1_interaction_1_kitchen_window
    + [Examine calendar] -> space_1_interaction_1_kitchen_calendar
    + [Examine microwave] -> space_1_interaction_1_kitchen_window
    + [Leave to search other areas]
    -> space_1_interaction_1
}



== space_1_interaction_1_kitchen_table ==
# speaker: Lotta
"What's this on the table... <i>blood?</i>"
# speaker: Narrator
You explain that it's actually only nail polish. 
You were trying to paint your own nails after dinner and spilled the entire bottle on the fancy table your parents just got.
When your mom found out, she scolded you, and you shouted at her over and over again: You're a big bad mom! 
Suffice to say, mom hasn't let you paint your nails again.
-> space_1_interaction_1_kitchen

== space_1_interaction_1_kitchen_window ==
# speaker: Narrator
A window that looks out onto the neighborhood. 
Importantly, it gives a direct view into Neighbor Greg's room where he's often staying up late at night on his computer. 
He wears those absurd yellow tinted glasses which he insists helps with eye  strain. 
You once asked your mom for glasses like that but she says they A) don't help and B) look really stupid.
-> space_1_interaction_1_kitchen

== space_1_interaction_1_kitchen_calendar ==
# speaker: Narrator
A calendar that shows the family's schedule of planned meals. 
On the night you received the insect egg, it looks everyone in your family had an extra helping of garlic eggplant. 
# speaker: Lotta
That sounds tasty, you'll have to give me the recipe. Especially since I was thinking of starting a cooking show...
# speaker: Narrator
Rosey explains that she ate that meal very, very slowy but won't elaborate why. 
-> space_1_interaction_1_kitchen

== space_1_interaction_1_kitchen_microwave ==
# speaker: Lotta
"Why are you showing me the microwave?" 
# speaker: Narrator
You point out that the adjusted control panel and explain that Neighbor Greg watched over the house while the family took a vacation to the Paw-bahamas. 
Neighbor Greg was so responsible, he even fixed the microwave without being asked while everyone was off at vacation.
-> space_1_interaction_1_kitchen



