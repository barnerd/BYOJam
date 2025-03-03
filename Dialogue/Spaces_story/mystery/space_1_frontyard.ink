VAR visited_frontyard = false


== space_1_interaction_1_frontyard ==
{visited_frontyard == false:
    ~ visited_frontyard = true
    # speaker: Narrator
    You take Lotta Scoops to your house's front lawn.
    "Maybe we can find something outside that tells us where your bug friend came from?"
}


{kick_to_end_active == true: 
    + [Examine bike] -> space_1_interaction_1_frontyard_bike
    + [Examine chalk drawings] -> space_1_interaction_1_frontyard_chalk
    + [Talk to Neighbor Greg] -> space_1_interaction_1_frontyard_greg
    * [Exit]
        ~ kick_to_end_active = false
        {testing_in_ink:-> space_1|-> DONE}
- else: 
    + [Examine bike] -> space_1_interaction_1_frontyard_bike
    + [Examine chalk drawings] -> space_1_interaction_1_frontyard_chalk
    + [Talk to Neighbor Greg] -> space_1_interaction_1_frontyard_greg
    * [Leave to search other areas]
    -> space_1_interaction_1
}

== space_1_interaction_1_frontyard_bike ==
# speaker: Lotta
What a lovely pink bike. I take it this is yours, {pc_name}?
That's interesting... the bike has brand new tassles. And look at that! They still have their price tag on it. 
I wonder where you got the money to get these?
-> space_1_interaction_1_frontyard

== space_1_interaction_1_frontyard_chalk ==
# speaker: Lotta
How frightening! There are countless chalk drawings of strange monsters!
If I didn't know any better, I'd say someone was trying to draw these monsters out into the real world through the medium of chalk on cement!
But bringing demons from asphodel to the asphalt, that's got to be a myth, right?
-> space_1_interaction_1_frontyard

== space_1_interaction_1_frontyard_greg ==
# speaker: Neighbor Greg
Howdy there, I'm Neighbor Greg!
I definitely wasn't doing anything suspicious staying up late at night...
I was working on my computer when I got up to take a stretch break like you're supposed to do every fifteen minutes. 
While I was in the middle of some calisthenics, I saw a strange orange light in Rosey's room, I think it must have been the night before she got the insect egg. 
Not sure if that's relevant, but I hope it helps. 
-> space_1_interaction_1_frontyard










