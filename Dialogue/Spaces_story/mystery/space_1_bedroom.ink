
VAR visited_bedroom = false

== space_1_interaction_1_bedroom ==
{visited_bedroom == false:
    ~ visited_bedroom = true
    # speaker: Narrator
    You take Lotta Scoops up to your bedroom, explaining last Thursday you woke up to find the egg at the foot of your bed.
    # speaker: Lotta
    Well, sounds like this is the place where it all happened. Let's take a look!
}


{kick_to_end_active == true: 
    ///+ [Examined bed] -> space_1_interaction_1_bedroom_bed
    + [Examine window] -> space_1_interaction_1_bedroom_window
    + [Examine night stand] -> space_1_interaction_1_bedroom_nightstand 
    + [Examine wall] -> space_1_interaction_1_bedroom_wall 
    * [Exit]
        Okay, we can resume investigating when you come here again. Don't forget to like, subscribe, and yada, yada, yada.
        ~ kick_to_end_active = false
        {testing_in_ink:-> space_1|-> DONE}
- else: 
    ///+ [Examined bed] -> space_1_interaction_1_bedroom_bed
    + [Examine window] -> space_1_interaction_1_bedroom_window
    + [Examine night stand] -> space_1_interaction_1_bedroom_nightstand 
    + [Examine wall] -> space_1_interaction_1_bedroom_wall
    + [Leave to search other areas]
    -> space_1_interaction_1
}

{testing_in_ink:-> space_1|-> DONE}

== space_1_interaction_1_bedroom_bed ==
# speaker: Lotta
Well this is interesting. The bed is a positive mess, I don't think it's been cleaned in weeks.
Strangely, there's an envelope still under the pillow that's empty.
-> space_1_interaction_1_bedroom

== space_1_interaction_1_bedroom_window ==
# speaker: Lotta
The window overlooking the backyard doesn't lock."
In fact, the outside latch shows signs of tampering. Like someone with sharp claws recently opened it.
-> space_1_interaction_1_bedroom

== space_1_interaction_1_bedroom_nightstand ==
# speaker: Lotta
Huh, look at this: a mouth guard. Looks like we've got a k-9 who grinds their canines.
# speaker: Narrator
You explain that you wear one because you sometimes relive the stress of the day while you sleep.
You tell Lotta about the time you went to sleep angry at your dad.
As soon as you fell asleep, you woke up the whole family as you yelled, "LEAVE ME ALONE, DAD!"
-> space_1_interaction_1_bedroom

== space_1_interaction_1_bedroom_wall ==
# speaker: Lotta
Wow, that's an enormous poster of the aqauarium you've got up on the wall." 
That doesn't scare you going to bed at night, seeing those drawings of the sharks, baracudas, and squid watching you to sleep?"
It's enough to give me the creeps just staring at it!
-> space_1_interaction_1_bedroom


== space_1_interaction_1_bedroom_headphones ==
# speaker: Lotta
A set of noise canceling headphones, what are these for?"
# speaker: Narrator
Just then you hear a sound like an elelphant being rhythmically waterboarded in a pit of mayonnaise.
# speaker: Lotta
What is that noise? My ears!
# speaker: Narrator
Lotta peers outside and sees the neighbor Greg playing the trombone.
# speaker: Lotta
...Now I see why you need the headphones.
-> space_1_interaction_1_bedroom










 neighbor Greg playing the trombone.</i>
"...Now I see why you need the headphones."
-> space_1_interaction_1_bedroom










