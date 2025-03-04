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
    {dice_1_result > 0: <i>Dice one result: {dice_1_result}</i>}
    {dice_2_result > 0: <i>Dice two result: {dice_2_result}</i>}
    {dice_3_result > 0: <i>Dice three result: {dice_3_result}</i>}
    {dice_4_result > 0: <i>Dice four result: {dice_4_result}</i>}
    {dice_5_result > 0: <i>Dice five result: {dice_5_result}</i>}

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
VAR rule_together = false

=== space_12 === 

{
- testing_in_ink == true: 
    * [space_12_interaction_1] -> space_12_interaction_1
    * [space_12_interaction_2] -> space_12_bullyno2_intro
    * [space_12_interaction_3] -> space_12_bullyno3_intro
    * [space_12_interaction_4] -> space_12_bullyno4_intro
    + [destroyed option] -> space_12_destroyed
- else:

    {get_variable("is_current_destroyed"): -> space_12_destroyed}

    {rule_together == true: -> space_12_ruletogether}
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
# speaker: Narrator
You and {MONSTER_NAME} head down the street when you are interrupted by a piercing SCREAM. 
# speaker: Ringo
Big sister, help!
# speaker: Narrator
<i>You and your bug race around the corner to see your brother Ringo being shaken down by neighborhood bully Chad.</i>
{pc_name}, you gotta save me! He's trying to take my lunch money!
The bully looks to you with a smirk. 
# speaker: Chad
You think I'm scared of your sister and her abnormally large bug monster? Don't make me laugh! I'm Chad Lynch, baby!
* [Tell {MONSTER_NAME} to attack]
* [How about we negotiate?]
    # speaker: Ringo
    Sis, you can't negotiate with Chad! The only language he speaks is violence.
    # speaker: Chad
    I can't understand what you're saying, so I'm just going to keep punching.
    # speaker: Ringo
    See what I mean, sis? Also-- ow! Owww!
        * * [Let's fight!] 
        * * [Have we really exhausted all non-violent options?]
            # speaker: Ringo
            Sister, if you don't do something, he's going to exhaust me-- <i>of living!</i>
            * * * [Okay, fight time!]
            * * * [I just think we weirdly valorize violence as a society.]
                # speaker: Ringo
                Sister, I'm only five, and I am getting punched. In the face. <i>A lot!</i>
                * * * * [Okay, enough being difficult. It's fight o' clock.]
                * * * * [Maybe I like watching you get hurt?]
                    # speaker: Ringo
                    If you don't help me, I'll tell Mom and Dad you ate the box of jelly beans.
                    * * * * * [Okay, I'll fight your bully.]
            
- 
# speaker: Ringo
Okay, but first let me tell you how bug fighting works.
# speaker: Ringo
I learned everything about bug combat after I made two ant farm societies wage a brutal three day war to fight for possession of a molding banana. 
# speaker: Ringo
Here's how it works: you'll roll a number of six sided dice based off your monster's current size. 

{
- current_moth_state == "caterpillar": 
    # speaker: Ringo
    Your beast is still on the shrimpy end, so you'll roll one six sided die.
- current_moth_state == "cocoon":
    # speaker: Ringo
    Your beast is getting chunky, so you'll roll two six sided dice.
- else:
    # speaker: Ringo
    Your beast is big time, so you'll roll three six sided dice.
}
# speaker: Ringo
All you need to do is get at least one result that is greater than or equal to the bullie's challenge value. 
# speaker: Ringo
Chad is kind of a pushover, so his challenge value is a measly <b>two</b>. That means all you need to beat him is a result of two or higher. 

# speaker: Ringo
If you want, your monster can flex before the fight. This will raise the town's panic; but it'll give you an extra dice. 
# speaker: Ringo
And watch out! If you lose, your current enemy will take some of your lunch, lowering {MONSTER_NAME}'s food.
# speaker: Ringo
Okay, so what are you going to do?
~ current_fight_intro_heard = true
~ dice_pool_based_on_size()
-> space_12_interaction_1_fight_1

/// It's annoying that functions can't contain diverts ///

== space_12_interaction_1_fight_1_resume == 
# speaker: Narrator
You return to the street and find Chad once again shaking your little brother down for money. 
# speaker: Ringo
There you are, sis! Save me from Chad already! 
-> space_12_interaction_1_fight_1


== space_12_interaction_1_fight_1 ==
# speaker: Ringo
Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 2. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        # speaker: Narrator
        ~ battle_current_number_dice += 1
        ~ change_variable("fear", amount_a)
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_interaction_1_fight_1
}
+ [Fight!]
    -> space_12_interaction_1_fight_1_chad
+ [Flee] 
    # speaker: Narrator
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} run for the hills. 
    # speaker: Ringo
    Coward!
    {testing_in_ink:-> space_12|-> DONE}

== space_12_interaction_1_fight_1_chad ==
# speaker: Narrator
{MONSTER_NAME} squares up against Chad. The air crackles with tension.
# speaker: Chad
Your bug ain't no match for my left hook!

~roll_dice(battle_current_number_dice, 2)
/// Need to find a way to make this not appear on the same line. 
# speaker: Narrator
Dice roll time! Let's check the results... 
~print_dice_results()

{
- roll_success == true: 
    Success!
    -> space_12_interaction_1_fight_1_chad_success
- else:     
    Defeat!
    -> space_12_interaction_1_fight_1_chad_fail
}
    



== space_12_interaction_1_fight_1_chad_success ==
# speaker: Narrator
Young chad taunts you, flexing his arms with flesh that you aren't sure is fat or muscle. 
# speaker: Narrator
In the middle of him attempting to do a one handed push up, {MONSTER_NAME} ambles over and knocks him aside with one flick of his mighty pincer. 
# speaker: Narrator
Chad just goes flying over a neighbor's fence and lands face first in a hedge bush. 
# speaker: Ringo
Sister, that was amazing! Your giant bug saved me! 
# speaker: Chad
My whole body hurts...
# speaker: Ringo
~ change_variable("lap_bonus_food", amount_a)  
As a reward for helping me, I'll work with mom to make you and {MONSTER_NAME} an extra big snack when you cross twelve space twelve and come back home. 
# speaker: Ringo
Come back again soon. I've got a feeling we haven't heard the last from Chad...
~ current_foe = "level_2_bully" 
~ current_fight_intro_heard = false
{testing_in_ink:-> space_12|-> DONE}


== space_12_interaction_1_fight_1_chad_fail ==
# speaker: Narrator
Your bug charges, but young Chad uses his comparitevely diminutive size to dodge {MONSTER_NAME}'s attack.
# speaker: Narrator
Your beast gets themselves stuck in the side of a building, and Chad reins a flurry of enthusiastic if ineffective blows on {MONSTER_NAME}'s carapace.
# speaker: Narrator
What really hurts is when Chad manages to steal food you meant to give your pet. 
# speaker: Ringo
Too bad, sis. Looks like you'll have to try this again next time. 
{testing_in_ink:-> space_12|-> DONE}


/////////////////////////////////////////////////////////////////////


=== space_12_bullyno2_intro ====

~ current_fight_intro_heard = true
# speaker: Ringo
{pc_name}! <i>{pc_name}!</i>
# speaker: Ringo
Remember when you beat up Chad with your enormous bug pet?
# speaker: Ringo
I thought that after he'd been humbled, he'd finally take it easy.
# speaker: Ringo
But Chad is fury given abs and the cracking voice of a tween retriever.
# speaker: Ringo
As soon as you left, he started talking about kicking your bug's thorax so hard that it would break the and boundaries of known and unknown worlds. 
# speaker: Ringo
He said that aliens would come from across the galaxy to research and study how a butt was kicked to levels theoretical scientists didn't think possible!
# speaker: Ringo
The guy's serious. He even enrolled in a karate class but for <i>adults!<i>
# speaker: Ringo
Look alive, sis. He's here. 

# speaker: Narrator
Young chad eats muscle powder straight from the jug and tosses the empty container aside where it rolls across the road like a tumbleweed.

# speaker: Ringo
Get ready, sis. Looks like it's round two for you and Chad!
# speaker: Ringo
This time, his challenge value is <b>3!</b> So you'll need a three or higher to beat him.
~ dice_pool_based_on_size()
-> space_12_bullyno2_battle


== space_12_bullyno2_resume ==
# speaker: Ringo
Sister, there you are! 
# speaker: Ringo
Chad has been shouting for a rematch all day. His voice is hoarse, and no one's been able to sleep because he keeps calling for a fight!
~ dice_pool_based_on_size()
-> space_12_bullyno2_battle

== space_12_bullyno2_battle == 
# speaker: Ringo
Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 3. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        ~ battle_current_number_dice += 1
        # speaker: Narrator
        ~ change_variable("fear", amount_a)
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno2_battle
}
+ [Fight!]
    -> space_12_bullyno2_fight
