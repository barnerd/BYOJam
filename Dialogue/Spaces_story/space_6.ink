
=== space_6 ===
{testing_in_ink == true: 
* [space_6_interaction_1] -> space_6_interaction_1
* [space_6_interaction_2] -> space_6_interaction_2
* [space_6_interaction_3] -> space_6_interaction_3
* [space_6_interaction_4] -> space_6_interaction_4
* [space_6_interaction_5] -> space_6_interaction_5
* [space_6_interaction_6] -> space_6_interaction_6
+ [space_6_interaction_7] -> space_6_interaction_7
- else: 
    {get_variable("is_current_destroyed"): -> space_6_destroyed}
    {not space_6_interaction_1: -> space_6_interaction_1}
    {not space_6_interaction_2: -> space_6_interaction_2}
    {not space_6_interaction_3: -> space_6_interaction_3}
    {not space_6_interaction_4: -> space_6_interaction_4}
    {not space_6_interaction_5: -> space_6_interaction_5}
    {not space_6_interaction_6: -> space_6_interaction_6}
    -> space_6_interaction_7
}

VAR travel_dice = 0

=== function roll_travel_dice() ===
~ travel_dice = RANDOM(2, 4)

=== space_6_train_explanation ===
# speaker: Narrator
At the train station, you can use the city's public transit to move forward spaces without consuming food or generating town panic. 
# speaker: Narrator
You can also choose to not take the train and just keep walking. 
-> space_6_trainspringforward

=== space_6_trainspringforward ===
~ change_variable("hunger", amount_b)
As you ready to leave the train station, you and {MONSTER_NAME} hit up the vending machines as you decide where you want to go next.
~ roll_travel_dice()

+ [Take train to travel forward {travel_dice} spaces] 
    # speaker: Train Conductor
    All abord!
    ~ move_player(travel_dice)
    {testing_in_ink:-> space_6|-> DONE}
///+ [Take train to travel backward xxx spaces] 
///    {testing_in_ink:-> space_6|-> DONE}
+ [Continue walking] 
    {testing_in_ink:-> space_6|-> DONE}

=== space_6_interaction_1 ===
# speaker: Narrator
You and {MONSTER_NAME} arrive in the town’s bustling train station. 
# speaker: Narrator
Trains whistle as they pull into station and the space is filled with hellos and goodbyes expressed in waves, hugs, and kisses. 
# speaker: Bandit
"Come on, Bluey. Let's go!"
# speaker: Narrator
You turn and see the DOG. 
# speaker: Narrator
The one teams of lawyers said you were never allowed to speak to, depict, or even mention under violent litigious threats. 
# speaker: Rosey
Come on, {MONSTER_NAME}! Let’s get out of here before we get sued!
-> space_6_train_explanation

VAR dodo_business = "undefined"

=== space_6_interaction_2 ===
# speaker: Narrator
Returning to the train station, your are stopped in your tracks by a despairing sigh that’s louder than the conductors's calls or train wheels' screech. 
# speaker: Narrator
You and {MONSTER_NAME} turn and see a weary traveler, a dodo in a business suit staring into the middle distance. 
# speaker: Business Dodo
Do you ever feel that somewhere walking down the boulevards of life that you’ve taken the wrong turn? 
# speaker: Business Dodo
That you stayed too long on the roundabout in your youth or went a full left when you should have done a <i>scant</i> left. 
In short, I feel like I used my phone's GPS when I should have traveled by the truest of navigators: <i>the heart!</i>
# speaker: Business Dodo
And now again I find myself at a crossroads, and I am lost as to where I should go next... 
# speaker: Business Dodo
Shall I stay the course and continue work at my family’s law firm? Or do I pursue my dream of opening a ceramics studio? 
# speaker: Business Dodo
Little girl, what do you think? My heart is out of practice leading me, so I turn to you in hopes that you haven't corrupted by the bitter vicissitudes of life.

* [Work for your parents and keep making that mo’nay] 
    ~ dodo_business = "money"
    # speaker: Business Dodo
	You’re probably right. And this way, I still can keep my health insurance. 
* [Do your business idea] 
	~ dodo_business = "art"
	# speaker: Business Dodo
	Why not? I have gone one way my whole journey, why not take a detour? And if I crash, I can always pick back up where I’ve left off. 

- # speaker: Business Dodo
Thanks for your advice. Maybe we’ll meet again on the highways and by-ways of life?
-> space_6_trainspringforward

=== space_6_interaction_3 ===
# speaker: Narrator
You walk along and meet a familiar figure. Their form is entirely unfamiliar but their voice, it’s like you’ve known it all your life. 

It’s me. I’m the narrator. 

Watch out for the rubble there. A construction crew just took down the fourth wall. 

I just wanted to stop by and tell you...

Honestly? I’m not a big fan. I’m allergic to dogs, kids are deeply exhausting to be around, and truth be told: I’m more of a cat person. 

