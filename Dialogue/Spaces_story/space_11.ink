VAR pc_name = "Rosey"
VAR vampire_slain = false
== space_11 ==

{testing_in_ink == true: 
* [space_11_interaction_1] -> space_11_interaction_1
* [space_11_interaction_2] -> space_11_interaction_2
* [space_11_interaction_3] -> space_11_interaction_3
* [space_11_interaction_4] -> space_11_interaction_4
* [space_11_interaction_5] -> space_11_interaction_5
* [space_11_interaction_6] -> space_11_interaction_6
* [space_11_interaction_7] -> space_11_interaction_7
+ [space_11_interaction_8]-> space_11_interaction_8
* [space_11_destroyed_1] -> space_11_destroyed
* [space_11_vampire_slain] -> space_11_vampire_slain
- else:

{get_variable("is_current_destroyed"): -> space_11_destroyed}

{vampire_slain == true: -> space_11_vampire_slain}


{not space_11_interaction_1: -> space_11_interaction_1}
{not space_11_interaction_2: -> space_11_interaction_2}
{not space_11_interaction_3: -> space_11_interaction_3}
{not space_11_interaction_4: -> space_11_interaction_4}
{not space_11_interaction_5: -> space_11_interaction_5}
{not space_11_interaction_6: -> space_11_interaction_6}
{not space_11_interaction_7: -> space_11_interaction_7}
-> space_11_interaction_8
}

