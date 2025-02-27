/// need to hook this up with Godot stat. 
VAR current_moth_state = "caterpillar" /// "cocoon" /// "moth"


VAR dice_1_result = 0
VAR dice_2_result = 0
VAR dice_3_result = 0
VAR dice_4_result = 0
VAR dice_5_result = 0

VAR roll_success = false

/// === function die_result_comparer(threshold) ===


=== function print_dice_results() ===
    {dice_1_result > 0: {dice_1_result}   }<>
    {dice_2_result > 0: {dice_2_result}   }<>
    {dice_3_result > 0: {dice_3_result}   }<>
    {dice_4_result > 0: {dice_4_result}   }<>
    {dice_5_result > 0: {dice_5_result}}

=== function roll_dice(number_dice, threshold) ===
    {
    -number_dice == 1:
        ~ dice_1_result = RANDOM(1, 6)
        ~ dice_2_result = 0
        ~ dice_3_result = 0
        ~ dice_4_result = 0
        ~ dice_5_result = 0
    -number_dice == 2:
        ~ dice_1_result = RANDOM(1, 6)
        ~ dice_2_result = RANDOM(1, 6)
        ~ dice_3_result = 0
        ~ dice_4_result = 0
        ~ dice_5_result = 0
    -number_dice == 3:
        ~ dice_1_result = RANDOM(1, 6)
        ~ dice_2_result = RANDOM(1, 6)
        ~ dice_3_result = RANDOM(1, 6)
        ~ dice_4_result = 0
        ~ dice_5_result = 0
    -number_dice == 4:
        ~ dice_1_result = RANDOM(1, 6)
        ~ dice_2_result = RANDOM(1, 6)
        ~ dice_3_result = RANDOM(1, 6)
        ~ dice_4_result = RANDOM(1, 6)
        ~ dice_5_result = 0
    -number_dice == 5:
        ~ dice_1_result = RANDOM(1, 6)
        ~ dice_2_result = RANDOM(1, 6)
        ~ dice_3_result = RANDOM(1, 6)
        ~ dice_4_result = RANDOM(1, 6)
        ~ dice_5_result = RANDOM(1, 6)
}

    
    ~roll_success = false
    
    {
    - dice_1_result > threshold: 
        ~roll_success = true
    - dice_2_result > threshold: 
        ~roll_success = true
    - dice_3_result > threshold: 
        ~roll_success = true
    - dice_4_result > threshold: 
        ~roll_success = true
    - dice_5_result > threshold: 
        ~roll_success = true
}
 
 
VAR battle_current_number_dice = 0

=== function dice_pool_based_on_size() ===
~ battle_current_number_dice = 0
{
- current_moth_state == "caterpillar": 
    ~ battle_current_number_dice = 1
- current_moth_state == "cocoon":
    ~ battle_current_number_dice = 2
- else:
    ~ battle_current_number_dice = 3
}



=== space_12_test ===
This is space 12.
~ roll_dice(3, 7)
~ print_dice_results()
{roll_success== true: 
    success
- else: 
    Fail
}
Pools
-> DONE


== space_12_outline ==
Intro where you do an easy, unwinnable fight. IDEA: You save him from a bully. 

Intro where you do an easy, unwinnable fight. IDEA: You save him from a bully's gang. 

You and your brother to beat up your bully's father. 
You and your brother to beat up your bully's father's father. 
You must battle your own brother who has turned into a mecha-bro. 

You must reason with your brother who was desperate for the power. You muse on the universally alluring yet always corrupting force of power. And yet, there must be power exercised to maintain a society. How do you keep from losing yourself? If only we knew..

/// side note: I need to figure out how to do these side stories. Ideally though something like a loop. 
RANDOM ONE LINERS
-> DONE



VAR current_foe = "level_1_bully"
VAR current_fight_intro_heard = false
VAR fights_concluded = false

=== space_12 === 

