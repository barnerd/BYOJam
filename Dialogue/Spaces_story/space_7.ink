== space_7 ==

{get_variable("is_current_destroyed"): -> space_7_destroyed}

{not space_7_interaction_1: -> space_7_interaction_1}
{not space_7_interaction_2: -> space_7_interaction_2}
{not space_7_interaction_3: -> space_7_interaction_3}
{not space_7_interaction_4: -> space_7_interaction_4}
{not space_7_interaction_5: -> space_7_interaction_5}
{not space_7_interaction_6: -> space_7_interaction_6}
{not space_7_interaction_7: -> space_7_interaction_7}
{not space_7_interaction_8: -> space_7_interaction_8}
->space_7_interaction_9



=== space_7_firetruck_ride ===
~ roll_travel_dice()
+ [Ride in the firetruck and travel forward {travel_dice} spaces] 
    # speaker: Ruby
    Hold on tight!
    ~ move_player(travel_dice)
    {testing_in_ink:-> space_7|-> DONE}
///+ [Take train to travel backward xxx spaces] 
///    {testing_in_ink:-> space_6|-> DONE}
+ [Continue walking] 
    {testing_in_ink:-> space_7|-> DONE}

==space_7_interaction_1==
#speaker: Ruby
Come on, come down here Whiskers. It’s safe. I promise that I’ll catch you!
Drat! I thought that would work for sure… UGGGH, if only I had brought a ladder with me. 

I just had to be on lunch break when the diner owner’s cat got stuck in a tree. What in Dog’s name do I do now?

 +[Have your pet screech at the cat.]
#speaker: Narrator
{MONSTER_NAME} musters all his strength, letting the air seep deep within, and then unleashes a guttural screech. Whiskers’ fur is blown back, his claws loosen their grasp, and his body leaps to the ground. He scores a perfect ten point landing into the arms of Ruby!
#speaker: Ruby
Well darn, all I needed was a louder megaphone this whole time! Thanks for your help getting Whiskers down safely. I’ll be sure to tell Whiskers’ owner about the kind strangers who help me out.
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride
+[Chuck your pet at the cat.]
#speaker: Narrator
	You gaze deep into {MONSTER_NAME}’s eyes. You ask: Do you trust me? {MONSTER_NAME} thinks for a moment then nods with confirmation. You scoop {MONSTER_NAME} up like a football and chuck him at Whiskers. 
	
	In a flash, Whiskers eyes are greeted with the sight of something they’ve never witnessed before. Whiskers loosens their grasp on the tree branch. They leap into one of Ruby’s hands, and the other hand catches {MONSTER_NAME}.
	#speaker: Ruby
“A bit unorthodox if I say so myself, but hey it worked! Good thing I played football back in highschool. Here’s your uh, pet, back. Thanks for the help, I gotta tell the squad down at the station about this one, hahahaa!”
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_2==
#speaker: Narrator
	You see Ruby walking up the driveway of an elderly neighbor’s house.
#speaker: Ruby
"Hey friends, happy to see you two again! Would you mind joining me for this wellness check? Old dog Barkson enjoys having fun visitors, and I forgot to bring the squad’s emotional support iguana, Larry, with me.

Plus Barkson likes giving away his spare change, so your good deed won’t go unrewarded. What do you say?"
+["Sure, let’s go {MONSTER_NAME}!"]
	
	#speaker: Narrator
You, {MONSTER_NAME}, and Ruby go in and check on Old dog Barkson. He’s intrigued by {MONSTER_NAME} and asks to hear what hijinks you youths have gotten up to these days. After a few stories and a refreshing round of tea and cookies, he sends you on your way with ten bones. 
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_3==
#speaker: Narrator
While passing the fire station you see Ruby outside in the yard with a group of pups.
#speaker: Ruby
"Now remember, smoke rises up so you have to get down low and crawl out. Because if you breathe smoke it's real icky and deadly. Now can anyone tell me what to do if your clothes catch on fire?"
+[ “Stop, ‘Play Dead’, and Roll!”]
	#speaker: Ruby
“That’s right! Could you demonstrate for all these pups what that looks like?"
	#speaker: Narrator
	You and {MONSTER_NAME} both demonstrate how to Stop, ‘Play Dead’, and Roll. The pups all cheer and run to pet {MONSTER_NAME} afterwards.
~ change_variable("fear", amount_a*-1)
-> space_7_firetruck_ride

==space_7_interaction_4==
	#speaker:Narrator
Sirens and lights are going off in a flurry as the firetruck stops across the street from you and {MONSTER_NAME}. 

Looking over, you see one of the local stores ablaze. Ruby and her squad are already on the scene, attaching the hose to a fire hydrant and busting into the store to get everyone out. But for some reason the water isn’t coming out of the hose. That’s when you spot that in all the panic, a passing car ran over the hose and tore open a hole. 

+[Use {MONSTER_NAME}’s saliva to patch up the hose.]
	#speaker: Ruby
