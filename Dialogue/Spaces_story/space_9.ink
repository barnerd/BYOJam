== space_9 ==

~ number_of_spaces_destroyed = 99

{testing_in_ink == true: 
    + [space_9_interaction_1] -> space_9_interaction_1
    + [space_9_interaction_2] -> space_9_interaction_2
    + [space_9_interaction_3] -> space_9_interaction_3
    + [space_9_interaction_4] -> space_9_interaction_4
    + [destroyed space] -> space_4_interaction_5
- else: 
    {get_variable("is_current_destroyed"): -> space_9_destroyed}

    {not space_9_interaction_1: -> space_9_interaction_1}
    {not space_9_interaction_2: -> space_9_interaction_2}
    {not space_9_interaction_3: -> space_9_interaction_3}
    {not space_9_interaction_4: -> space_9_interaction_4}
    ->space_4_interaction_5
}


==space_9_interaction_1==
#speaker: Columbone
"Ah excuse me, you two, Would you be able to tell me what time it is? I seem to have forgotten my watch at home. You know my wife is always having to remind me of all the important clutter I leave behind stormin’  in and out of the house on business. By Dog, I feel terrible, and I need to get better. 

Anywho I’m sorry for rambling, I do that sometimes, what’s the time again?"
#speaker: Rosey
+["It’s 3:02 PM."] 
-
#speaker: Columbone
Ah! Thank you, thank you! I gotta get back down to the station, I’m late for writing up a report on this case I’m investigating. Something about a monster terrorizing the town, and scaring everybody. Either of you haven’t happened to see anything of the sort, have you?
#speaker: Rosy
+["Nope. Can’t say we have, sorry."]
-
~ change_variable("fear", amount_b*-1)

#speaker: Columbone
"Thanks! I’ll be happy to report this all a bunch of baloney or a confused person not realizing they saw a barn owl. I’m sorry to have bothered you both.

    OH! and just one more thing… Take my card and dial me up if you happen to see something suspicious.
#speaker: Narrator
    You’re handed a card with Columbone’s number on it, but for now it looks like you two have nothing to fear.
->DONE
==space_9_interaction_2==

#speaker: Columbone
"Oh geez! What are the odds of running into you two here? I happened to be in this part of town to grab a bowl at my favorite chow place. 

Actually, that’s not true. My wife has been telling me I gotta be more honest even when it’s socially awkward. I really came out here to see you two. I don’t want to appear presumptuous but the situation demanded a follow up.

Have you happened to see anything suspicous lately regarding that monster rumor?


~ get_variable("number_of_spaces_destroyed")
{number_of_spaces_destroyed > 1:
    + [No... (guiltily)] 
    #speaker: Columbone
    "Good, good. I'm very pleased to hear that, I'll be on my way then. Sorry to have bothered you both. But before I do, you know what the oddest thing is that I can't piece together about this case is? It's why everyone keeps saying that this monster is a bug of some sort. 
    
    I mean that's plain ridiculous, I've never seen a bug that big. I mean have you {MONSTER_NAME}? Oh! I'm sorry I meant you {pc_name}. 
    
    Anyway's I'll let you two go, until next time."
    ~ change_variable("fear", amount_b*-1)
    ->DONE
}

+[Nope, can't say I have!]
    #speaker: Columbone
    "Good, good. I'm very pleased to hear that, I'll be on my way then. Sorry to have bothered you both." 
    ~ change_variable("fear", amount_b*-1)
    ->DONE


==space_9_interaction_3==

#speaker: Columbone
"Goodness to Dog, this town is small! Here I was just picking up a magazine for my wife and I bump into you two. So have you heard anything more?

//{number_of_spaces_destroyed > 2:
~ get_variable("number_of_spaces_destroyed")
{number_of_spaces_destroyed > 2:
    +[Uh... nope! (moderately guilty)]
    
    "Well what's been bugging me is that at every scene where the monster's been it's reported that they aren't alone. That they have an accomplice or a handler of some kind. 
    
    That's odd, innit! Can you imagine a little girl or something like that teaming up with a scary, life ruining monster?
    
    I can't! Anyways be on the look out you two, and stay safe, I thought I saw you both near one of those collapsed buildings. That isn't a playground. Well, as you two were."
    ~ change_variable("fear", amount_b*-1)
    ->DONE
}

+["Still nothing!]

Hmm... maybe that a good sign then. I figured that it was all a rumor. Carry on as you two were!"
~ change_variable("fear", amount_b*-1)
->DONE

==space_9_interaction_4==

"Dog garn, am I happy to see you both! I have a very promising lead on this case as soon as I was ready to toss it out. I thought that you two both deserved to hear, after all how I've been bugging you like a mosquito and all that.

Turn's out that the monster and their handler have a name the're going by! It's... it's... oh now what was it? Oh yes! Bluey and Mothra!"

//{number_of_spaces_destroyed > 3:
~ get_variable("number_of_spaces_destroyed")
{number_of_spaces_destroyed > 3:
    +[Hey that's not right! It's {pc_name} and {MONSTER_NAME}]
    
    ~ change_variable("fear", amount_b*-1)
    
    #speaker: Columbone
    "{pc_name} and {MONSTER_NAME} do you two happen to hear the problem with that? If what you're saying is true, then that means you two are responsible for all this chaos.
    
    Sigh
    
    Look, when me and my wife were engaged we decided on to get an alligator as a pet. A little one. We thought "Oh it's a little guy, he won't be much trouble. He's a reptile, they don't need much if we're away a lot." 
    
    But the little guy wasn't going to be tiny forever, and before we knew it he was too much and we had to let him go. Properly of course, to a proper zoo he'd be taken care of, not down the toilet. 
    
    What I'm trying to say is that sometimes the responsibility of another being outweighs where we ourselves are at in life. It doesn't mean we don't love them, but we need to grow ourselves more before we can give them the proper love and care tthey deserve. 
    
    {pc_name} I'm not gonna take you in, you're a kid after all and nobody has passed away from this all, thank Dog. But it's better to let {MONSTER_NAME} go. 
    
    So take a couple days and then say goodbye, okay kid? I won't bother you again, but if if something happens one more time then it's game over you hear!"

->DONE
}

+[Great to hear! We'll be on the look out for them.]

    ~ change_variable("fear", amount_b*-1)

->DONE



==space_9_interaction_5==
#speaker: Rosey
Columbone is nowhere to be found, but you always seem to feel his presance watching your every move... maybe it's best to move away from this space.
->DONE


=== space_9_destroyed ===
# speaker: Narrator
This is where Columbone worked, solving cases from theft to Lupicide. Who wil the town turn to now to solve their future cases? If only Sherlock Bones were a real dog...

~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_5|-> DONE}