Then again, it's hard to know if that's how I actually feel or if I'm just taking it out on you...
You see, I was in the running to be the narrator for Baldur’s Gate Three, and I think I'm still working through my disappointment about not getting it.
Anyways, I’ll let you get back to it. The construction crew is putting that wall back up right now...
-> space_6_trainspringforward

=== space_6_interaction_4 ===
# speaker: Narrator
You return to the train station and are met by that singular, salty sweet smell of onions. Someone is cutting onions right there in the station!
# speaker: Onion Man
“Uh oh. Looks like <i>someone</i> isn’t an onion fan!” 
# speaker: Bug
{MONSTER_NAME} paws at their eyes that grow heavy with tears. 
# speaker: Onion Man
“Now don’t be scared. Crying when someone cuts onions is a perfectly natural chemical response, even for a giant terrifying bug monster!” 
# speaker: Onion Man
“Here's a fun fact: when you cut an onion, it releases a gas called Propanethiol S-oxide. When mixed with certain enzymes in the onion, it creates a sulfur gas. These gases get to your face and create a mild acid which irritates your eyes.”
# speaker: Rosey
Thanks for that fact, but I don’t think that will really help {MONSTER_NAME}'s anxiety.
-> space_6_trainspringforward

=== space_6_interaction_5 ===
# speaker: Narrator
Arriving back at the train station, you stumble across a familiar face. It’s the business dodo battling with a vending machine to accept his crumpled five dollar bill.
# speaker: Business Dodo
So we meet again, fellow travelers!

{dodo_business== "money":
    # speaker: Business Dodo
    Like you suggested, I stayed with my parent’s business. 
    # speaker: Business Dodo
    After that bout of embarrassing existential despair, I’ve come back around to working at the family law firm. 
    # speaker: Business Dodo
    And honestly, life is fine! Or as well as it can be given the hellscape that is the state of current dog politics, our planet’s depleting resources, and the daily terrors of aging in dog years... 
    # speaker: Business Dodo
    But working at a solvent company means I get my own apartment and enough discretionary income to buy the expensive cheeses I like. 
- else: 
    # speaker: Business Dodo
    I took your advice and struck out on my own starting my own pottery business. 
    # speaker: Business Dodo
    I’m not going to lie, it’s been rough. My pottery 101 classes aren’t filled, I just discovered I’ve got rat-people living in the walls.
    # speaker: Business Dodo
    But I’m on my own journey, and I can’t wait to see where it goes -- where ever it might take me! 
    }
# speaker: Narrator
Glad you helped the dodo, you wave him goodbye and head off towards the train terminal.
-> space_6_trainspringforward

=== space_6_interaction_6 ===
# speaker: bug
{MONSTER_NAME}’s suddenly antennas quiver. 
# speaker: Narrator
Following his senses, the two of you run headlong into a door that you’ve never before. 
# speaker: Narrator
Inside is a coffee shop with impossibly tall ceilings. Four figures are hunched over laptops pounding away on keys. Another swims through the building's wifi even while he is half a country away.
# speaker: Narrator
The first, David fixes another Ink / Godot integration quirk.
# speaker: Narrator
Brooke orders fries for the whole table. (THANKS BROOKE!)
# speaker: Narrator
Doug is present in spirit, hard at work writing something amazing. 
# speaker: Narrator
Steve asks someone to plug his laptop in and says he'll think of something to say later for the "developer room" later. 
# speaker: Narrator
Because Ian wrote this, he’s doing something just impossibly <i>cool.</i>
# speaker: Narrator
He says something witty and apt. The whole room erupts into laughter.
# speaker: Ian
Hey, can I do a cross promotion for my mystery game? 
# speaker: Narrator
You quickly head out before he ruins the moment. 
# speaker: Narrator
As you walk outside, you strangely find yourself back in the train station.
-> space_6_trainspringforward

=== space_6_interaction_7 ===
# speaker: Narrator
You return to the pleasant commotion of the train station filled with passengers criss-crossing every which way. 
# speaker: Narrator
Your preschool teacher said that the world is moving through time and space, and here must be the proof since everyone is on the move.
# speaker: Narrator
You and {MONSTER_NAME} sit on a bench and spend a pleasant moment watching everything go by.
-> space_6_trainspringforward


=== space_6_destroyed ===
# speaker: Narrator
Ringo got a train set for his fourth birthday. It was his prized possession until Dad accidentally tripped over it and smashed the engine cars, the tracks, and the cardboard bridges and underpasses beneath his clumsy feet.
This is like but that only dog-scale in the real world train station.
There's twisted metal from the tracks, severed trains leaking black fluid, and downed powerlines everywhere that jolt with dangerous blue sparks.
If that's not bad enough, your parents say that traffic has somehow gotten even worse in the city.
~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_6|-> DONE}