VAR MONSTER_NAME = "<i>Un-named Bug Friend</i>"
VAR MONSTER_NAME_ACCORDING_TO_GRANDMA = "<i>Un-named Bug Friend</i>"
VAR you_chose_to_destroy_grandmas_house = false

/// Reminder to change default name to "buggy" and update all conditionals that check for it. 

== space_4 ==


/// Copy and paste this in at the start of every day. 
{testing_in_ink == true: 
* [space_4_interaction_1] -> space_4_interaction_1
* [space_4_interaction_2] -> space_4_interaction_2
* [space_4_interaction_3] -> space_4_interaction_3
* [space_4_interaction_4] -> space_4_interaction_4
* [space_4_interaction_5] -> space_4_interaction_5
* [space_4_destroyed_1] -> space_4_destroyed_1
- else: 
{not space_4_interaction_1: -> space_4_interaction_1}
{not space_4_interaction_2: -> space_4_interaction_2}
{not space_4_interaction_3: -> space_4_interaction_3}
{not space_4_interaction_4: -> space_4_interaction_4}
{not space_4_interaction_5: -> space_4_interaction_5}
-> space_4_interaction_6
}

=== space_4_interaction_1 ===
# speaker: Allison Wheeler
Hey there, grandkiddo! And who's this? Your new friend? 
# speaker: Allison Wheeler
You're just like your mother, always bringing in strays-- which is <i>exactly</i> what I said when she brought your father home for the first time!
# speaker: Allison Wheeler
Now tell me, have you picked a name for this, uh, <i>unusual</i> pet?
* [Marshmallow] 
    ~ MONSTER_NAME = "Marshmallow"
    ~ MONSTER_NAME_ACCORDING_TO_GRANDMA = "Marshall"