{
- testing_in_ink == true: 
    * [space_12_interaction_1] -> space_12_interaction_1
    * [space_12_interaction_2] -> space_12_bullyno2_intro
    * [space_12_interaction_3] -> space_12_bullyno3_intro
    * [space_12_interaction_4] -> space_12_bullyno4_intro
- else:
    {fights_concluded == true: -> space_12_fights_concluded}

    {current_foe == "level_1_bully" && current_fight_intro_heard == false: -> space_12_interaction_1}
    {current_foe == "level_1_bully" && current_fight_intro_heard == true: -> space_12_interaction_1_fight_1_resume}
    
    {current_foe == "level_2_bully" && current_fight_intro_heard == false: -> space_12_bullyno2_intro}
    {current_foe == "level_2_bully" && current_fight_intro_heard == true: -> space_12_bullyno2_resume}
    
    {current_foe == "level_3_bully" && current_fight_intro_heard == false: -> space_12_bullyno3_intro}
    {current_foe == "level_3_bully" && current_fight_intro_heard == true: -> space_12_bullyno3_resume}
    
    {current_foe == "level_4_bully" && current_fight_intro_heard == false: -> space_12_bullyno4_intro}
    {current_foe == "level_4_bully" && current_fight_intro_heard == true: -> space_12_bullyno4_resume}
    
}    

== space_12_interaction_1 == 
You and {MONSTER_NAME} head down the street when you are interrupted by a piercing SCREAM. 
"Big sister, help!" 
You and your bug race around the corner to see your brother Ringo being shaken down by neighborhood bully Chad." 
"{pc_name}, you gotta save me! He's trying to take my lunch money!" 
The bully looks to you with a smirk. 
"You think I'm scared of your sister and her abnormally large bug monster? Don't make me laugh! I'm Chad Lynch, baby!"
* [Tell {MONSTER_NAME} to attack]
* ["How about we negotiate?"]
    "Sis, you can't negotiate with Chad! The only language he speaks is violence." 
    "I can't understand what you're saying, so I'm just going to keep punching." 
    "See what I mean, sis? Also-- ow! Owww!" 
        * * [Let's fight!] 
        * * ["Have we really exhausted all non-violent options?"]
            "Sister, if you don't do something, he's going to exhaust me-- <i>of living!</i>. 
            * * * [Okay, fight time!]
            * * * [I just think we weirdly valorize violence as a society, so I want to be careful.]
                "Sister, I'm only five, and I am getting punched. In the face. <i>A lot!</i>"
                * * * * ["Okay, enough being difficult. It's fight o' clock."]
                * * * * [Maybe I like watching you get hurt?]
                    "If you don't help me, I'll tell Mom and Dad you ate the box of jelly beans.
                    * * * * * [Okay, I'll fight your bully.]
            
- "Okay, but first let me tell you how bug fighting works."
"I learned everything I know after I made two ant farm societies wage a brutal three day war to fight for possession of a molding banana." 
"Here's how it works: you'll roll a number six sided dice based off your monster's current size. 

{
- current_moth_state == "caterpillar": 
    "Your beast is still on the shrimpy end, so you'll roll one six sided die."
- current_moth_state == "cocoon":
    "Your beast is getting chunky, so you'll roll two six sided dice."
- else:
    "Your beast is big time, so you'll roll three six sided dice."
}

All you need to do is get at least one result that is greater than or equal to the bullie's challenge value. 
Chad is kind of a pushover, so his challenge value is a measly two. That means all you need to beat him is a result of two or higher. 

"If you want, your monster can flex before the fight. This will raise the town's panic; but it'll give you an extra dice." 
"And watch out! If you lose, your current enemy will take some of your lunch, lowering {MONSTER_NAME}'s hunger." 
"Okay, so what are you going to do?" 
~ current_fight_intro_heard = true
~ dice_pool_based_on_size()
-> space_12_interaction_1_fight_1

/// It's annoying that functions can't contain diverts ///

== space_12_interaction_1_fight_1_resume == 
You return to the street and find Chad once again shaking your little brother down for money. 
"There you are, sis! Save me from Chad already!" 
-> space_12_interaction_1_fight_1


== space_12_interaction_1_fight_1 == 
"Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 2. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_interaction_1_fight_1
}
+ [Fight!]
    -> space_12_interaction_1_fight_1_chad
+ [Flee] 
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} run for the hills. 
    {testing_in_ink:-> space_12|-> DONE}