+ [Flee] 
    # speaker: Narrator
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    # speaker: Ringo
    Coward!
    {testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno2_fight ===
/// Chad
# speaker: Chad
Since last we last met, I have watched all the youtube fitness guys my algorhythm sent me.
# speaker: Chad
I bought a gym membership and workout clothes that aren't just t-shirts that are too ratty to wear anywhere else.
# speaker: Chad
I have spent every moment since our last meeting preparing to make sure you taste the bitter sting of defeat!
# speaker: Chad
Let us... begin!


~roll_dice(battle_current_number_dice, 3)
/// Need to find a way to make this not appear on the same line. 
# speaker: Narrator
Dice roll time! Let's check the results...
~print_dice_results()

{
- roll_success == true:
    Success!
    
    -> space_12_interaction_1_fight_2_chad_success
- else:     
    Defeat!
    -> space_12_interaction_1_fight_2_chad_fail
}

== space_12_interaction_1_fight_2_chad_success ==
# speaker: Narrator
Chad has fine footwork. He's quick on his feet. 
# speaker: Narrator
But he is still a boy, and your pet is an enormous insectoid who seemed created for bone splintering mayhem reserved for early 1990s disaster movies before the world felt so genuinely dark. 
# speaker: Narrator
Chad is tossed into the air by a claw, and he comes down hard. 
# speaker: Chad
I should have known... Who am I... to tilt at windmills and imagine myself winning?
# speaker: Narrator
Chagrined Chad hobbles down the street, his embarrassed head held high. 

# speaker: Ringo
Sister, that was incredible! That must feel amazing. All that destructive power, at your beck and call. 
I bet you feel unstoppable. That the Chads of the world are nothing but loose stones beneath your feet. 
# speaker: Ringo
Sometimes I wonder how I would move through the world if I didn't have anything to fear...

# speaker: Ringo
~ change_variable("lap_bonus_food", amount_a)  
Anyways, I'm proud of you sister. I'll be sure to help Mom and Dad make you and {MONSTER_NAME} an extra big dinner everytime you guys come home. 
~ current_foe = "level_3_bully"
{testing_in_ink:-> space_12|-> DONE}



== space_12_interaction_1_fight_2_chad_fail == 
# speaker: Narrator
It's impressive how much Chad was worked out since you last fought him. 
# speaker: Narrator
Or at the very least, he's definitely watched a lot of live stream boxing content.
# speaker: Narrator
Chad keeps doing this bizarre hand waving, duck and weave gesture. 
# speaker: Narrator
{MONSTER_NAME}, who is always singularly focused on you, is enraptured by his arm motions. 
# speaker: Narrator
You try to to explain to your pet, that Chad is trying to fight. He's not communicating via arms-as-mandible semaphore. 
# speaker: Narrator
By the time you get through to {MONSTER_NAME}, Chad lands a surprisingly effective left hook straight to your beast's side. 
# speaker: Narrator
More out of shock than anything, your pet scurries away. 
# speaker: Chad
To think. There was a part that doubted myself!
# speaker: Narrator
Chad comes over and almost casually robs you of your pet's meal. 
# speaker: Ringo
It's okay, sis. You can't win all your fights, even if you are a kaiju sized bug with mysterious origins.
{testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno3_intro ===
~ current_fight_intro_heard = true

# speaker: Ringo
{pc_name}, {pc_name}! It's Chad. He's back!
# speaker: Ringo
After you beat him at the rematch, he's changed.
# speaker: Ringo
He's dabbled in profane magicks from unholy tomes written by authors driven mad by their own ruinous words, but not before they had time to proof read and write extensive "acknowledgements sections.
# speaker: Ringo
He's stronger than ever and worst of all: he's still finding time to bully me! 

# speaker: Narrator
The street is empty and then in a burst of cold light, there is Chad. 
# speaker: Ringo
He's got the same baby blue eyes, pouting lips, and frosted tips as before. But his form is somehow wrong. Twisted in a way you can't perceive.
# speaker: Ringo
When he speaks, there is a sound like the sea as its last swell is swallowed by the sun. The roar of a beast spent millennia in darkness. The tectonic crash of two planets colliding and remaking the axis of an entire galaxy in a single nauseating instant. 

# speaker: Chad
Hey, {pc_name}. Your time upon this Earth is at an end.
# speaker: Ringo
Watch out, sis! Chad's strong beyond reckoning. 
# speaker: Ringo
His challenge value is <b>4</b>! So you'll need a 4 or higher to beat him.
# speaker: Ringo
If you and {MONSTER_NAME} want to back out, I totally get it...
# speaker: Ringo
But imagine you beat him? Imagine what then!
~ dice_pool_based_on_size()
-> space_12_bullyno3_battle

=== space_12_bullyno3_resume ===
# speaker: Ringo
Sis, you're back! Come on, you've got to kick young eldtritch Chad's butt. 
# speaker: Ringo
It's the morally right thing to do!
~ dice_pool_based_on_size()
-> space_12_bullyno3_battle


{testing_in_ink:-> space_12|-> DONE}


=== space_12_bullyno3_battle === 
# speaker: Ringo
Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 4. 
{battle_current_number_dice < 5:
    ~ battle_current_number_dice += 1
    + [Gain one town panic to gain one additional dice.] 
        ~ battle_current_number_dice += 1
        ~ change_variable("fear", amount_a)
        # speaker: Narrator
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno3_battle
}
+ [Fight!]
    -> space_12_interaction_1_fight_combat
+ [Flee] 
    # speaker: Narrator
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    # speaker: Ringo
    Coward!
    {testing_in_ink:-> space_12|-> DONE}


=== space_12_interaction_1_fight_combat ===
~roll_dice(battle_current_number_dice, 4)
/// Need to find a way to make this not appear on the same line. 
# speaker: Narrator
Dice roll time! Let's check the results...
~print_dice_results()

{
- roll_success == true: 
    Success!
    -> space_12_interaction_1_fight_3_chad_success
- else:     
    Defeat!
    -> space_12_interaction_1_fight_3_chad_fail
}


=== space_12_interaction_1_fight_3_chad_success ===
# speaker: Narrator
Chad has traveled far. He has crawled on his hands and knees into the caves that our ancestors sealed shut with stone idols. 
# speaker: Narrator
He has bathed in the primordial swamps that birthed the multi-celluar life that began the long, stuttering chain of organisms until arriving at the modern dog-man. 
# speaker: Narrator
But your creature is a giant bug. And all the eldritch powers and singular strangeness of a young dog boy is ultimately no match for the basics.
# speaker: Narrator
Claws. Teeth. A thorax that shoots web. 
# speaker: Narrator
With this final item, Young Chad is wrapped up in your creature's unbreakable silk and he stares out, transfixed as if he discovered an answer he had long ago given up ever finding. 

# speaker: Chad
You know, I really thought I could win. But I see now that could never be.
# speaker: Chad
Some things cannot be changed in our lives... and we must learn to live with them as they are. 

# speaker: Narrator
You break Chad free of his bindings. He walks off into the distance before he ascends on eldritch wings until he is suddenly gripped by a plumb of enveloping darkness and spirited away to parts unknown. 
# speaker: Ringo
Good work, sis! I think you finally beat some sense into him.
# speaker: Ringo
And now that Chad has been claimed by dark powers he foolishly thought to master, I can finally get back to working on my dream project.
# speaker: Ringo
~ change_variable("lap_bonus_food", amount_a)  
As thanks, I'll make an extra big meal for you everytime you come back home!

~ current_foe = "level_4_bully"
{testing_in_ink:-> space_12|-> DONE}

=== space_12_interaction_1_fight_3_chad_fail === 
# speaker: Narrator
{MONSTER_NAME} is a creature of pure force and ferocity, but Chad has transformed himself beyond such descriptors. 
# speaker: Narrator
Chad is not <i>of</i> power, he simply <b>is</b> power.
# speaker: Narrator
{MONSTER_NAME} is sent ragdolling from Chad, and a long time passes before your pet staggers up to its feet. 
# speaker: Narrator
In the meantime, Chad robs you of your creature's snacks. It is like you never had them in the first place. 
# speaker: Ringo
Too bad, sis. Looks like you'll have to try again next time.
{testing_in_ink:-> space_12|-> DONE}




=== space_12_bullyno4_intro ===
~ current_fight_intro_heard = true
# speaker: Narrator
You return to your neighborhood when you spot a familiar figure towering in the shade of a nearby building. 
# speaker: Narrator
It's Chad. And he's cowering. 
# speaker: Chad
{pc_name}, we're in trouble...
# speaker: Chad
I've spent the whole of your life bullying your little brother.
# speaker: Chad
While doing so may have done irreperable damage to myself by fostering within me a loathesome fondness for experiencing power over others... now I wish I never stopped.
# speaker: Chad
Because something even worse has happened now. 

# speaker: Narrator
Just then the building that you noticed earlier <i>moves</i>. 
# speaker: Narrator
The structure reveals itself to be an enormous bi-pedal mech with a cockpit in the robot's titanium reinforced mechanical skull.
# speaker: Ringo
Hey there, sis!
# speaker: Ringo
Now that Chad isn't bullying me, I finally got a chance to pursue my own dream: creating a sky scraper sized robot and terrorizing the world.
# speaker: Ringo
Thanks to you, I'll never have to fear anyone or anything again.
# speaker: Ringo
But I swear to be a merciful god. In fact, you and I could rule together. Machine and beast!
# speaker: Ringo
What say you, sister?

* [Rule together] 
    ~ rule_together = true
    # speaker: Ringo
    Yes, sister. Truly, this is what mother and father have prepared us for all our lives!
    # speaker: Ringo
    Soon, the world will meet its new monarchs, and they will genuflect and experience the joy that only comes from the generous rule of child dictators.
    # speaker: Ringo
    But I'm getting ahead of myself. The civilized world will probably put up some tedious struggle and try to paint as being unfit to rule even though you're six and know basically everything.
    # speaker: Ringo
    When next you complete a circuit around the board, I can make you extra food.
    # speaker: Ringo
    And in the meantime we can begin planning for our future roles in world government!
    
    {testing_in_ink:-> space_12|-> DONE}
* [Fight your brother] 
# speaker: Ringo
- 
# speaker: Ringo
I should have known... 
# speaker: Ringo
It's like when we were even younger and you hogged the human plushy toy all for yourself. You were never good at sharing.
# speaker: Ringo
Don't worry, I will make a just world of iron and circuits, and there will be space for all: even you. 
# speaker: Ringo
Prepare yourself! My challenge value is an unbeatable five!
~ dice_pool_based_on_size()

-> space_12_bullyno4_battle


=== space_12_bullyno4_resume ===
# speaker: Narrator
Your brother Ringo stomps towards you in his massive mech. 
# speaker: Ringo
Come back to embarrass yourself fighting me?
~ dice_pool_based_on_size()
-> space_12_bullyno4_battle


/// REWRITE

=== space_12_bullyno4_battle === 
# speaker: Ringo
Your current dice pool is {battle_current_number_dice}. Your enemy's challenge value is 5. 
{battle_current_number_dice < 5:
    + [Gain one town panic to gain one additional dice.] 
        # speaker: Narrator
        ~ battle_current_number_dice += 1
        ~ change_variable("fear", amount_a)
        Your monster flexes, growing stronger for the upcoming fight. 
        -> space_12_bullyno4_battle
}
+ [Fight!]
    -> space_12_brofight_combat
+ [Flee] 
    # speaker: Narrator
    Your brother shakes his head in disappointment as you and {MONSTER_NAME} continue on your walk. 
    # speaker: Ringo
    Coward!
    {testing_in_ink:-> space_12|-> DONE}


=== space_12_brofight_combat ===
~roll_dice(battle_current_number_dice, 5)
/// Need to find a way to make this not appear on the same line. 
# speaker: Narrator
Dice roll time! Let's check the results...
~print_dice_results()

{
- roll_success == true: 
    Success!
    -> space_12_interaction_1_fight_4_bro_success
- else:     
    Defeat!
    -> space_12_interaction_1_fight_4_bro_fail
}


== space_12_interaction_1_fight_4_bro_success ==

~ fights_concluded = true
# speaker: Narrator
Your brother's mech seems to block the entire horizon from view. 
# speaker: Narrator
From his cockpit, Ringo launches fusillades of weaponry that will be used as reference for super hero movies for years to come. 
# speaker: Narrator
{MONSTER_NAME} scurries through the carnage, staying just ahead of the bursts of ordinance as theyre launched toward you. 
# speaker: Narrator
Off your command, your pet climbs up the body of your brother's mech. 
# speaker: Ringo
Sister, no!
# speaker: Narrator
Massive metal wrists come to swat, but your beast is faster-- climbing higher and higher until you arrive up at the headpiece of your brother's mech. 
# speaker: Narrator
With one mighty swipe of {MONSTER_NAME}'s claws, you sever the head from the mech's body. 
# speaker: Narrator
You catch your brother in your arms as your monster comes back down to the safety of the Earth. 
# speaker: Narrator
Together the two of you watch as his mech that briefly terrorized the city falls backward and crashes into the waters of the bay. 

# speaker: Ringo
There goes my heart, my very dream.
# speaker: Ringo
The worst part, is that for all my engineering and bluster... it never felt right.
# speaker: Ringo
After spending so long under Chad's thumb, I thought having a power of my own would feel liberating. 
# speaker: Ringo
But instead, I felt under the thrall of my own machine designed to rule and dominate.
# speaker: Ringo
I gained freedom but lost my own will as I sought to preserve and grow my own power at any cost...
# speaker: Ringo
Sister, how do you do it?
# speaker: Ringo
You have immense power in the form of your beloved pet, but how are you not changed by it?

* [I am changed by my pet's influence, you just can't see it.]
    # speaker: Ringo
    I suppose we are always changed. By our misfortunes, our victories, and the friends we keep.
* [{MONSTER_NAME} is not my power, he is my friend.]
    # speaker: Ringo
    I suppose it's better that way that.
    # speaker: Ringo
    In a perfect world, power would originate and exist to do right by our friends and the people we care about.
- 
# speaker: Ringo
Sister, I think you for saving me. I truly lost myself there for a minute.
# speaker: Ringo
~ change_variable("lap_bonus_food", amount_a)  
The next time you come back home, I'll be sure to use some of this robot equipment to make you an extra big meal.
{testing_in_ink:-> space_12|-> DONE}

== space_12_interaction_1_fight_4_bro_fail ==
# speaker: Narrator
Your brother was always industrious with tinker toys and drew up elaborate, impossible blueprints with crayons. 
# speaker: Narrator
Only now do you realize his designs were miraculously and painfully possible. 
# speaker: Narrator
{MONSTER_NAME} is broadsided by a dizzying array of lasers, heat-seeking missiles, and an impractical, anime-inspired energy sword.
# speaker: Narrator
Your pet heroically shields you from the worst of the damage, but much of your food stores do not survive impact. 
# speaker: Ringo
Sorry, sister! I'd wish you luck next time, but as a newly christened despot, I seek to only speak truth.
{testing_in_ink:-> space_12|-> DONE}



=== space_12_fights_concluded ===
# speaker: Narrator
Your brother gives you an extra helping of food for your help in saving him from his despotical robot machinations.
# speaker: Ringo
Thanks for saving me from myself, sis.
# speaker: Ringo
The craziest part of all this? Chad and I are becoming friends! What a world, huh?
~ change_variable("hunger", amount_c) 
Speaking of which, he and I made a "new friends lasanga!" 
# speaker: Bug
Before you can voice your excitement, {MONSTER_NAME} eats the whole thing, metal tray included.
{testing_in_ink:-> space_12|-> DONE}


=== space_12_ruletogether ===
# speaker: Ringo
Sister and future queen of the world!
# speaker: Ringo
Come, there is much work to do to prepare the way for our righteous reign.
# speaker: Narrator
You and Ringo spend an enjoyable afternoon making campaign slogans and creating social media accounts for your new world order. 
~ change_variable("hunger", amount_c) 
While working, the two of you split a pizza: half cheese, half doggy bones.
{testing_in_ink:-> space_12|-> DONE}



=== space_12_destroyed ===
# speaker: Narrator
The street near your house is chewed up like an old doggy bone. 
The ash tree where you and your brother climbed is cleaved in two. 
That road you and your mom went sledding last winter is pockmarked by gaping holes.
It takes so little to turn the familiar into something alien and frightening...
~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_12|-> DONE}