=== space_11_interaction_1 ===
# speaker: Narrator
<i>You and {MONSTER_NAME} walk down the alley when you feel your hair stand up on the back of your neck.</i>
# speaker: Voice
"You!" <i>shouts someone from above.</i>
# speaker: Narrator
<i>Suddenly a bat swoops down from the twilight and transforms into the menacing, long toothed form of a... VAMPIRE!</i>
* (introduce)[Hi, I'm Ruthie!]
    
* (attack)[{MONSTER_NAME}, attack!]
    # speaker: Narrator
    <i>{MONSTER_NAME} charges, but the vampire turns into mist causing your bug to run face first into a wall.</i>
    # speaker: Wolfgang Crimson
- {space_11_interaction_1.introduce: I care not for your name! | <i>While your bug recovers, the man resumes his corpreal form with a punchable smirk.</i>}
# speaker: Narrator
# speaker: Wolfgang Crimson
So <i>this</i> is the so-called "beast" that hath the whipped the town into a furor?
# speaker: Wolfgang Crimson
Ha! This lowly invertebrate is naught compared to the terror of the night, the dread vampire hound himself: <i><b>Wolfgang Crimson!</b></i>
* (liked_cape)[I love your cape!]
    # speaker: Wolfgang Crimson
    Watch thy tone when you speak to your betters! 
* (asked_about_blood_bank)[Are you the one who keeps robbing the blood bank?]
    # speaker: Wolfgang Crimson
    That barely scratches the surface of my feats of unparalleled cunning and black hearted villainy. 
- 
# speaker: Wolfgang Crimson
Mark my words, when next we meet: I shall prove that I, Wolfgang Crimson, am this town's biggest, most fearsome monster!
# speaker: Wolfgang Crimson
Your paltry bug will be naught but a footnote as I enshrine myself into the nightmares of every townsperson here!
# speaker: Narrator
<i>Wolfgang cackles as he turns into a bat and again swoops off into the night.</i>

~ change_variable("max_fear_threshold", amount_a)
With Wolfgang on the prowl, the town has more to worry about than just {MONSTER_NAME}. <b>The maximum town panic threshold has permanently increased!</b>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_2 ===
# speaker: Narrator
The hair on the back of your neck stands on end as a familar figure vaults from the rooftop, landing right before you. 
# speaker: Wolfgang Crimson
I understand it not one jot! Since conversing with you, I've nightly stalked the city's urban center feasting upon innocents by the dozen!
# speaker: Wolfgang Crimson
It's proposterous! I gorged myself on a bus of tourists, exsanguinated the city's comptroller, and turned the giraffes at the zoo into my thralls!
# speaker: Wolfgang Crimson
And after this exceptionally heinous streak of villainy, what do the folks of this miserable burg have to say? 
# speaker: Wolfgang Crimson
<i>Oh, the bug. {pc_name}'s bug! That vile insect will destroy the town!
# speaker: Wolfgang Crimson
They cry "insect" while I am creating a maelstrom of terror under the cloak of night!
* (asked_about_day)[Maybe do it in the day?]
    # speaker: Narrator
    <i>The vampire furrows his brow, fixing you with a look of pure murder.</i>
    # speaker: Wolfgang Crimson
    "I shall make you rue this day! The city shall tremble before my might!"
    
* (cant_compete_w_bug)[You can't compete with a giant bug.]
    # speaker: Wolfgang Crimson
    And that's where you're wrong!
    # speaker: Wolfgang Crimson
    I've lived since the first settlers moved here and used sticks to build their homes and then spent the afternoons playing fetch with them.
- 
# speaker: Wolfgang Crimson
"When next you see me, this city shall tremble before the singular might and terror of its vampire lord: Wolfgang Crimson!"
{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_3 ===
# speaker: Narrator
You arrive to a familiar alley and find a slumped figure wearing a newly tattered cloak. 
# speaker: Wolfgang Crimson
So here you return to mock the great Wolfgang. I attempted to enact a streak of villainy so fearsome, that all would tremble. 
# speaker: Wolfgang Crimson
But try as I might, the people do not fear me as they once did. Now, they only gossip in awesome fear of one creature: your boon and too many legged companion. 

And now what am I to be, if I cannot be the famed scourge of this booming metropolis. My miserable half life's aspirations have come to naught...
* [Maybe you could do something else?]
    
* [Have you ever thought of being good?]
    # speaker: Wolfgang Crimson
    Good? What use is goodness? Throughout my centuries long life, I have seen countless societies and people inhabit this area. And the happiest folk are rarely, if ever, the most good. 
    * * [What do you want to do?] 
            
- 
# speaker: Wolfgang Crimson
For the whole of my undead life, all I have wanted is to be the city's fearsome monster. What else is a vampire to do?
# speaker: Wolfgang Crimson
If I cannot be the most fearsome, what use is there in this vapid misery known as existence?
# speaker: Narrator
<i>With that, the vampire morphs into a bat. They give a forlorn screech as they ascend up into the sky.</i>

~ change_variable("max_fear_threshold", amount_a)
With Wolfgang experiencing an existential crisis, the town has more to worry about than just {MONSTER_NAME}. <b>The maximum town panic threshold has permanently increased!</b>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_4 ===
# speaker: Narrator
<i>You return to a familiar alley and nearly trip over a shopping cart of empty ice cream containers.</i>
# speaker: Wolfgang Crimson
Back again, eh?

# speaker: Wolfgang Crimson
Since we last spoke, I sought relief in iced confections topped with goat's blood. 
# speaker: Wolfgang Crimson
Unfortunately the only thing I've accomplished is securing a bout indigestion from this dairy which hath never agreed with my infernal stomach!"
# speaker: Wolfgang Crimson
And now, here thee come with your superior beast to taunt me. There I have said it! Thy beast is more fearsome and noteworthy than I ever hope to be...
# speaker: Wolfgang Crimson
Woe is truly upon me for in all my life, I have never experienced such despair... Whatever am I to do with myself now?
* ["Could you find a new purpose?"]
    # speaker: Wolfgang Crimson
    "A new purpose, you say?"
    # speaker: Wolfgang Crimson
    "My nights are bleak and darker than they have been in a long time. Perhaps there could be something new, but in truth: I feel myself not finished wallowing." 
    # speaker: Wolfgang Crimson
    "Find me again. Perhaps then I shall be ready to consider how else I am to fill my miserable time on this Earth." 
    # speaker: Wolfgang Crimson
    <i>With that, Wolfgang transforms into bat form and wheels up into the sky.</i>
* ["He's weak. {MONSTER_NAME}, attack him!"]
    # speaker: Wolfgang Crimson
    "Yes, a battle! Mayhaps this is how my tale is to end. Defeat at the hands of my irksome rival." 
    # speaker: Wolfgang Crimson
    "Better to face the end with dignity and claws out, as opposed to drowning myself in discount desserts and type "O" goat's blood.
    # speaker: Narrator
    <i>Wolfgang charges, but he is no match for {MONSTER_NAME}.</i>
    # speaker: Narrator
    <i>Your beast gets the best of him and crushes him into the dirt.</i>
    Wolfgang coughs, clearly on death's door. 
    # speaker: Wolfgang Crimson
    "Fare thee well, the both of you. There will come a day when your beast falters, and I only hope you can weather its changing fate better than I."
    # speaker: Wolfgang Crimson
    "The most piercing lesson I've learned in my immortal half life: nothing lasts forever."
    # speaker: Narrator
    <i>Off your command, {MONSTER_NAME} rolls on top of Wolfgang, reducing him to a pile of ashes that scatter on the wind.</i> 
    # speaker: Wolfgang Crimson
    <i>Wolfgang is slain.</i>
    ~ vampire_slain = true
    
* ["You should walk into the sun"]
    # speaker: Wolfgang Crimson
    "Why not? It has been an age since I felt the light of the sun upon my skin. Perhaps it's time to feel that radiating warmth again."
    # speaker: Wolfgang Crimson
    "I have been so long in the cold, and I have long missed its warmth." 
    # speaker: Wolfgang Crimson
    "Fare thee well, the both of you. There will come a day when your beast falters, and I only hope you can weather its changing fate better than I."
    # speaker: Wolfgang Crimson
    "The most piercing lesson I've learned in my immortal half life: nothing lasts forever."
    # speaker: Narrator
    <i>With that, Wolfgang walks into the sun.</i>
    # speaker: Narrator
    <i>For a brief moment, he smiles.</i>
    # speaker: Narrator
    <i>Then he catches flame and burns white hot in the sun's rays before he is reduced to ashes that scatter in the wind.</i>
    # speaker: Narrator
    <i>Wolfgang is slain.</i>
    ~ vampire_slain = true
    /// Function to turn the space into lower fear. 

- 
{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_5 ===
# speaker: Narrator
Back at the familiar alley, you find an embarrassed Wolfgang who walks up to you, tail between his legs.  
# speaker: Wolfgang Crimson
"Apologies you had to see me like that last time. You'll notice I cleaned myself up the best I could, a difficult task given mirrors are of little use to me."
# speaker: Wolfgang Crimson
"I gave it some thought, but I still don't know what to do with my life. Have thee any thoughts? 
* (tailor)[Your cravat looks incredible. Maybe you could get into tailoring?]
    # speaker: Wolfgang Crimson
    "You think... so? I swore I'd never learn how to crochet but starting around century three, you start doing all kinds of things you never thought you'd do..." 
* (teacher)[You seem well spoken. Maybe you could get into teaching?]
    # speaker: Wolfgang Crimson
    "Don't be absurd! Vampires perish in sunlight, so there is no hope for me."
        ** [Have you heard of <i>night school?</i>]
            # speaker: Wolfgang Crimson
            "..."
            # speaker: Wolfgang Crimson
            "Ni.. Night school?" 
            # speaker: Wolfgang Crimson
            "You mean to say there the vaunted halls of education are not closed to the infernal likes of me?"
            # speaker: Wolfgang Crimson
            "I knew there was virtual learning, but I don't show up on cameras because of that trifle about vampires not showing up in mirrors, which I have never fully understood the mechanics of for I believed myself unwelcome in school!"
            # speaker: Wolfgang Crimson
            "But now, I see there is hope for me yet!
* (insurance)[Have you considered running an insurance company?]
    # speaker: Wolfgang Crimson
    "This whole time I thought to sow terror through acts of violence, but now I see there is a greater venue for causing collosal misery!" 
    # speaker: Wolfgang Crimson
    "Yes, I shall join a parasitic company that feeds on literal disaster and make it my busienss to pay out as little as possible. " 
    # speaker: Wolfgang Crimson
    "The best part, it's all perfectly legal!" 
    
- 
# speaker: Wolfgang Crimson
I thank you, {pc_name}. You have given me much to think about! Visit me anon to see how I get on with my new vocation.
# speaker: Narrator
<i>Wolfgang turns into a bat and flits into the sky.</i>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_6 ===
{space_11_interaction_5.tailor: -> space_11_interaction_6_tailor}
{space_11_interaction_5.teacher: -> space_11_interaction_6_teacher}
{space_11_interaction_5.insurance: -> space_11_interaction_6_insurance}

== space_11_interaction_6_tailor ==
# speaker: Wolfgang Crimson
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
# speaker: Wolfgang Crimson
"Salutations, child! I wonder if you would notice me in my new threads." 
# speaker: Narrator
<i>Wolfgang poses in a fine cravat, exceptionally tight pants, and a blazer that seems positively ablaze.</i>
# speaker: Wolfgang Crimson
"I posted some of my clothes up on poshmart, and the public positively ate them up! I'm drowning in orders from around the city. Who knew this whole time, a blood sucking vampire was a fashion icon waiting in the wings?"
# speaker: Wolfgang Crimson
"Perhaps I can't dominate the nightmares of this world, but maybe I can take over all the city's catwalks and fashion magazines." 
# speaker: Wolfgang Crimson
"If you cannot conquer in one venue, then seek new fields of battle." 
# speaker: Wolfgang Crimson
"I would be remiss if I did not thank you for your small part in my ascension to become a beloved fashionista." 
# speaker: Wolfgang Crimson
"Here, take a small token of my appreciation." 
/// TBD token of appreciation from Wolfgang
# speaker: Wolfgang Crimson
"Now I must away, the public clamors for the latest of Wolfgang, and who am I refuse them the pleasure of my magnificience?"
# speaker: Narrator
With that, Wolfgang flies off into the night.
{testing_in_ink:-> space_11|-> DONE}

== space_11_interaction_6_teacher ==
# speaker: Narrator
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
# speaker: Wolfgang Crimson
"Salutations, child! I wonder if you would notice me in my humble threads."
# speaker: Wolfgang Crimson
"I enrolled for classes at the local community college and imagine my delight: they had options for classes starting long after sundown!" 
# speaker: Wolfgang Crimson
"I signed up for philosophy 101, full stack computer programming because I hear that is a fine option if you want to ensure you can find work in computer egineering."
# speaker: Wolfgang Crimson
"Just for laughs, I also enrolled in a history of the Americas course, since I'm dying to point out all the historical inaccuracies they teach."
# speaker: Wolfgang Crimson
"Benjamin Franklin was a real dog, and George Washington was a right piece of work!"
# speaker: Wolfgang Crimson
"Anyhow, I've got to swing by the campus bookstore to buy what I can only imagine are exceptionally affordable textbooks."
# speaker: Wolfgang Crimson
"Until next time!"

{testing_in_ink:-> space_11|-> DONE}

== space_11_interaction_6_insurance ==
# speaker: Narrator
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
# speaker: Wolfgang Crimson
"{pc_name}, I followed your advice and wrote a resume spelling out my callous heart, predeliction for unspeakable violence, and nocturnal hours."
# speaker: Wolfgang Crimson
I submitted my qualifications via LinkedIn quick submission and within an hour, a recruiter from Liberty Mutual offered me a senior level position!
# speaker: Wolfgang Crimson
To think, I thought my days of sucking the vitality from this wretched city were at an end all because I couldn't be some singular creature of the night. 
# speaker: Wolfgang Crimson
It turns out, abandoning my nightstalking ways has opened me up to new  and exceptionally profittable manners of antagonism far beyond what I dreamed!
# speaker: Wolfgang Crimson
I thank you and your monstrous bug for showing me the darkness in this detestable light. 
# speaker: Wolfgang Crimson
And might I suggest: destroy the city with reckless abandon! I'll look forward to selling more insurance with every bit of damage and then turning to mist whenever pressed into payment from policy holders. 
# speaker: Wolfgang Crimson
Thanks for thy help, and I shall see you anon!
{testing_in_ink:-> space_11|-> DONE}


=== space_11_interaction_7 ===
# speaker: Wolfgang Crimson
Ah, come to visit my old haunts!
# speaker: Wolfgang Crimson
I am much improved these nights, but I am indebted to you for your help. 
{space_11_interaction_5.tailor: In honor of you and your friend, I designed a pair of capri pants with your bug's hideous visage across the posterior!}
# speaker: Wolfgang Crimson
{space_11_interaction_5.teacher: Inspired by you and your friend, I started an entomology class. Maybe I'll learn his insectoid secrets after all!}
# speaker: Wolfgang Crimson
{space_11_interaction_5.insurance: In fact, I started selling insurance to the townspeople for "giant bug attacks."}

# speaker: Wolfgang Crimson
In any case, I'm sure the town will rest easier now that I've settled into a new and much improved role.

~ change_variable("max_fear_threshold", amount_a)
With Wolfgang content in his new role, the town has found new tolerance for {MONSTER_NAME}. <b>The maximum town panic threshold has permanently increased!</b>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_8 ===
# speaker: Narrator
Returning to the spooky alley, you run into your pal Wolfgang Crimson. 
# speaker: Narrator
He catches you up on his latest adventures and you spend a pleasant afternoon in the company of your two favorite monsters.

~ change_variable("hunger", amount_c) 

Best of all, the three of you split bottles of blood red cranberry soda. At least, that's what you hope it is...

{testing_in_ink:-> space_11|-> DONE}


/// DESTROYED SPACE
=== space_11_destroyed_1 ===
{testing_in_ink:-> space_11|-> DONE}


/// vampire slain space
=== space_11_vampire_slain ===
# speaker: Narrator
The street where Wolfgang Crimson hunted is quiet. The sun shines brighter and your hair stops raising like it did when he was around.
Relieved that the fiend is no more, a baker rushes out to give you free cookies on the house for ridding the town of its demonic bloodsucker. 

~ change_variable("hunger", amount_c) 

The baked goods are sweet, almost too much your taste. {MONSTER_NAME} doesn't mind in the slightest.

Afterwards {MONSTER_NAME} lets you ride on his back as you continue on your daily walk around the city.
{testing_in_ink:-> space_11|-> DONE}


=== space_11_destroyed ===
# speaker: Narrator
It's just not the vampire that's been destroyed. It's the florist shop. The bakery. The discount tire shop that keeps weird business hours and always seems open.
In any case, you won't need to ponder the mysteries of the midnigt auto shop since that and everything else has been summarily demolished. 
# speaker: BUG
The culprit picks his teeth with a telephone pole with a smug CHITTER.

~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_11|-> DONE}