== space_12_interaction_1_fight_1_chad ==
{MONSTER_NAME} squares up against Chad. The air crackles with tension.
"Your bug ain't no match for my left hook!"

~roll_dice(battle_current_number_dice, 2)
/// Need to find a way to make this not appear on the same line. 
You rolled... <>
~print_dice_results()

{
- roll_success == true: 
    
    -> space_12_interaction_1_fight_1_chad_success
- else:     
    -> space_12_interaction_1_fight_1_chad_fail
}
    



== space_12_interaction_1_fight_1_chad_success ==
Young chad taunts you, flexing his arms with flesh that you aren't sure is fat or muscle. 
In the middle of him attempting to do a one handed push up, {MONSTER_NAME} ambles over and knocks him aside with one flick of his mighty pincer. 
Chad just goes flying over a neighbor's fence and lands face first in a hedge bush. 
"Sister, that was amazing! Your giant bug saved me!" 
/// chad
"My whole body hurts..." 
/// ringo
"As a reward for helping me, I'll work with mom to make you and {MONSTER_NAME} an extra big snack when you cross twelve space twelve and come back home. 
/// Explain numbers here. 
"Come back again soon. I've got a feeling we haven't heard the last from Chad..." 
~ current_foe = "level_2_bully" 
~ current_fight_intro_heard = false
{testing_in_ink:-> space_12|-> DONE}


== space_12_interaction_1_fight_1_chad_fail ==
Your bug charges, but young Chad uses his comparitevely diminutive size to dodge {MONSTER_NAME}'s attack.
Your beast gets themselves stuck in the side of a building, and Chad reins a flurry of enthusiastic if ineffective blows on {MONSTER_NAME}'s carapace.
What really hurts is when Chad manages to steal food you meant to give your pet. 
/// ringo
"Too bad, sis. Looks like you'll have to try this again next time." 
{testing_in_ink:-> space_12|-> DONE}


/////////////////////////////////////////////////////////////////////


=== space_12_bullyno2_intro ====

~ current_fight_intro_heard = true

"{pc_name}! <i>{pc_name}!</i>"
"Remember when you beat up Chad with your enormous bug pet?"
"I thought that after he'd been humbled and that he'd finally take it easy." 
"But Chad is fury given abs and the cracking voice of a tween retriever." 
"As soon as you left, he started talking about kicking your bug's thorax so hard that it would break the and boundaries of known and unknown worlds." 
"He said that aliens would come from across the galaxy to research and study how a butt was kicked to levels theoretical scientists didn't think possible!" 
The guy's serious. He even enrolled in a karate class but for <i>adults!<i>
Look alive, sis. He's here. 

Young chad eats muscle powder straight from the jug and tosses the empty container aside where it rolls across the road like a tumbleweed.
He rolls his shoulders. His muscles cracking like thunder. 

Get ready, sis. Looks like it's round two for you and Chad!
This time, his challenge value is 3! So you'll need a three or higher to beat him.
~ dice_pool_based_on_size()
-> space_12_bullyno2_battle


== space_12_bullyno2_resume ==
Sister, there you are! 
Chad has been shouting for a rematch all day. His voice is hoarse, and no one's been able to sleep because he keeps calling for a fight!
~ dice_pool_based_on_size()
-> space_12_bullyno2_battle

== space_12_bullyno2_battle == 
"Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 3. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        ~ battle_current_number_dice += 1
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno2_battle
}
+ [Fight!]
    -> space_12_bullyno2_fight
