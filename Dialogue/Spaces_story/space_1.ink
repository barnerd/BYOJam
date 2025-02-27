/// VAR pc_name = "Rosy"
/// MONSTER_NAME
/// Podcaster
/// ⚅

VAR kick_to_end_active = false
VAR locations_visited = 0

VAR moth_origin_found = false


==== space_1 ====
{moth_origin_found == true: 
-> space_1_moth_found_aftermath
}

{testing_in_ink == true: 
+ [space_1_interaction_1] -> space_1_interaction_1
- else:
{moth_origin_found == false: -> space_1_interaction_1}
}

=== space_1_interaction_1 === 

{space_1_interaction_1_explanation == false: -> space_1_interaction_1_explanation}
{space_1_interaction_1_tutorial == false: -> space_1_interaction_1_tutorial}


/// INVESTIGATE HUB OPTIONS
Where should we investigate?
{locations_visited >= 3:
+ [I think I know what made the egg...]
    -> space_1_guess
}

{space_1_interaction_1_bedroom == false: 
* [Investigate Bed Room] 
    ~ locations_visited += 1 
    ~ kick_to_end_active = true
    -> space_1_interaction_1_bedroom
- else:
+ [Revisit Bed Room] -> space_1_interaction_1_bedroom
}

{space_1_interaction_1_basement == false:
* [Investigate Basement] 
    ~ locations_visited += 1 
    ~ kick_to_end_active = true
    -> space_1_interaction_1_basement
- else: 
+ [Revisit Basement] -> space_1_interaction_1_basement
}

{space_1_interaction_1_kitchen == false:
* [Investigate Kitchen] 
    ~ locations_visited += 1 
    ~ kick_to_end_active = true
    -> space_1_interaction_1_kitchen
- else: 
+ [Revisit Kitchen] -> space_1_interaction_1_kitchen
}

{space_1_interaction_1_frontyard == false:
* [Investigate Front Yard] 
    ~ locations_visited += 1 
    ~ kick_to_end_active = true
    -> space_1_interaction_1_frontyard
- else: 
+ [Revisit Front Yard] -> space_1_interaction_1_frontyard
}


/// 

{testing_in_ink:-> space_1|-> DONE}

=== space_1_interaction_1_explanation === 
Hey there, listeners. This is Lotta Scoops, and you may know me from my podcast Small Town Killers, Little Murder in the Big City, and my latest series: It's Always the Boyfriend! 
Today, I'm launching a new season of my seminal show: Origins of a Monster. 
Though previously I focused on getting inside the head of the Monroe Street Murderer, this series is going to have a new different focus. 
Listeners, meet mild mannered, local sweet heart, {pc_name}. 
* [Is this going to be on streaming?]
    You better believe it! Just don't ask for any residuals. 
