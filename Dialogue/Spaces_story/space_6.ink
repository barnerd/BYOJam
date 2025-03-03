
=== space_6 ===
{testing_in_ink == true: 
* [space_6_interaction_1] -> space_6_interaction_1
* [space_6_interaction_2] -> space_6_interaction_2
* [space_6_interaction_3] -> space_6_interaction_3
* [space_6_interaction_4] -> space_6_interaction_4
* [space_6_interaction_5] -> space_6_interaction_5
* [space_6_interaction_6] -> space_6_interaction_6
* [space_6_interaction_7] -> space_6_interaction_7
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
~ change_variable("hunger", amount_c)
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
"Come on, Bingo. Let's go!"
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
Returning to the train station, your are stopped in your tracks by a despairing sigh that’s louder than the call of the conductors and the screech of the wheel. 
# speaker: Narrator
You and {MONSTER_NAME} turn and see a weary traveler, a dodo in a business suit staring into the middle distance. 
# speaker: Business Dodo
Do you ever feel that somewhere walking down the boulevards of life that you’ve taken the wrong turn? 
# speaker: Business Dodo
That you stayed too long on the roundabout or went a full left when you should have done a scant left. In short I feel like I used the GPS when I should have traveled by the truest of navigators: the heart. 
# speaker: Business Dodo
And now again I find myself at a grand a crossroads, and I am again lost as to where I should go. 
# speaker: Business Dodo
Shall I stay the course and continue work at my family’s law firm? Or do I pursue my dream of opening a ceramics studio? 
# speaker: Business Dodo
Little girl, what do you think? 

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
You walk along and meet a familiar figure. 
# speaker: Narrator
Their form is entirely unfamiliar but their voice, it’s like you’ve known it all your life. 
# speaker: Narrator
It’s me. I’m the narrator. 
# speaker: Narrator
Watch out for the rubble there. A construction crew just took down the fourth wall. 
# speaker: Narrator
I just wanted to stop by and tell you...
# speaker: Narrator
Honestly? I’m not a big fan. It’s nothing personal. I’m just allergic to dogs, and I think kids are a little much for me. 
# speaker: Narrator
Truth be told I’m more of a cat person. 
# speaker: Narrator
And if I’m being honest, I was in the running to be the narrator for Baldur’s Gate Three, and I’m still working through my disappointment about not getting it.
# speaker: Narrator
Anyways, I’ll let you get back to it. The construction crew is putting that wall back up right now...
-> space_6_trainspringforward

=== space_6_interaction_4 ===
# speaker: Narrator
You return to the train station and are met by that singular, salty sweet smell of onions. 
# speaker: Bug
{MONSTER_NAME} wrinkles their buggy nose and turns away. 
# speaker: Onion Man
“Looks like someone isn’t an onion fan.” 
# speaker: Bug
{MONSTER_NAME} paws at their eyes that grow heavy with tears. 
# speaker: Onion Man
“Now don’t get scared. That’s all natural.” 
# speaker: Onion Man
“When you cut an onion, it releases a gas called Propanethiol S-oxide. When mixed with certain enzymes in the onion, it creates a sulfur gas. These gases get to your face and create a mild acid which irritates the eyes.”
# speaker: Rosy
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
    After that wobble I had about all my existential despair, I think I’ve come back around to working at their business. 
    # speaker: Business Dodo
    And honestly, life is fine! Or as well as it can be given the hellscape that is the state of current dog politics, the planet’s depleting resources, and the daily terrors of aging. 
    # speaker: Business Dodo
    And working at a solvent company means I get health insurance, my own apartment, and discretionary income to buy the expensive cheeses I like. 
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
Steve asks someone to plug his laptop in and tells Ian that he'll think of something to say later for the "developer room" later. 
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