== space_5 ==

{get_variable("is_current_destroyed"): -> space_5_destroyed}

{not space_5_interaction_1: -> space_5_interaction_1}
{not space_5_interaction_2: -> space_5_interaction_2}
{not space_5_interaction_3: -> space_5_interaction_3}
{not space_5_interaction_4: -> space_5_interaction_4}
{not space_5_interaction_5: -> space_5_interaction_5}
{not space_5_interaction_6: -> space_5_interaction_6}
{not space_5_interaction_7: -> space_5_interaction_7}
{not space_5_interaction_8: -> space_5_interaction_8}
->space_5_interaction_9


==space_5_interaction_1==
#speaker: Knight Squeaksworth
“Maybe if I adjust this line here… no, that’s not right. What about if I blend these two colors here... ARRRGH DOG GONE IT ALL! 

Oh, I’m sorry I didn’t see you two there, I apologize you had to hear all that. Painting has been difficult for me lately. No matter what, when I try to create a new piece it’s never to my satisfaction.”

+["Can I see?"]

-“You’re welcome to gaze. Take a picture if you want to as well. It'll last longer that way.”

+[“I love this piece! It’s super cool looking, and it seems like {MONSTER_NAME} is ecstatic about it as well.”]

-“Oh! Well thank you both… uh… uhm… I ordered too many fries with this meal I got to eat alongside my work. Would you two like some?”
	
+[“Fries? Yum, thank you!”]
#speaker: Narrator
- You all enjoy a good snack together, and those fries hit just right.
~ change_variable("hunger", amount_c) 
->DONE

==space_5_interaction_2==
#speaker: Knight Squeaksworth
“Oh hey you two! I forgot to ask you your names last time. Could you both tell me a bit more about yourselves? I hadn’t seen you two around town ever before last time we met.”

+[Tell Knight Squeaksworth your names, about some of your adventures, and how you met {MONSTER_NAME}.]
#speaker: Knight Squeaksworth
“My, my those are quite some tales. Fitting for a heroic portrait if I do say so myself… but anyways I don’t want to hold you two up. 

Why don’t you take some of these melon buns for the road? I always buy too many, but the corner store always has a spectacular three for one deal that’d be a waste to pass up on.”
~ change_variable("hunger", amount_c)
->DONE

==space_5_interaction_3==
#speaker: Knight Squeaksworth
“Hey {pc_name} and {MONSTER_NAME}! I’ve gotten my creative spirit back lately. I remember that my inspiration came from people and things I’d never seen before, or stuff off the beaten path. Can I paint your portrait, {MONSTER_NAME}? I don’t have any money to compensate you but you can take this Joyful Meal I got earlier, it even has a toy in it!”
#speaker: Narrator
{MONSTER_NAME} seems ecstatic to pose for their portrait, practicing through different styles and looks.

+[“Absolutely, Knight!”]

	Knight begins painting and is silent for a bit before they speak…
#speaker: Knight Squeaksworth
“I’ve heard rumblings from some people that {MONSTER_NAME} is a monster. My two cents is that those words aren’t kind things to say. Plus even if you were a monster {MONSTER_NAME}, you’re the coolest one I’ve ever met; and I’ve met scarier monsters out there. Monsters that we’d say look normal on the outside. 

But it’s their destructive words and actions which are deadlier than a laser beam or a crushed building. You can see the damage it caused then. The stuff that isn’t always visible roots itself deep. 

I know that because I used to live among some real monsters in my past homes. So even if some people look at you and see a monster, take a moment to reflect on what you’ve done and not your appearance. It doesn’t often line up with the tall tales they tell amongst themselves.

Sorry I rambled there, but I like to fill up the space sometimes while I work. Take a gander at how awesome you look! And here’s some food for your troubles, these Joyful Meals are the best.”
~ change_variable("hunger", amount_c) 
->DONE

==space_5_interaction_4
#speaker: Knight Squeaksworth
“My two favorite muses! Welcome, welcome. I can’t wait to show you all my latest works!”
#speaker: Narrator
Knight pulls out their phone and begins to flip through pictures of pictures, sculptures, paintings, collages, and drawings.
 #speaker: Knight Squeaksworth
 “I haven’t felt this alive for quite awhile. Thank you both for helping me out of my slump. Please, take this for your troubles.”
#speaker: Narrator
Knight produces a gift basket of goodies. 
#speaker: Knight Squeaksworth
“I don’t usually splurge much outside of art supplies, but you two deserve a treat for all your inspiration. I’ve got to run but, please enjoy, au revoir!”
~ change_variable("hunger", amount_c) 
->DONE

==space_5_interaction_5==
#speaker: Knight Squeaksworth
“{MONSTER_NAME}, {pc_name}! I’m blessed to see you two again! Luckily I’ve got a new gallery show to display all my latest work at, and as a result I have a bit of pocket change to spare. I insist we all have a meal together, on me. I won’t hear no for an answer!”
#speaker: Narrator
Midway through your meal…
 #speaker: Knight Squeaksworth
