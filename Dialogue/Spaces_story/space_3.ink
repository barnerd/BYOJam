/// Below is how many times you've been here
VAR space_3_visit_counter = 0
/// 
VAR day_last_visited = 0

== space_3 ==
~ space_3_visit_counter += 1

{testing_in_ink == true: 
* [space_3_interaction_1] -> space_3_usher_intro
* [space_3_interaction_2] -> space_3_usher
* [space_3_interaction_3] -> space_3_usher
* [space_3_interaction_4] -> space_3_usher
* [space_3_interaction_5] -> space_3_usher
* [space_3_interaction_6] -> space_3_usher
- else: 
    {get_variable("is_current_destroyed"): -> space_3_destroyed}
    {not space_3_usher_intro: -> space_3_usher_intro}
    -> space_3_usher
}

=== space_3_usher_intro ===
# speaker: Narrator
You arrive in your town's church, which you mostly come to for its squeaky and squeaky clean basketball court. 
# speaker: Narrator
An usher approaches you with a beatific smile. 
# speaker: Church Usher
{pc_name}, you'll get an extra good treat if you visit our humble house of Dog multiple days in a row. 
But since this is your first time coming in a while, here. Have some delicious square pizza courtesy the archdiocese.
~ change_variable("hunger", amount_c) 
# speaker: Church Usher
But if you miss a day of service, we won't chastise you. You'll just get a slightly smaller reward. 
# speaker: Church Usher
Now, why don't you head in? I hear Elijah, the youth pastor, wanted to speak with you.
+ [Proceed]

~ day_last_visited = current_day
-> space_3_interaction_1


=== space_3_usher === 
{
- day_last_visited == current_day + 1:
    /// Reward for coming to church multiple days in a row.
    # speaker: Narrator
    The usher grins as you return back to church. 
    # speaker: Church Usher
    I appreciate you coming to service multiple days in a row like this. I hope Dog will smile down upon you this blessed day!
    Here, enjoy a tasty grilled cheese sandwich courtesy Her generosity.
    ~ change_variable("hunger", amount_d) 
- day_last_visited == current_day:
    /// mild reward for coming multiple days in a row
    # speaker: Narrator
    The usher smiles as you return back to church.
    # speaker: Church Usher
    Back again so soon? I feel like you were just here!
    # speaker: Church Usher
    No matter, I'll give you a small treat for your diligent presence.
    ~ change_variable("hunger", amount_b) 
- else:
    /// Light chastisement for missing a church service.
    # speaker: Church Usher
    Ah, {pc_name}, you were missed at our last church service. 
    # speaker: Church Usher
    Be that as it may, you are always welcome here. Speaking of, enjoy a small treat for stopping by!
}

~ day_last_visited = current_day

{
- space_3_visit_counter == 2: 
    -> space_3_interaction_2
- space_3_visit_counter == 3:
    -> space_3_interaction_3
- space_3_visit_counter == 4:
    -> space_3_interaction_4
- space_3_visit_counter == 5:
    -> space_3_interaction_5
- else: 
    -> space_3_interaction_6
}


