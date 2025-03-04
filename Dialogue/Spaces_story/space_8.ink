== space_8 ==

{get_variable("is_current_destroyed"): -> space_8_destroyed}

{not space_8_interaction_1: -> space_8_interaction_1}
{not space_8_interaction_2: -> space_8_interaction_2}
{not space_8_interaction_3: -> space_8_interaction_3}
{not space_8_interaction_4: -> space_8_interaction_4}
{not space_8_interaction_5: -> space_8_interaction_5}
->space_8_interaction_6


==space_8_interaction_1==
#speaker: Kayleigh
Hey,hey!

Welcome to my boutique, how can we style you today? Oh! 

That is one... <i>interesting</i> looking pet you got there. Maybe an accessory would make them more approachable? 
 
 +[Cat Ears]
 Stellar choice! This is gonna be on eveyone's FYP!
 ~ change_variable("fear", amount_b*-1)

 
 +[ Devil Horns]
EEK! I didn't think something more horrifying was possible! Though.. it kinda works, not gonna lie.
~ change_variable("fear", amount_b*-1)

#speaker: Rosey
- Let's come back again sometime {MONSTER_NAME}, I got a good feeling about this place!
->DONE

==space_8_interaction_2==

#speaker: Kayleigh
Welcome back my lovlies! 

I've got a spectacular idea just for you two. What could be cuter than a great pair of shoes? Absolutely nothing! 

Why don't you two both look around and pick out something to show that amazing personality of yours!

+[FiveFinger shoes.]
Well, thats certainly a <i>choice</i>... especially when you only have one toe per foot.

#speaker: Narrator
You can feel Kayleigh's judgment of your fashion choices already, but you've made your choice and now you have to <i>live</i> with it.
~ change_variable("fear", amount_b*-1)

+[Crocs, but with socks.]
Accesorizing with jibits may do you some good, plus you can show off all your intrests that way!"

~ change_variable("fear", amount_b*-1)
#speaker: Kayleigh
-See ya two later!
->DONE

==space_8_interaction_3==

#speaker: Kayleigh
I'm thinking we should make their eyes pop this time. Why don't we apply a little eyeliner?

+[Smokey Eyeliner.]
How retro! You're totally pulling off that mid 2000's look.
~ change_variable("fear", amount_b*-1)

+[Double Wing.]
SLAY!!
~ change_variable("fear", amount_b*-1)
#speaker: Rosey
-I'm so proud of {MONSTER_NAME} embracing different styles!
->DONE
==space_8_interaction_4==

#speaker: Kayleigh
I just got some new tops in, if you're willing to sort through them for me you can for sure take one for free.

+[Three Wolf Moon Tee Shirt.]
Wow, what a... <i>statement piece</i>... How do these keep showing up here???

#speaker: Rosey
This may be the most evil decision we've made all week.
~ change_variable("fear", amount_b*-1)
+[Sundress.]
What a perfect pick for this season, that'll get a lot of <i>buzz!</i>
~ change_variable("fear", amount_b*-1)
#speaker: Rosey
-How kind of Kayleigh to give us something for free!
->DONE

==space_8_interaction_5==
#speaker: Kayleigh
Any great fit needs a little bow on top that pulls it all together, how about you choose one of these?

+[Moon Necklace.]
<i>It's giving...</i> look at me energy. You can't not wear that piece!
~ change_variable("fear", amount_b*-1)

+[Flourescent Lightbulb Earrings]
,i>It's giving...</i> craft fair vibes. Honestly, not a bad choice!
~ change_variable("fear", amount_b*-1)
#speaker: Rosey
-What would we ever do without this shop? I hope this place never closes!
->DONE

==space_8_interaction_6==
#speaker: Rosey
Kayleigh seems to be advising another person dipping their toes into the realm of fashion for the first time. 

We should probably let her cook without any interuption.
->DONE

=== space_8_destroyed ===
# speaker: Narrator
You and {MONSTER_NAME} return to the boutique and instead only find ruins.
Without this store, it's like the town has lost its originality. 

The only consolation is that at all the 100% polyester pieces burned to a crisp.

~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_8|-> DONE}