“I’ve been meaning to ask… {MONSTER_NAME}, in your opinion, do you believe that you’re a monster?”
#speaker:Narrator
You take a moment and look deep into {MONSTER_NAME}’s eyes and gleam his answer.
+[“No.”]
#speaker: Knight Squeaksworth
“Hmmm… hm. Well, I’m glad to hear that you aren’t buying into what some people might say about you. Even if you were a monster though {MONSTER_NAME}, then I’d accept you all the same, whoever you are, or whoever you may be. 

I’ve been thinking, maybe being a monster doesn’t mean that one is always hurtful or acts the same way as another ‘monster’. There’s layers not everyone recognizes I suppose.

Thank you for being vulnerable and answering my question {MONSTER_NAME}, it was pretty personal. Now, let’s get back to savoring this meal. Oh and would you look at that! They’ve even got key lime pie on the specials menu! I could go for a slice…”
	~ change_variable("hunger", amount_c) 
	->DONE
	
+[ “Yes.”]

#speaker: Knight Squeaksworth
“Hmmm… hm. Well, if that’s who you are {MONSTER_NAME}, then I accept you as a monster wholeheartedly, whoever you are now, and whoever you may be. We’re all blessed to have you here with us, and I won’t try to change your mind. 

Maybe being a monster doesn’t mean that one is always hurtful or acts the same way as another ‘monster’. There’s layers not everyone recognizes I suppose.

Thank you for being vulnerable and answering my question {MONSTER_NAME}, it was pretty personal. Now, let’s get back to savoring this meal. Oh and would you look at that! They’ve even got key lime pie on the specials menu! I could go for a slice…”
    ~ change_variable("hunger", amount_c) 
->DONE

==space_5_interaction_6==
#speaker: Knight Squeaksworth
“I’m leaving this place soon. Don’t tear up my darlings, it won’t be forever I promise! It’s to show off my newest creations to the world; along with some older works I was too afraid to show anyone else before. 

At first I wanted to leave here to record the atrocities of the real monsters out there that I’ve seen; to hold their feet to the fire so someone knows what they do in the light and the dark. Though I don’t think I want to only create those pieces anymore. I’d rather create moments of joy; experiences we sometimes forget, or that we have trouble recognizing everyday. Forever sulking and grieving will NOT be the whole of the collection.

I promise to send letters to you both about my adventures. Maybe you two will be inspired to venture outside of this cozy little town as well.”
 
+[Hug Knight goodbye]
#speaker: Knight Squeaksworth
"I love you both so much. Ciao bella, {MONSTER_NAME} and {pc_name}!"
~ change_variable("hunger", amount_c) 
->DONE

==space_5_interaction_7==
#speaker:Narrator
A letter addressed to {MONSTER_NAME} and {pc_name} from Knight Squeaksworth is handed to you by the local postdog. 
#speaker: Knight Squeaksworth
“Dear {MONSTER_NAME} and {pc_name},

How are you two faring so far? Delightfully I’m hoping, though, however you are I’d love to genuinely hear. As for me, the train ride across the countryside was a welcome respite filled with many inspiring scenes, along with some new friendly faces. West Barkgundy awaits though! 

I found this gift card in my wallet for a local cafe back home. Since it’s of no use here, it’s better that you two grab some good grub.

Until next time,
	—Knight Squeaksworth”
	~ change_variable("hunger", amount_c) 
	->DONE
	
==space_5_interaction_8==
#speaker: Narrator
Another letter from Knight has arrived!
#speaker: Knight Squeaksworth
“Dear {MONSTER_NAME} and {pc_name},

There’s been some important moments of reflection in my life as of late. When I began creating my newest collection in the town, I placed the responsibility solely on your two shoulders. But my therapist reminded me of all the effort I put in, and how even when I place the control outside of myself, I’m the one doing the work. How I bring my value to my creations, not that my creations determine my value.

If you felt indebted somehow or that you had to do what I asked, I apologize. Or rather, thank you two for being kind friends. You two are wonderful beings. 

For your support, {MONSTER_NAME} and {pc_name}, I’ve included a small parcel of beginner art supplies, as well as some of the local candies from where I’m visiting. Go forth, dream big, dream beautiful, and create in whatever form it takes! 

Until next time,
—Knight Squeaksworth”
#speaker: Narrator
A collection of art supplies and an assortment of foreign candies has been gifted to you, which you can use however you see fit.
~ change_variable("hunger", amount_c)
->DONE

==space_5_interaction_9==
#speaker: Rosey
While walking through the art museum you ponder what Knight would have to say about some of these pieces. Though on second thought, they'd probably be answering your questions with more questions directed towards you. Maybe they'd be better as a docent and not a companion here.
->DONE

=== space_5_destroyed ===
# speaker: Narrator
This is where Knight Squeaksworth lived. 
A budding artist who had yet to see her full potential.
# speaker: Rosey
And now I wonder if she ever will... What do you think, bud?
# speaker: Narrator
{MONSTER_NAME} rolls around in her pets, painting his shell a brilliant ochre and cerulean blue.
~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_5|-> DONE}