=== space_3_interaction_1 ===
# speaker: Narrator
You head to inside the church's high ceiling chapel and are met at the door by the genail figure of Elijah Truman. 
# speaker: Elijah 
Hey, there, {pc_name}! I hope you're having a blessed and totally "on fleek" day and-- what is that thing? 
# speaker: Bug
<i>BUZZZZZZZZ!</i>
# speaker: Elijah 
Just when you think you've seen all the wonders of Dog's creation, She turns around and surprises you with somethign new. Haha!
# speaker: Elijah 
I mean, what even is this thing?
* [He's my magic pet!]
    # speaker: Elijah 
    Ma-magic? There's no such thing! In fact, the Good Boy Book says the only true power in the known universe belongs to Her.
* [He's a demon.]
    # speaker: Elijah 
    A demon? Haha, oh you kids. Always love to josh the very cool and with it youth pastor. 
- 
# speaker: Elijah 
Well, I'm sure there's a perfectly logical explanation for your pet that doesn't contradict my religion which forms the basis for my whole world view!
# speaker: Elijah 
Anyhow, I gotta run. Someone's drinking out of the baptismal font again. Catch you on the flippy flop!
{testing_in_ink:-> space_3|-> DONE}

=== space_3_interaction_2 ===
# speaker: Elijah 
{pc_name}, I did some research on the world wide web and learned about the wonders of Dog's fascinating bugkind to try and learn more about your sizable pet.
# speaker: Elijah 
I read about scorpions which are technically arachnids that can carry lethal amounts of venom, not poison.
# speaker: Elijah 
I also learned there are beetles that can produce light on their thoraxes and ants capable of lifting many times their own weight.
# speaker: Elijah 
But I found nothing about your enormous friend which started to raise all kinds of super cool questions!
# speaker: Elijah 
Like, what if this pet of yours really isn't of this Earth? I mean, look at how fast he's growing! By this time next month, he'll be bigger than a sky scraper!
# speaker: Elijah 
I mean, that's not natural. It doesn't follow Her plan for creation. 
+ (reasonable_explanation) [I'm sure there's a reasonable explanation.]
    # speaker: Elijah 
    Yes, let's not spin out. There is no question that Dog can't answer!
+ (god_is_dead) [Dog is dead. Long live bug!]
    # speaker: Elijah 
    You shouldn't joke like that {pc_name}. 
    
- 
# speaker: Elijah 
Our families down through the generations have kept the faith throughout famine, drought, war, and countless vet visits.
# speaker: Elijah 
I'm sure after a night's rumination, I'll shrug off this nagging feeling I've got from seeing this other worldly pet. 
# speaker: Elijah 
And this feeling isn't "doubt!" No, no. I'm rock solid in my faith! The only thing I'm nervous about is creating the poster for our annual chew toy drive. 
# speaker: Elijah 
Any chance you know how to use photoshop?
{testing_in_ink:-> space_3|-> DONE}

=== space_3_interaction_3 ===
# speaker: Narrator
You return to church and see Elijah pacing in front of his pulpit. 
# speaker: Elijah 
It's a funny thing, {pc_name}. I was giving the nine o' clock sermon on the authority of Dog in our lives. 
# speaker: Elijah 
How She is the ultimate knower and power in our lives, the world. That She worked through cosmic, mathematic, genelogical, and evolutionary forces to create existence and life as we know it. 
# speaker: Elijah 
This is what I've believed all my life, and then what crosses my mind but an image of your pet scuttling by.
# speaker: Elijah 
I mean, your bug defies physics, the one true Dog's very laws of the universe.
# speaker: Elijah 
You're feeding it a couple pizzas and all of a sudden it's the size of a three story building?
# speaker: Elijah 
Your pet, she isn't just physically problematic-- she's impossible! Scientifically, physically, and ecclesiastically. 
# speaker: Elijah 
I scoured the Good Boy Book, but there is nothing. Nothing that tells me how I'm supposed to make sense of such a thing.
* [You worry too much.]
    # speaker: Elijah 
    I know I do, but this is different. I feel like my whole religion is unraveling before my very eyes...

* [Call the pope!]
    # speaker: Elijah 
    I tried, but he just kept telling me to let that "old bug" fly out the window? 
    # speaker: Elijah 
     Maybe that's some kind of papal riddle, but I don't know. He's twenty-two which is ancient in dog years...
    
- 
# speaker: Elijah 
But I shouldn't trouble you with this. Besides I still have to prepare for the eleven o' clock sermon...
{testing_in_ink:-> space_3|-> DONE}

=== space_3_interaction_4 ===
# speaker: Narrator
You find Elijah in the church gym alone, shooting free throws. 
# speaker: Elijah 
Oh, hey there, {pc_name}. You think I've got a shot at making the NBA this year, or what? 
# speaker: Narrator
He shoots and doesn't even hit the rim.
# speaker: Elijah 
I came from a big litter and when I was a kid, the court was the one place I could be alone with my thoughts. 
# speaker: Elijah
It's funny. When I took the cloth, the bishop said to be on guard against the evils of the world, all the temptations to turn away from Her truth. 
# speaker: Elijah
So imagine my surprise when the thing that has me question everything is a giant bug kept by a member of my congregation. 
# speaker: Elijah
He shoots. He hits the rim, but the ball bounces out. 
 
* [What will you do?]
    # speaker: Elijah
    It's written that the one true Dog knows our past, present, and even our future. So even while I don't know what I'm going to do, somehow She does. 
    # speaker: Elijah
    Maybe that should give me comfort. Knowing that there is a future where I can live with this thing. That there'll be a time when I don't wake up confused and questioning what feels like every choice I made before. 
* [<i>Say nothing</i>]
    # speaker: Elijah
    I want to keep the faith. I really do. But it's hard to see living proof of something that exists outside everything I thought I knew.
    # speaker: Elijah
    I shouldn't lay this all on you, {pc_name}. Then again, maybe it's good for kids to see that no one, not adults or ordained priests truly have it all figured out...
    # speaker: Elijah
    We're all out here, just trying to piece it together. 

- 
# speaker: Narrator
He shoots. The ball circles the rim before dropping down. 
# speaker: Elijah
Boom! Call the scouting agent. I'm trading the cloth for a b-ball jersey!
# speaker: Elijah
Although while I'm waiting, maybe I should get started writing tomorrow's sermon. Plus, there's a new leave-in conditioner I've been meaning to try.
{testing_in_ink:-> space_3|-> DONE}

=== space_3_interaction_5 ===
# speaker: Narrator
You arrive at the church and find Elijah sitting in the pews staring up at the empty podium. 
# speaker: Elijah
Well, if it isn't my favorite parishoner! Don't tell the rest of my congregation I said that. 
# speaker: Elijah
I actually wanted to talk to you. Well, not you. 
# speaker: Elijah
Your friend. The giant bug scuttling past outside. 
# speaker: Narrator
You and Elijah head into courtyard where {MONSTER_NAME} rushes over, chittering in question. 
# speaker: Elijah
Elijah stares into your pet's predatory, intelligent eyes. 

# speaker: Elijah
There's so much about my faith and the world I profoundly don't understand. 
# speaker: Elijah
If heaven is real, is it a corpreal place? Do the laws of physics work there? 
# speaker: Elijah
How long did Dog exist in the silence and blackness of the world before she set the universe in motion to create us? 
# speaker: Elijah
And why us? Why not create a world sentient trees? Birds? Or Dog forbid: cats!
# speaker: Elijah
What is being alive if not accepting of powers and mysteries beyond our understanding?
{moth_origin_found == true: 
    # speaker: Rosey
    Actually, the moth comes from the tooth fairy, and--
    # speaker: Narrator
    Elijah ignores you, enraptured by his own words.
}
# speaker: Elijah
And this living mystery that towers before us, what are we supposed to do but love and accept it for what it is. 

{number_of_spaces_destroyed > 0: 
    # speaker: Rosey
    You know, {MONSTER_NAME} has resulted in some serious property damage already...
    # speaker: Narrator
    Elijah can't hear you, riding on his own epiphany.
}

# speaker: Elijah
Truly, I see now it is not my place to understand, but to love our confounding, joyful lives with all its mysteries that are not for us to solve.
# speaker: Elijah
Now come along. I'm doing a double shift at the soup kitchen and want to make sure I'm there early to set up.

{testing_in_ink:-> space_3|-> DONE}

=== space_3_interaction_6 ===
# speaker: Elijah
You return to the church and find Elijah back to his usual chipper, joyful self. 
You spend a pleasant afternoon shooting hoops and enjoying the quiet of the afternoon. 
{testing_in_ink:-> space_3|-> DONE}


=== space_3_destroyed ===
# speaker: Narrator
Elijah once gave a sermon that the church is more than stone, mortar, and squeaky pews. 
You sure hope he's right because all those things are decidedly <i>gone</i> now. 
With any luck, they were good building materials and went to their just resting place high up in the clouds.
{MONSTER_NAME} gnaws on what's left of the stations of the cross until you shoo him away.
~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_3|-> DONE}
