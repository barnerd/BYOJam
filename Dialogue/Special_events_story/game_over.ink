/// NOTE: The below now plays at the game end, not the game over. 
=== game_over ===
# speaker: Narrator
You return home with {MONSTER_NAME} in tow. 
# speaker: Narrator
It seemed like it was yesterday that your pet followed you around as a caterpillar or when you bodily rolled him along in cocoon form, crushing dogs' cars and gardens in your wake. 
# speaker: Narrator
But lately, he's taken to flying above, only coming down for food or to fly at bright lights including light houses, street signs, and Christmas decorations from that annoying neighbor who leaves them up year round. 
# speaker: Narrator
But {MONSTER_NAME} flies down to you now with no new food or light source in sight. The ground shakes with his mighty form, but you stand firm before him. 
# speaker: Narrator
He stares deep into your eyes. Imperious. Fearsome. <i>Waiting.</i>

# speaker: Narrator
Looking at him, you feel...
* [Safe]
    # speaker: Narrator
    {MONSTER_NAME} is your friend and despite everything, you know he would never let anything bad happen to you.
* [Scared]
    ~ get_variable("number_of_spaces_destroyed")
    {number_of_spaces_destroyed > 0:
        # speaker: Narrator
        You've seen {MONSTER_NAME} do terrible things. Ruins left in his wake. 
        # speaker: Narrator
        Where once you had a full town, now you only have pieces of one.
    - else: 
        # speaker: Narrator
        You know {MONSTER_NAME} is capable of terrible things. Though you've kept him from the worst of his instincts, he could crush the whole of this town and think nothing of it. 
    }
* [Confused]
    # speaker: Narrator
    You have witnessed this creature grow at alarming, shocking speed. 
    {moth_origin_found == true: 
        # speaker: Narrator
        You discovered he's created from the unfathomable powers of fey, but that does little to assuage your worries about what he is destined to become now that he towers over the tallest sky scrapers in town. 
    -else: 
        # speaker: Narrator
        You still have no idea where he came from and what terrible forces of the chaotic universe brought him forth. 
        # speaker: Narrator
        You've started lying awake at night in fear of what your beloved pet might truly be.
    } 
* [Powerful]
    # speaker: Narrator
    You used to be scared. Of bullies. The dark. The vet. 
    # speaker: Narrator
    But now these are nothing to you. You can't imagine any force in the known or unknown world that could possibly stand up to the unstoppable might of {MONSTER_NAME}. 
    # speaker: Narrator
    With him at your side, who knows what you might be capable of.

- 

/// option section where characters from completed quests can come in and give advice
# speaker: Narrator
Your pet stares at you, as if waiting your command. 
# speaker: Narrator
You take a deep breath. You're only six years, and you've got the whole world in your paws.
# speaker: Narrator
<i>What do you want to do?</i>

* [Keep him as a pet] -> game_over_pet
* [Send him off into space] -> game_over_space
* [Pull an "Old Yeller" by feeding him poisoned chocolate] -> game_over_poison
* [Use him to take over the world] -> game_over_worlddomination

=== game_over_pet === 
# speaker: Narrator
{MONSTER_NAME} is your responsibility. Sometimes he is bad, but he is yours to protect and raise right. 
# speaker: Narrator
It won't be easy parenting a six story tall creature while you juggle growing up, getting straight "A's", and achieving your goal of becoming the first female President slash pop star. 
# speaker: Narrator
But your parents taught you to stay true to yourself and never give up on the folks you care about.
# speaker: Narrator
You stroke under his chin just where he likes it. 
# speaker: Rosey
Come on, you big goof. Let's get you some dinner.
# speaker: Narrator
We've got a whole life to get to, and I don't want to waste another minute getting to the good stuff!
# speaker: Narrator
You and {MONSTER_NAME} soar up into the air and arrive home just in time for dessert. 

-> DONE

=== game_over_space === 
# speaker: Narrator
{MONSTER_NAME} is not meant for this Earth. When he walks buildings shake, pups shriek, and the less said about his bathroom habits: <i>the better</i>. 
# speaker: Narrator
No, your pet was never meant to stay. As he is not of this planet, he deserves a chance to travel the galaxies beyond where he might find something resembling his own home. 
# speaker: Narrator
Maybe something even resembling his own kin. 
# speaker: Rosey
Go on! 'Git!
# speaker: Narrator
{MONSTER_NAME} lowers his head for one last pet. 
# speaker: Narrator
Though you are not his kin, you will still always belong to one another. 
# speaker: Narrator
You wipe your eyes and watch as {MONSTER_NAME} takes off, flying higher and higher. 
# speaker: Rosey
"I hope they have pizza on Alpha Centauri." 
# speaker: Narrator
He soars up, up, up and then he is gone to travel the stars and the places beyond even that.
-> DONE


=== game_over_poison ===
# speaker: Narrator
You've told everyone for weeks that {MONSTER_NAME} is your loving pet. 
# speaker: Narrator
That he has a gentle spirit, kind eyes, and razor sharp pincers meant to only protect! Never to hurt. 
# speaker: Narrator
But all along you have known the truth, and you realize that he is a danger. To yourself, your town, and even himself. 
# speaker: Narrator
It is the right thing, you think, as you prepare him a pizza laced with an extra helping of extra strength bug-killer bought from the hardware store. 
# speaker: Rosey
Here you go, {MONSTER_NAME}. Eat up. 
# speaker: Narrator
Your pet regards you with recognition. Fury. For a moment, you freeze. 
# speaker: Narrator
But then he lowers his head, and he eats the meal bite by cheesey bite until he's consumed it all. He wipes his mouth with a pincer and gives a BURP that shatters windows up and down the block.
# speaker: Narrator
It takes the poison a week to work its way though its system. He seems to regress through his evolutionary state: he stops flying, returns to crawling, and then at last lays still. 
# speaker: Narrator
You sit up with him, watching his final moments. 
# speaker: Narrator
Though you brought about his end, you cared for him all his life, and you feel you owe him this at least. 
# speaker: Narrator
At last, he breathes his last, and then it is done. 
# speaker: Narrator
The town throws you a parade for slaying the terrible bug, and they dress you in a blood red dress and have you wave from atop his severed head that they drive through the town on a massive pickup truck.
# speaker: Narrator
Afterwards life resumes, and things somehow, impossibly go back to normal.
# speaker: Narrator
That is for everyone except you. 
# speaker: Narrator
Not a day goes by that you don't remember your loyal, monstrous pet and your part in all of this. 
-> DONE

=== game_over_worlddomination ===
# speaker: Narrator
It doesn't happen over night. It happens slowly. Methodically. Patiently. 
# speaker: Narrator
A few oil pipe lines are sabotaged.
# speaker: Narrator
Several missile sites go up in a burst in flames. 
# speaker: Narrator
A pro-{MONSTER_NAME} campaign springs up overnight and has the perfect verisimilitude of a real grass roots organization. 
# speaker: Narrator
When they install you and {MONSTER_NAME} as chancellors of the world, it's not after a violent coup or from a years long campaign of terror. 
# speaker: Narrator
It's with a parade. Glowing articles in the papers and social media abuzz with messages about being carried forward into a brighter world on wings of hope. 
# speaker: Narrator
You assume your seat of power with ferocious and faithful {MONSTER_NAME} at your side. 
# speaker: Narrator
Gazing out your window, you imagine yourself looking out onto Lagos, Dehlo, Tokyo, London, New York, Sao Paulo and wonder where you might conquer next. 
-> DONE