"Thank you both! Come by the station sometime soon and I’ll be sure to give you two a tour! I wouldn’t have been able to put out that fire without your help!"
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

+[Use {MONSTER_NAME}’s ice beam to put out the fire.]
	
	#speaker: Ruby
"Now that was something to behold! 

If I had the power to shoot off ice beams from my ears, I’d never retire. Why don’t you two come on down by the station sometime soon and I’ll give you both a tour! I wouldn’t have been able to put out that fire without the help!"
	 ~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_5==
#speaker: Narrator
Ruby invites you into the station for a tour, and everybody is delighted to see you here. There’s a banner with {MONSTER_NAME}’s name, a cake, and streamers galore.  
	#speaker: Ruby
"Everybody was so impressed by your quick thinking at that fire, that we decided to celebrate and make {MONSTER_NAME} our station’s new mascot. What do you say?"
+[“Count me in!”]
#speaker: Ruby
"Hooray! Make room Larry, there’s a new member on the squad!"
#speaker: Narrator
Larry, wearing his little firefighter helmet, snaps a fly out of the air with his tongue and blinks at {MONSTER_NAME}. He doesn’t really seem to know what's going on, but he’s enjoying the vibes.
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_6==
#speaker: Narrator
You see Ruby outside the station repainting her firetruck. It would probably be nice to lend a hand. 

+[Lend a hand.]

You help out and feel a sense of warmth inside yourself. {MONSTER_NAME} smiles at you, joyful for a little break from anything too dramatic.
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_7==
#speaker: Ruby
"Hey (player), it’s getting to that time of year where the air is dryer than a bone, which means everyone has to be aware of what not to do during wildfire season. As passionate as I am about fire safety I’ve got a horrendous case of stage fright. Plus Larry isn’t the talkative type. 

Would you and {MONSTER_NAME} be willing to give the town a Fire Safety PSA tonight? Remind them that only they can help prevent wildfires."

+[“We can’t bear to not help out. We don’t want a smokey town after all.”]
#speaker: Narrator
Everyone having heard of your adventures is excited to see {MONSTER_NAME} on stage. They all cheer as you point out how to minimize the chance of total ecological catastrophe. 
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_8==
	#speaker: Narrator
Ruby invited you two down to the station again to grab a picture of {MONSTER_NAME} for the upcoming wildfire prevention posters. However upon entering…
#speaker: Ruby
"WE’RE GONNA DIE, WE’RE ALL GONNA DIE! SOMEBODY GET THE FLAMETHROWER, I DON’T CARE HOW MUCH DAMAGE WE HAVE TO REPAIR! WHAT DO YOU MEAN WE ONLY HAVE WATER????!?! I THOUGHT WE WERE THE FIRE DEPARTMENT!!!"
#speaker: Narrator
Desks are flipped over, half the squad is running around, one firefighter has begun penning their will, and Ruby is backed into a corner as far away from the thing she’s pointing at on the floor… a spider.  
+[Have {MONSTER_NAME} deal with the spider.]
#speaker: Narrator
{MONSTER_NAME} swoops down to the floor, whispering to the spider. After a second it hops on {MONSTER_NAME}’s back and they leave the station together. Moments later {MONSTER_NAME} reenters, spiderless.
#speaker: Ruby
"WHEW! I for sure thought the station was a goner. Fires are one thing, but spiders? Absolutely not. That’s why I’m making the executive decision to make you both honorary firefighters! We’ll get you your helmets pronto!"
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

+[Open Larry’s tank.]
#speaker: Narrator
You and {MONSTER_NAME} look at each other and then back at the scene. The only calm being here is Larry in his tank. {MONSTER_NAME} goes over to the tank and lets Larry out. Larry wanders out and begins to crawl towards the spider at a breakneck speed of an uninterested reptile. Finally close enough to the spider he fwhips his tongue out, devouring the wretched beast. 

#speaker: Ruby
"By Doggy I thought the station was a goner! I’m glad to see we still had someone with enough courage here. I’m repromoting you to the station mascot Larry, here’s your fire helmet back!"
#speaker: Narrator
Ruby places the tiny helmet back on Larry’s head. Larry simply continues to wander the station looking for more bugs to eat. Deciding you’d rather not be a part of the clean up you and {MONSTER_NAME} leave the station, hoping never to encounter another spider there ever again.
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

==space_7_interaction_9==
#speaker: Rosey
Looks like Ruby is out on a call right now, helping whereverver she can. She's an amazing dog! Let's hope there's no serious emergencies going on.
~ change_variable("fear", amount_b*-1)
-> space_7_firetruck_ride

=== space_7_destroyed ===
# speaker: Narrator
You return to the fire station and find that ironically, it's burnt down. 
You wonder what happened to brave, kind hearted Ruby when you see {MONSTER_NAME} drinking right from the station's hose that's still somehow gushing water.
You're interupted from your mourning as you try to haul him away. 

~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_7|-> DONE}