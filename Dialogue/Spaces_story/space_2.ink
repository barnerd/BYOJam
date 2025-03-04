== space_2 ==

/// IAN NOTE: I need to review the code for this space to make it work as intended. If there's time, I'll come back to this.

/// Adding in destroyed space and thread
{get_variable("is_current_destroyed"): -> space_2_destroyed}

{not space_2_interaction_1: -> space_2_interaction_1}
{not space_2_interaction_2: -> space_2_interaction_2}
{not space_2_interaction_3: -> space_2_interaction_3}
{not space_2_interaction_4: -> space_2_interaction_4}
{not space_2_interaction_5: -> space_2_interaction_5}
{not space_2_interaction_6: -> space_2_interaction_6}
->space_2_interaction_7


==space_2_interaction_1==
#speaker: Narrator
The weather is gorgeous, so the lake is full of people out fishing today. However, most of them are having no luck. 

{MONSTER_NAME} is determined to see what a fish looks like though. 

#speaker: Narrator
{MONSTER_NAME} darts away from your side towards the lake. Reaching a superspeed faster than your paws can carry you, they take off across the surface of the lake. 

Suddenly tons of fish start flopping out of the water trying to take a bite out of {MONSTER_NAME}’s body.

In the fishes' fruitless endeavors, their mouths become hooked, or their bodies land on the ground. This is the biggest bounty anyone has ever seen, plus 

{MONSTER_NAME} is ecstatic to have finally seen a fish!
~ change_variable("hunger", amount_e)
->DONE
	
==space_2_interaction_2==
#speaker: Narrator
There’s a notice at the entrance to the lake:
	
	BY THE ORDER OF THE DOGPARTMENT OF NATURAL RESOURCES: NO FISHING FOR A MONTH DUE TO OVERFISHING. FINE OF UP TO 2500 BONES AND GAME LICENSE SUSPENSION. 

Looks like last week’s ruckus might have caused a bit too much commotion, better steer clear of here for a bit. Your stomach’s rumble with guilt and puts off your collective appetites for a bit.
~ change_variable("hunger", amount_c)
->DONE

==space_2_interaction_3==
	#speaker: Narrator
Another gorgeous day with perfect weather, and lots of families are out barbecuing. Almost everyone is playing fetch with their pets. Maybe joining a group would be fun!

Everybody loves {MONSTER_NAME}! So much so that the ground is left much messier than before, and mud is plastered across all the pavilion buildings. 

Everyone has worked up an appetite from all the exercise, but thankfully there’s more than enough BBQ to go around. 

You’re even able to leave with a doggy bag of leftovers!
~ change_variable("hunger", amount_e)
->DONE

==space_2_interaction_4==
	#speaker: Narrator
A second notice has popped up at the entrance to the lake under the first: 

BY THE ORDER OF THE DOGPARTMENT OF PARKS AND RECREATION: PICNIC PAVILIONS UNDER REPAIR UNTIL FURTHER NOTICE. PLEASE PARDON OUR DUST.

Welp, another endeavor failed successfully. Better be more careful next time. 
~ change_variable("hunger", amount_c)
->DONE


==space_2_interaction_5==
#speaker: Narrator
A few days ago there was a flyer for a cosplay contest taking place at the lake’s amphitheater today. Everybody is dressed up in such cool costumes! 

There’s a Dwayne the Rock Johnson (though they may be more of a look alike than a cosplay, or is it actually him???), 

a Saber, a Joel and Ellie duo, a group doing the main characters from the Last Airbender, and a Godzilla who has recently stepped up on stage. 

<i>Uh oh…</i>

{MONSTER_NAME} rushes at the Godzilla cosplayer with a buzzing fervor. The crowd begins to cheer with enthusiasm! 
#speaker: Narrator
The cosplayer is confused at first but starts to pose in different fighting stances, to which {MONSTER_NAME} screeches then unleashes a small beam that clips off the top of the Godzilla’s foam head. 

The judges glance at each other then huddle to confer. 
#speaker: Knight Squeaksworth
I’ve never seen a better group cosplay!
#speaker: Kayleigh
The dramatic display, the effects and all, I’m awestruck!
#speaker: Simon Cowell
I hesitate to call that <i>perfection…</i>
#speaker: Knight Squeaksworth
Can it Cowell!
#speaker: Narrator
A 10, a 10, and a 9. A near perfect score!

The cosplayer, gathering their senses, grabs one of {MONSTER_NAME}’s limbs and raises it up in mutual victory.

Not one to look a gift monster in the mouth, you’re awarded the grand prize of a contest with Godzilla: A huge box of snacks, candies, noodles, tea, along with a year long subscription to CrunchyRoll. 

What a steal!
~ change_variable("hunger", amount_e)
->DONE


==space_2_interaction_6==
	#speaker: Narrator
A third sign has popped up under the previous two:
 
WARNING: THE ENVIRONMENTAL PUPTECTION AGENCY HAS DETECTED TRACE AMOUNT OF RADIATION IN THE AREA. ENTER AT YOUR OWN RISK.
#speaker: Rosey

{MONSTER_NAME}, we may have done a bit too much damage here, I’m starting to feel a bit queasy…
~ change_variable("hunger", amount_c)
->DONE

==space_2_interaction_7==
# speaker: Narrator
A placid lake rests undistrubed by the the world. To change that peace would be a grave shame, so perhaps we ought to move on.
->DONE

=== space_2_destroyed ===
# speaker: Narrator
The lake is dried out. The park trampled and the play structure is in ruins. 
# speaker: Bug
{MONSTER_NAME} gazes upon his mighty work with a satisfied roar. 
~ coin_flip_for_panic_generatior()
-> DONE
