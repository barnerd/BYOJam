== space_8 ==
{not space_8_interaction_1: -> space_8_interaction_1}
{not space_8_interaction_2: -> space_8_interaction_2}
{not space_8_interaction_3: -> space_8_interaction_3}
{not space_8_interaction_4: -> space_8_interaction_4}
{not space_8_interaction_5: -> space_8_interaction_5}
->space_8_interaction_6


==space_8_interaction_1==
#speaker: Kayleigh
Hey,hey! Welcome to my boutique, how can we style you today? Oh! That is one... interesting looking pet you got there. Maybe an accessory would make them more approachable? 
 
 +[Cat Ears]
 "Stellar choice! This is gonna be on eveyone's FYP!"
 //~ change_variable("fear", Bagel)

 
 +[ Devil Horns]
"EEK! I didn't think something more horrifying was possible! Though.. it kinda works, not gonna lie."
//~ change_variable("fear", Bagel)

#speaker: Rosey
- "Let's come back again sometime {MONSTER_NAME}, I got a good feeling about this place!"
->DONE

==space_8_interaction_2==

#speaker: Kayleigh
"Welcome back my lovlies! I've got a spectacular idea just for you two. What could be cuter than a great pair of shoes? Absolutely nothing! Why don't you two both look around and pick out something showing off that amazing personality of yours!"

+[FiveFinger shoes.]
"Well, thats certainly a choice... especially when you only have one toe per foot"

#speaker: Narrator
You can feel Kayleigh's judgment of your fashion choices already, but you've made your choice and now you have to live with it.
//~ change_variable("fear", Bagel)

+[Crocs, but with socks.]
"Accesorizing with jibits may do you some good, plus you can show off all your intrests that way!"


//~ change_variable("fear", Bagel)
#speaker: Kayleigh
-"See ya later!"
->DONE

==space_8_interaction_3==

#speaker: Kayleigh
"I'm thinking we should make their eyes pop this time. Why don't we apply a little eyeliner?"

+[Smokey Eyeliner.]
"How retro! You're totally pulling off that mid 2000's look."
//~ change_variable("fear", Bagel)

+[Double Wing.]
"SLAY!!"
//~ change_variable("fear", Bagel)
#speaker: Rosey
-"I'm so proud of {MONSTER_NAME} embracing different styles!"
->DONE
==space_8_interaction_4==

#speaker: Kayleigh

"I just got some new tops in, if you're willing to sort through them for me you can for sure take one for free."

+[Three Wolf Moon Tee Shirt.]
"Wow, what a... statement piece... How do these keep showing up here???"
//~ change_variable("fear", Bagel)
+[Sundress.]
"What a perfect pick for this season, that'll get a lot of buzz!"
//~ change_variable("fear", Bagel)
#speaker: Rosey
-"How kind of Kayleigh to give us something for free!"
->DONE

==space_8_interaction_5==
#speaker: Kayleigh
"Any great fit needs a little bow on top that pulls it all together, how about you choose one of these?"

+[Moon Necklace.]
"It's giving... look at me energy. You can't not wear that piece!"
//~ change_variable("fear", Bagel)

+[Flourescent Lightbulb Earrings]
"It's giving... craft fair vibes. Honestly, not a bad choice!"
//~ change_variable("fear", Bagel)
#speaker: Rosey
-"What would we ever do without this shop? I hope this place never closes."
->DONE



==space_8_interaction_6==
#speaker: Rosey
Kayleigh seems to be advising another person dipping their toes into the realm, of fashion for the first time. We should probably let her cook without any interuption.
->DONE