* [I haven't decided yet] 
    # speaker: Allison Wheeler
    Well, I'll ask you the next time you stop by. Think of a good one! 

- 
# speaker: Allison Wheeler
Okay, {MONSTER_NAME_ACCORDING_TO_GRANDMA}! Open wide!

{MONSTER_NAME_ACCORDING_TO_GRANDMA == "Marshall": 
* [Grandma, it's <i>Marshmallow!</i>]
    ~ MONSTER_NAME = "Marshmallow"
    # speaker: Allison Wheeler
    Oh, {MONSTER_NAME_ACCORDING_TO_GRANDMA}! Of course, Grandma was just being silly.
    {testing_in_ink== true: -> space_4}
    -> DONE
* [<i>Let it be.</i>] 
{testing_in_ink== true: -> space_4}
-> DONE
}

{testing_in_ink== true: -> space_4}
-> DONE

=== space_4_interaction_2 ===
# speaker: Allison Wheeler
Bless my stars, that thing's now twice the size you are!
# speaker: Allison Wheeler
What do your parents think of you taking care of this... <i>thing?</i>
{MONSTER_NAME != "<i>Un-named Bug Friend</i>":
    * [He's not a thing, his name is <i>{MONSTER_NAME}!</i>]
    # speaker: Allison Wheeler
    Yes, yes! {MONSTER_NAME_ACCORDING_TO_GRANDMA}! How could I forget!
    -> space_4_interaction_2_addendum_1
- else:
    * [He's not a "thing," he's my <i>pet!</i>]
    # speaker: Allison Wheeler
    He might be for now, but what if he keeps growing?
    -> space_4_interaction_2_addendum_1
}
* [It was either that or let me get a horse]
# speaker: Allison Wheeler
Well, horses are sentient people in this world, so I can understand why they wouldn't want to just "get" you a horse... 
    -> space_4_interaction_2_addendum_1

== space_4_interaction_2_addendum_1 ==
# speaker: Allison Wheeler
Anyway, here's some cookies for you and {MONSTER_NAME_ACCORDING_TO_GRANDMA}. Now do you know if your parents are home? 
# speaker: Allison Wheeler
Because I might want to talk them about something, not that you <i>or</i> {MONSTER_NAME_ACCORDING_TO_GRANDMA} need to worry about it!
{MONSTER_NAME == "<i>Un-named Bug Friend</i>":
* [Grandma, I picked a name for the bug: Francis!]
    ~ MONSTER_NAME = "Francis"
    ~ MONSTER_NAME_ACCORDING_TO_GRANDMA = "Frank"
    # speaker: Allison Wheeler
    <i>{MONSTER_NAME_ACCORDING_TO_GRANDMA}</i>, that's a wonderful name.
        ** [No, it's <i>{MONSTER_NAME}!</i>]
        ~ MONSTER_NAME_ACCORDING_TO_GRANDMA = "Francis"
        # speaker: Allison Wheeler
        Oh, {MONSTER_NAME_ACCORDING_TO_GRANDMA}! Of course, Grandma was just being silly.
        -> space_4_interaction_2_addendum_3
        ** [Leave it be]
        -> space_4_interaction_2_addendum_3
    
* [I'm still thinking of a name.]
# speaker: Allison Wheeler
Okay, grandkiddo, take your time.
-> space_4_interaction_2_addendum_3
}
    
{testing_in_ink== true: -> space_4}
-> DONE

== space_4_interaction_2_addendum_3 ==
{testing_in_ink== true: -> space_4}
-> DONE


=== space_4_interaction_3 ===
# speaker: Allison Wheeler
Listen, honey. I talked to your parents about you keeping {MONSTER_NAME_ACCORDING_TO_GRANDMA}, and I'm starting to get worried. 
# speaker: Allison Wheeler
Just look at him! He's bigger than you and good gravy-- we don't even know <i>what</i> he even is!
* [He's got gentle eyes. He's nice, and I know it!]
    # speaker: Allison Wheeler
    Honey, I know you think you're doing the right thing by taking care of him, but this is not a normal pet! What if he eats my precious grandbaby whole?
* [You going to feed him, or what?]
    # speaker: Allison Wheeler
    Now, you listen to Grandma! I'm scared for you. Keeping this thing, this monster-- <i>it ain't right!</i> Nothing good is going to come from this! 
    
-
# speaker: Allison Wheeler
You know I love you to the mooncake and back, but I think it's time you set this creature free. It's the right thing to do.
{MONSTER_NAME != "<i>Un-named Bug Friend</i>":
    * [His name is {MONSTER_NAME}!] 
        # speaker: Allison Wheeler
        FINE, HIS NAME IS {MONSTER_NAME}! Child, you are impossible! Just like your ungrateful, stubborn mother!
        -> space_4_interaction_3_addendum_1
}

* [I'm keeping him, and there's nothing you can do!] 
    # speaker: Allison Wheeler
    You are IMPOSSIBLE! You are just like your ungrateful, stubborn mother!
    -> space_4_interaction_3_addendum_1
    
* [{MONSTER_NAME}, attack grandma!] 
    # speaker: Narrator
    <i>The monster roars and surges ahead towards Grandma's house!</i>
    ~ change_variable("hunger", very_strong_effect)
    /// Destroy this space permanently.
    ~ you_chose_to_destroy_grandmas_house = true
    # speaker: Narrator
    <i>With a sound like the Earth splitting in two, the house is leveled.</i>
    # speaker: Narrator
    <i>When the dust clears, Grandma is no where to be seen.</i>
    ** [That'll show her.] -> space_4_interaction_3_addendum_2
    # speaker: Bug
    <i>{MONSTER_NAME} burbles happily. </i>
    ** [Gra.. Grandma?] 
    # speaker: Narrator
    <i>You look through the rubble, but she's no where to be seen.</i>
    -> space_4_interaction_3_addendum_2
    

== space_4_interaction_3_addendum_1 ==
# speaker: Allison Wheeler
...
# speaker: Allison Wheeler
Grandma needs some time alone now. 
# speaker: Allison Wheeler
I baked these cookies, so you might as well have them.
# speaker: Allison Wheeler
...
# speaker: Allison Wheeler
Take care of yourself, grandkiddo.

{MONSTER_NAME == "<i>Un-named Bug Friend</i>":
* [Grandma, wait! I thought of a name for my bug!] 
    # speaker: Allison Wheeler
    THIS IS NOT A GOOD TIME!
    # speaker: Narrator
    <i>Grandma slams the door shut.</i>
    -> space_4_interaction_3_addendum_2
* [<i>Leave.</i>] -> space_4_interaction_3_addendum_2
}

{testing_in_ink== true: -> space_4}
-> DONE

== space_4_interaction_3_addendum_2 ==
{testing_in_ink== true: -> space_4}
-> DONE



=== space_4_interaction_4 === 
# speaker: Narrator
<i>You knock on the door, but there is no answer.</i>
# speaker: Narrator
<i>You notice on the porch is a basket of cookies and a note.</i>
-> space_4_interaction_4_addendum_1

== space_4_interaction_4_addendum_1 == 
* [Feed cookies to monster] 
    # speaker: Bug
    <i>The monster devours the cookies and basket whole.</i>
    ~ change_variable("hunger", medium_effect)
    -> space_4_interaction_4_addendum_1
* [read note]
    # speaker: Allison Wheeler
    Hi, grandkiddo.
    # speaker: Allison Wheeler
    I'm taking the day off to do some thinking. 
    # speaker: Allison Wheeler
    You know, when you were a baby and your parents first moved to town, I was so excited! I couldn't wait to get a front row seat to watching you grow into an incredible young woman. 
    # speaker: Allison Wheeler
    But sometimes it's hard watching you get older and make different choices than I would have made for you. 
    # speaker: Allison Wheeler
    And as much as I care about you, you sometimes like things and make decisions that I can't make heads or tail feathers of!
    # speaker: Allison Wheeler
    I don't understand those internet "mee-mee's," or why you think mint (which tastes like toothpase) is the best dessert flavor, or why on Dog's green earth you want to raise a giant monster insect-thing. 
    # speaker: Allison Wheeler
    So suffice to say, I have a <i>lot</i> to think about. 
    # speaker: Allison Wheeler
    Anyways, enjoy the mint cookies. I know they're your favorite.
        <i>Grandma</i>
    -> space_4_interaction_4_addendum_1
* [leave]
    {testing_in_ink== true: -> space_4}
    -> DONE


<i></i>

{testing_in_ink== true: -> space_4}
-> DONE

=== space_4_interaction_5 ===
# speaker: Allison Wheeler
Hey kiddo! 
# speaker: Narrator
<i>Grandma stands up from the porch, waving you over.</i>

* [Grandma? Are you okay?]
    # speaker: Allison Wheeler
    Aren't you sweet, asking about little old me? 
* [If you're going to be mean to {MONSTER_NAME}, I'm leaving.]
    # speaker: Allison Wheeler
    I won't be mean this time, I promise.
- 
# speaker: Allison Wheeler
What I wanted to say is that I don't understand you or your connection to this thing. But then I did some thinking and realized it's not a grandma's job to understand you or what you're up to.
# speaker: Allison Wheeler
    Honestly, the older I get, the more I realize how big and wild the world is. There's not enough smarts in this old gal to wrap her head around all the "what's-its" and "thing-a-ma-whatevers."
    # speaker: Allison Wheeler
    But it is a grandma's job to love and support her grandbaby, no matter who or <i>what</i> she drags home.
    # speaker: Allison Wheeler
    Just ask your mother about the time she told me she was marrying your father!
    {MONSTER_NAME != "<i>Un-named Bug Friend</i>":
    # speaker: Allison Wheeler
    Now, here's an extra helping of cookies for you and <i>{MONSTER_NAME_ACCORDING_TO_GRANDMA}</i>.
        * [Thanks, Grandma]
            # speaker: Allison Wheeler
            Now come here, and give this old lady a squeeze. And you too, you giant, invertebrate boyo!
            -> space_4_interaction_5_addendum_1
            
        * [I'm glad you came around to {MONSTER_NAME}]
            # speaker: Allison Wheeler
            Any friend of yours is a friend of mine. Now come here, and give this old lady a squeeze. And you too, you giant, invertebrate boyo!
                -> space_4_interaction_5_addendum_1
    - else: 
        # speaker: Allison Wheeler
        Now, here's an extra helping of cookies for you and... Honey, this is getting ridiculous! It's time you picked out a name for your pet already! 
                * [I'm going to name him Gemma, after you!]
                    ~ MONSTER_NAME = "Gemma"
                    ~ MONSTER_NAME_ACCORDING_TO_GRANDMA = "Gemma"
                    # speaker: Allison Wheeler
                    Honey, you're too sweet, and I can't wait to watch you grow. 
                    # speaker: Allison Wheeler
                    The <i>both</i> of you!
                    -> space_4_interaction_5_addendum_1
                * [I'm going to name him Cookie!]
                    ~ MONSTER_NAME = "Cookie"
                    ~ MONSTER_NAME_ACCORDING_TO_GRANDMA = "Cookie"
                    # speaker: Allison Wheeler
                    That's a precious name, and I can't wait to watch you grow. 
                    # speaker: Allison Wheeler
                    The <i>both</i> of you!
                    -> space_4_interaction_5_addendum_1
    }
    
{testing_in_ink== true: -> space_4}
-> DONE


=== space_4_interaction_5_addendum_1 ===
# speaker: Narrator
Grandma waits for you and {MONSTER_NAME} on her porch. 
# speaker: Narrator
Today, she's baked a giant cake for the two of you. You sit there on the stoop and share it together, watching the world whirl by.

{testing_in_ink== true: -> space_4}
-> DONE


=== space_4_destroyed_1 === 
# speaker: Narrator
Grandma's house is a pile of rubble. A desolate wind blows by.
# speaker: Narrator
Seeing you, a family walking by on the sidewalk crosses over to the other side of the road. 
# speaker: Narrator
. . . . . . . . . . . .
# speaker: Narrator
You miss Grandma...
{testing_in_ink== true: -> space_4}
-> DONE


=== space_4_interaction_6 === 
{you_chose_to_destroy_grandmas_house == true:
    # speaker: Narrator
    Grandma's house is a pile of rubble. A desolate wind blows by.
    Seeing you, a family walking by on the sidewalk crosses over to the other side of the road. 
    # speaker: Narrator
    You miss Grandma. 
    {testing_in_ink== true: -> space_4}
}
# speaker: Narrator
You come back to grandma's house and find her bustling around the kitchen, something delicious cooking in the oven. 
# speaker: Narrator
You spend a pleasant afternoon telling her about your day, asking her about what cartoons she grew up watching, and how soon you think {MONSTER_NAME} will molt.
{testing_in_ink== true: -> space_4}

{testing_in_ink== true: -> space_4}