* [I'm going to say the worst words I know! <i>BUTT AND FARTS!</i>]
    Oh, sweetie, we say far worse words on this show.
- Let me explain. I was looking for new material for my true crime podcast, and when I saw your giant monsterthat seemingly came out of no where, I was like, hello? Opportunity? Is that <i>you</i> knocking on my door?
Together, you and I can get to the bottom of your bug's mysterious origins while creating a hit podcast! Win-win, especially for me. 
This could finally be the thing that gets me a sponsorship from Square Space. So far, they've said I'm too small time and that exclusively reporting on grizzly murders is "deeply exploitative of real world tragedy and those who are still working through their own grief."
Now tell me everything you can about the origin of your bug. I want to know it all! 
* [<i>Tell her everything that happened.</i>]
    -> space_1_interaction_1_add_2
* [<i>Say butts and farts again.</i>]
    You know I'm not broadcasting this live, right? 
    * * [<i>Tell her everything that happened.</i>]
        -> space_1_interaction_1_add_2
    * * [<i>Say poop.</i>]
        ...Okay, anything else? 
        * * * [<i>Tell her everything that happened.</i>]
            -> space_1_interaction_1_add_2
        * * * [<i>Say poop.</i>]
            Okay, let's just get it out of your system. 
            * * * * [<i>Tell her everything that happened.</i>]
                -> space_1_interaction_1_add_2
            * * * * [Ask her what other bad words she knows.]
                Ugh, just tell me about the day your moth appeared already!
                    * * * * * [<i>Tell her everything that happened.</i>]
                        -> space_1_interaction_1_add_2
        
        
== space_1_interaction_1_add_2 ==

<i>Last Thursday, you went to bed. It was a perfectly normal night, or so you thought. When you woke up in the morning, a strange EGG was sitting at the front of your bed.</i>
<i>You pushed the egg under your bed and three days later, it hatched into {MONSTER_NAME}.</i>
Fascinating! I'm going to go home and rerecord all of this with my ASMR voice, but the next time we meet, we're going to investigate this mystery for real. 
Here, have some trail mix for your trouble, and come find me soon. My fans are already waiting for the first episode!
{testing_in_ink:-> space_1|-> DONE}

=== space_1_interaction_1_tutorial ===
Good to see you again, {pc_name}! Ready to get investigating?
* [How does this work?]
* [I brought a magnifying glass]
    Very cute. Just try and keep your giant invertebrate friend and source of the mystery from stepping on the evidence. 

- So here's how it's going to work. There are <b>four</b> locations we can visit where we can search for clues.
After you've visited at least three of the four locations, feel free to take a guess as to your bug's origin. 
Now this isn't a "how-to" series, so let's get investigating!
-> space_1_interaction_1
{testing_in_ink:-> space_1|-> DONE}


== space_1_guess == 
+ [The moth came from demons]
    "Hmm, that's an interesting idea. There are all these chalk drawings around."
    "Plus there were those claw marks on the window, like something was trying to get in." 
    "But I don't think it could have been demons. After all, the whole family ate a big meal of garlic, which is a demonic deterrent per that book of yours."
    "Looks like we'll have to try figuring this out later..."
    "<i>Dang it. We'll have to try solving this next time we come here.</i>"
    {testing_in_ink:-> space_1|-> DONE}
+ [The moth came from a yeti]
    "I can see why you think that! Neighbor Greg exhibits the poor musical ability of a hirsute monstrosity." 
    "But as weird as he is, I don't think he's a yeti." 
    "That book of yours says yetis can never resist doing pranks, and if you remember: he watched your house the entire week!" 
    "And he didn't do any pranks, he fixed your microwave. So I don't think it can be him..."
    "<i>Dang it. We'll have to try solving this next time we come here.</i>"
    {testing_in_ink:-> space_1|-> DONE}
+ [The moth came from the tooth fairy]
    ~ moth_origin_found = true
    -> space_1_moth_origin_solved
+ [The moth came from aliens]
    "Now that's an intriguing thought! Aliens coming down and leaving a little piece of themselves with us."
    "And it makes sense, you did talk about being very disoriented when you woke up that morning." 
    "Unfortunately, it can't be them because they're terrified of fish, and guess what you have on your wall, next to where you sleep?" 
    "That's right: a giant poster of an aquarium with pictures of all those fish." 
    "No, I don't think it's aliens, as exciting as that would be..."
    "<i>Dang it. We'll have to try solving this next time we come here.</i>"
    {testing_in_ink:-> space_1|-> DONE}


=== space_1_moth_origin_solved ===
"The tooth fairy, huh?" 
"I suppose it does make sense..." 
"When we talked about the dinner you ate the night before, you talked about eating slowly for unknown reasons." 
"Then there's the tassles that you bought, even though your parents cut off your allowance." 
"Then there's the matter of the light." 
"Neighbor Greg said he saw an orange light the night the egg appeared in your room." 
"But then we learned separately that he always wears yellow glasses at night."
"So we can conclude that the color he wasn't orange, but red! It only looked orange because he saw them through his yellow tinted glasses."
"But I don't understand... How did the tooth fairy go from giving you money for a tooth to giving you a giant weird monster moth?" 

"Wait until my viewers hear this! I'm going to start livestreaming our discovery right now!"
Just when Lotta hits the record button, there is a BURST of light!
"Don't hit that record button."
A strange figure appears before the three of you. It's... THE FREGGIN' TOOTH FAIRY. 
I'll explain everything provided you don't spill the beans on me!
You and Lotta share a look. Lotta stops recording. 

The tooth fairy clears their throat. 

Over the centuries, I've collected a lot of teeth. In fact, I've been keeping count. Last week, I got up to 999,999,041. 
You fly around the globe, paying kids money for teeth, you wind up getting a little bored. 
So I thought, I'd mix things up for my billionth tooth collected. 
I decided to grant a wish to the lucky kid who would have the billionth tooth that I collected. 
And wouldn't you know it: it was this little girl righ here. 
I asked her what she wanted, and I'm not sure if she heard me. But she had on that mouthguard of hers and was mumbling something about her mom. 
I poked her, and she shouted: "BIG BAD MOMTH."

Or that's what it sounded like to me. A fairy's magic is binding, and so even though I knew she meant mom, my magic created her an egg which turned into this big giant moth. 
Anyways, magic's real, and your neighbor is a half yeti, bye!

With that, the tooth fairy departs in a puff of smoke. 

Lotta Scoops stares slackjawed. 
Wow. My listeners are never going to believe this. 

Well, thanks for helping me solve the mystery. I doubt I can turn this into a binge-worthy podcast, but at least we got to the bottom of it. 
Here, have come chocolate for your trouble. 

If you need anymore, come swing by the stuido, and I can get you and your tooth fairy creation fed!
With that, Lotta exits. 
You pat {MONSTER_NAME}. 
* [It doesn't matter where you came from, you'll always be my bud.]
    {MONSTER_NAME} licks your face, nearly knocking you over. 
* [I'm going to name you Toothy!]
    ~ MONSTER_NAME = "Toothy"
- <i>Case closed!</i>
{testing_in_ink:-> space_1|-> DONE}


== space_1_moth_found_aftermath ==
You visit Lotta in her recording studio. 
She's in the middle of doing voice over for her podcast about a string of horrifying murders committed in the seventies.
You and {MONSTER_NAME} grab some snacks and leave her to recording.
{testing_in_ink:-> space_1|-> DONE}