+ [Flee] 
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    "Coward!"
    {testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno2_fight ===
/// Chad
Since last we last met, I have watched all the youtube fitness guys my algorhythms sent me.
I bought a gym membership and workout clothes that aren't just t-shirts that are too ratty to wear anywhere else.
I have spent every moment since our last meeting angling on how to best you, how to make sure you taste the bitter sting of defeat.
I hope you face your doom honorably.
Let us... begin!


~roll_dice(battle_current_number_dice, 3)
/// Need to find a way to make this not appear on the same line. 
You rolled... <>
~print_dice_results()

{
- roll_success == true: 
    
    -> space_12_interaction_1_fight_2_chad_success
- else:     
    -> space_12_interaction_1_fight_2_chad_fail
}

== space_12_interaction_1_fight_2_chad_success ==
Chad has fine footwork. He's quick on his feet. 
But he is still a boy, and your pet is an enormous insectoid who seemed created for bone splintering mayhem reserved for early 1990s disaster movies before the world felt so genuinely dark. 
In truth, there was never any contest. 
Chad is tossed into the air by a claw, and he comes down hard. 
/// Chad
"I should have known..."
"Who am I... to tilt at windmills and imagine myself winning?" 
Chagrined Chad hobbles down the street, his embarrassed head held high. 

/// Ringo
Sister, that was incredible!
That must feel amazing. All that destructive power, at your beck and call. 
I bet you feel unstoppable. That the Chads of the world are nothing but loose stones beneath your feet. 
Sometimes I wonder how I would move through the world if I didn't have anything to fear...

Anyways, I'm proud of you sister. I'll be sure to help Mom and Dad make you and {MONSTER_NAME} an extra big dinner everytime you guys come home. 
~ current_foe = "level_3_bully"
{testing_in_ink:-> space_12|-> DONE}



== space_12_interaction_1_fight_2_chad_fail == 

It's honestly, pretty impressive how much Chad was worked out since you last fought him. 
Or at the very least, he's definitely watched a lot of live stream boxing content.
Chad keeps doing this bizarre hand waving, duck and weave gesture. 
{MONSTER_NAME}, who is always singularly focused on you, is enraptured by his arm motions. 
You try to to explain to your pet, that Chad is trying to fight. He's not communicating via arms-as-mandible semaphore. 
By the time you get through to {MONSTER_NAME}, Chad lands a surprisingly effective left hook straight to your beast's side. 
More out of shock than anything, your pet scurries away. 
/// Chad
"To think. There was a part that doubted myself." 
Chad comes over and almost casually robs you of your pet's meal. 
/// Ringo
It's okay, sis. You can't win all your fights, even if you are a kaiju sized bug with mysterious origins.
{testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno3_intro ===
~ current_fight_intro_heard = true


"{pc_name}, {pc_name}! It's Chad. He's back!" 
"After you beat him at the rematch, he's changed." 
"He's dabbled in profane magicks from unholy tomes written by authors driven mad by their own ruinous words, but not before they had time to proof read and write extensive "acknowledgements" sections."
He's stronger than ever and worst of all: he's still finding time to bully me! 


The street is empty and then in a burst of cold light, there is Chad. 
He's got the same baby blue eyes, pouting lips, and frosted tips as before. But it is somehow wrong. Profane. 
When he speaks, there is a sound like the sea as its last swell is swallowed by the sun. The roar of a beast spent millennia in darkness. The tectonic crash of two planets colliding and remaking the axis of an entire galaxy in a single nauseating instant. 

/// Chad
Hey, {pc_name}.
Wanna fight?

/// Ringo
Watch out, sis! Chad's strong beyond recoking. 
His challenge value is 4! So you'll need a 4 or higher to beat him.
If you and {MONSTER_NAME} want to back out, I totally get it...
But imagine you beat him? Imagine what then!
~ dice_pool_based_on_size()
-> space_12_bullyno3_battle

=== space_12_bullyno3_resume ===
/// Ringo
Sis, you're back! Come on, you've got to kick young eldtritch Chad's butt. 
It's the morally right thing to do!
~ dice_pool_based_on_size()
-> space_12_bullyno3_battle


{testing_in_ink:-> space_12|-> DONE}


=== space_12_bullyno3_battle === 
"Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 4. 
{battle_current_number_dice < 5:
    ~ battle_current_number_dice += 1
    + [Gain one town panic to gain one additional dice.] 
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno3_battle
}
+ [Fight!]
    -> space_12_interaction_1_fight_combat
+ [Flee] 
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    "Coward!"
    {testing_in_ink:-> space_12|-> DONE}


=== space_12_interaction_1_fight_combat ===
~roll_dice(battle_current_number_dice, 4)
/// Need to find a way to make this not appear on the same line. 
You rolled... <>
~print_dice_results()

{
- roll_success == true: 
    
    -> space_12_interaction_1_fight_3_chad_success
- else:     
    -> space_12_interaction_1_fight_3_chad_fail
}


=== space_12_interaction_1_fight_3_chad_success ===
Chad has traveled far. He has crawled on his hands and knees into the caves that our ancestors sealed shut with stone idols. 
He has bathed in the primordial swamps that birthed the multi-celluar life that began the long, stuttering chain of organisms until arriving at the modern dog-man. 
But your creature is a giant bug. And all the eldritch powers and singular strangeness of a young dog boy is ultimately no match for the basics. 
Claws. Teeth. A thorax that shoots web. 
With this final item, Young Chad is wrapped up in your creature's unbreakable silk and he stares out, transfixed as if he discovered an answer he had long ago given up ever finding. 

/// Chad
You know, I really thought I could win. 
But I see now that could never be.
Some things cannot be changed in our lives... and we must learn to live with them as they are. 

You break Chad free of his bindings, and he walks off into the distance. 
/// Ringo
"Good work, sis! I think you finally beat some sense into him." 
"And now that Chad won't bother me, I can finally get back to working on my dream project."
"As thanks, Chad even offered to help us make food for you when everytime you come back home!" 

~ current_foe = "level_4_bully"
{testing_in_ink:-> space_12|-> DONE}

=== space_12_interaction_1_fight_3_chad_fail === 
{MONSTER_NAME} is a creature of pure force and ferocity, but Chad has transformed himself beyond such descriptors. 
Chad is not <i>of</i> power, he simply <b>is</b> power.

{MONSTER_NAME} is sent ragdolling from Chad, and a long time passes before your pet staggers up to its feet. 
In the meantime, Chad robs you of your creature's snacks. 
It is like you never had them in the first place. 
/// Ringo
Too bad, sis. Looks like you'll have to try again next time.
{testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno4_intro ===
~ current_fight_intro_heard = true
You return to your neighborhood when you spot a familiar figure towering in the shade of a nearby building. 
It's Chad. And he's cowering. 
"{pc_name}, we're in trouble..." 
"I've spent the whole of your life bullying your little brother." 
"While doing so may have done irreperable damage to myself by fostering a deep fondness for experiencing power over others... but now I wish I never stopped." 
"Because something even worse has happened now." 

Just then the building that you noticed earlier <i>moves</i>. 
The structure reveals itself to be an enormous bi-pedal mech with a cockpit in the robot's titanium reinforced mechanical skull." 
/// Ringo
"Hey there, sis!" 
"Now that Chad isn't bullying me, I finally got a chance to pursue my own dream: creating a sky scraper sized robot and terrorizing the world."
"Thanks to you, I'll never have to fear anyone or anything again." 
"But I swear to be a merciful god. In fact, you and I could rule together. Machine and beast!"
"What say you, sister?" 

* [Rule together] 
    /// I need to write a thread for this. 
    {testing_in_ink:-> space_12|-> DONE}
* [Fight your brother] 
/// Ringo
- "I should have known..." 
"It's like when we were even younger and you hogged the human plushy toy all for yourself. You were never good at sharing." 
"Don't worry, I will make a just world of iron and circuits, and there will be space for all: even you. 
Prepare yourself! My challenge value is an unbeatable five!
~ dice_pool_based_on_size()

-> space_12_bullyno4_battle


=== space_12_bullyno4_resume ===
Your brother Ringo stomps towards you in his massive mech. 
"Come back to embarrass yourself fighting me?" 
~ dice_pool_based_on_size()
-> space_12_bullyno4_battle


/// REWRITE

=== space_12_bullyno4_battle === 
"Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 5. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno4_battle
}
+ [Fight!]
    -> space_12_brofight_combat
+ [Flee] 
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    "Coward!"
    {testing_in_ink:-> space_12|-> DONE}


=== space_12_brofight_combat ===
~roll_dice(battle_current_number_dice, 5)
/// Need to find a way to make this not appear on the same line. 
You rolled... <>
~print_dice_results()

{
- roll_success == true: 
    
    -> space_12_interaction_1_fight_4_bro_success
- else:     
    -> space_12_interaction_1_fight_4_bro_fail
}


== space_12_interaction_1_fight_4_bro_success ==
~ fights_concluded = true
Your brother's mech hides the sun from your eyes. 
From his cockpit, Ringo launches fusillades of weaponry that will be used as reference for super hero movies for years to come. 
{MONSTER_NAME} scurries through the carnage, staying just ahead of the bursts of ordinance as theyre launched toward you. 
Off your command, your pet climbs up the body of your brother's mech. 
"Sister, no!"
Massive metal wrists come to swat, but your beast is faster-- climbing higher and higher until you arrive up at the headpiece of your brother's mech. 
With one mighty swipe of {MONSTER_NAME}'s claws, you sever the head from the mech's body. 
You catch your brother in your arms as your monster comes back down to the safety of the Earth. 

Together the two of you watch as his mech that briefly terrorized the city falls backward and crashes into the waters of the bay. 

/// Ringo
"There goes my heart, my very dream."
"The worst part, is that for all my engineering and bluster... it never felt right." 
"After spending so long under Chad's thumb, I thought having a power of my own would feel liberating." 
"But instead, I felt under the thrall of my own machine designed to rule and dominate." 
"I gained freedom but lost my own will as I sought to preserve and grow my own power at any cost..." 
"Sister, how do you do it?" 
"You have immense power in the form of your beloved pet, but how are you not changed by it?" 
* [I am changed by my pet's influence, you just can't see it.]
    /// Ringo
    "I suppose we are always changed. By our misfortunes, our victories, and the friends we keep." 
* [{MONSTER_NAME} is not my power, he is my friend.]
    ///Ringo
    "I suppose it's better that way that." 
    "In a perfect world, power would originate and exist to do right by our friends and the people we care about."
- "Sister, I think you for saving me. I truly lost myself there for a minute." 
"The next time you come back home, I'll be sure to use some of this robot equipment to make you an extra big meal." 
{testing_in_ink:-> space_12|-> DONE}

== space_12_interaction_1_fight_4_bro_fail ==
Your brother was always industrious with tinker toys and drew up elaborate, impossible blueprints with crayons. 
Only now do you realize his designs were miraculously and painfully possible. 
{MONSTER_NAME} is broadsided by a dizzying array of lasers, heat-seeking missiles, and an impractical, anime-inspired energy sword.
Your pet heroically shields you from the worst of the damage, but much of your food stores do not survive impact. 
///Ringo
"Sorry, sister! I'd wish you luck next time, but as a newly christened despot, I seek to only speak truth."
{testing_in_ink:-> space_12|-> DONE}



=== space_12_fights_concluded ===
Your brother gives you an extra helping of food for your help in saving him from his despotical robot machinations.
"Thanks for saving me from myself, sis." 
"The craziest part of all this? Chad and I are becoming friends." 
"What a world, huh?"
{testing_in_ink:-> space_12|-> DONE}