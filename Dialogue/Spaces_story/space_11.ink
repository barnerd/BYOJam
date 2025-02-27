VAR pc_name = "Rosy"
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
* [space_11_destroyed_1] -> space_11_destroyed_1
* [space_11_vampire_slain] -> space_11_vampire_slain
- else:
{vampire_slain == true: -> space_11_vampire_slain}
{not space_11_interaction_1: -> space_11_interaction_1}
{not space_11_interaction_2: -> space_11_interaction_2}
{not space_11_interaction_3: -> space_11_interaction_3}
{not space_11_interaction_4: -> space_11_interaction_4}
{not space_11_interaction_5: -> space_11_interaction_5}
{not space_11_interaction_6: -> space_11_interaction_6}
{not space_11_interaction_7: -> space_11_interaction_7}
}

=== space_11_interaction_1 ===
<i>You and {MONSTER_NAME} walk down the alley when you feel your hair stand up on the back of your neck.</i>
"You!" <i>shouts someone from above.</i>
<i>Suddenly a bat swoops down from the twilight and transforms into the menacing, long toothed form of a... VAMPIRE!</i>
* (introduce)[Hi, I'm Ruthie!]
    
* (attack)[{MONSTER_NAME}, attack!]
    <i>{MONSTER_NAME} charges, but the vampire turns into mist causing your bug to run face first into a wall.</i>
- {space_11_interaction_1.introduce: I care not for your name!  | <i>While your bug recovers, the man resumes his corpreal form with a punchable smirk.</i>}
So <i>this</i> is the so-called "beast" that hath the whipped the town into a furor?

Ha! This lowly invertebrate is naught compared to the terror of the night, the dread vampire hound himself: <i><b>Wolfgang Crimson!</i></b>
* (liked_cape)[I love your cape!]
    Watch thy tone when you speak to your betters! 
* (asked_about_blood_bank)[Are you the one who keeps robbing the blood bank?]
    That barely scratches the surface of my feats of unparalleled cunning and black hearted villainy. 
- Mark my words, when next we meet: I shall prove that I, Wolfgang Crimson, am this town's biggest, most fearsome monster!
Your paltry bug will be naught but a footnote as I enshrine myself into the nightmares of every townsperson here!
<i>Wolfgang cackles as he turns into a bat and again swoops off into the night.</i>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_2 ===
The hair on the back of your neck stands on end as a familar figure vaults from the rooftop, landing right before you. 
I understand it not one jot! Since conversing with you, I've stalked the city's urban center and the only thing everyone wants to talk about: is you and your cursed pet!
It's proposterous. I supped on a bus of tourists, exsanguinated the city's comptroller, and turned the giraffes at the zoo into my thralls!
And after this exceptionally heinous streak of villainy, what do the folks of this miserable burg have to say? 
<i>Oh, the bug. {pc_name}'s bug! That vile insect will destroy the town!
They cry 'bug' while I am nightly creating a maelstrom of terror under the cloak of night!
* (asked_about_day)[Maybe do it in the day?]
    <i>The vampire furrows his brow, fixing you with a look of pure murder.</i>
    
    "I shall make you rue this day! The city shall tremble before my might!"
    
* (cant_compete_w_bug)[You can't compete with a giant bug]
    And that's where you're wrong!
    I've lived since the first settlers moved here and used sticks to build their homes and then spent the afternoons playing fetch with them.
- "When next you see me, this city shall tremble before the singular might and terror of its vampire lord: Wolfgang Crimson!"
{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_3 ===
You arrive to a familiar alley and find a slumped figure wearing a newly tattered cloak. 
So here you return to mock the great Wolfgang. I attempted to enact a streak of villainy so fearsome, that all would tremble. 
But try as I might, the people only fear one creature, and that is your boon and too many legged companion. 
To think. I've lived two thousand years and I have seen countless sights curious and strange but never a beast such as this. 
And now what am I to be, if I cannot be the scourge of this booming metropolis. My miserable half life's aspirations has all come to naught...
* [What do you want to do?]
    
* [Have you ever thought of being good?]
    
    Good? What use is goodness? Throughout my centuries long life, I have seen countless societies and people inhabit this area. And the happiest folk are rarely, if ever, the most good. 
    * * [What do you want to do?] 
            
- In all my undead life, all I have wanted is to be the city's fearsome monster. What else is a vampire to do?
If I cannot be the most fearsome, what use is there in this vapid misery known as existence?
<i>With that, the vampire morphs into a bat. They give a forlorn screech as they ascend up into the sky.</i>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_4 ===
<i>You return to a familiar alley and nearly trip over a shopping cart of empty ice cream containers and a bucket of dripping blood.</i> 
"Back again, eh?"
<i>Wolfgang Crimson looks up at you and {MONSTER_NAME}, his face smeared with blood infused rocky road ice cream.</i>
"Since we last spoke, I sought relief in the form of iced confection topped with sweetened goat blood. Unfortunately the only relief I've won myself is indigestion from all this dairy which hath never agreed with my inferior and infernal stomach!"
"And now, here thee come with your superior beast to taunt me. There I have said it! Thy beast is more fearsome and noteworthy than I ever hope to be...
Self pity. Woe is truly upon me for in all my life, I have never experienced such a despair... Whatever am I to do with myself now?
* ["Could you find a new purpose?"]
    "A new purpose, you say?" 
    "My nights are bleak and darker than they have been in a long time. Perhaps there could be something new, but in truth: I feel myself not finished wallowing." 
    "Find me again. Perhaps then I shall be ready to consider how else I am to fill my miserable time on this Earth." 
    <i>With that, Wolfgang transforms into his bat form and wheels up into the sky.</i>
* ["He's weak. {MONSTER_NAME}, attack him!"]
    
    "Yes, a battle! Mayhaps this is how my tale is to end. Defeat at the hands of my irksome rival." 
    "Better to face the end with dignity and claws out, as opposed to drowning myself in discount desserts and type "O" goat's blood.
    <i>Wolfgang charges, but he is no match for {MONSTER_NAME}.</i>
    <i>Your beast gets the best of him and crushes him into the dirt.</i>
    Wolfgang coughs, clearly on death's door. 
    "Fare thee well, the both of you. There will come a day when your beast falters, and I only hope you can weather its changing fate better than I."
    "The most piercing lesson I've learned in my immortal half life: nothing lasts forever." 
    <i>Off your command, {MONSTER_NAME} rolls on top of Wolfgang, reducing him to a pile of ashes that scatter on the wind.</i> 
    <i>Wolfgang is slain.</i>
    ~ vampire_slain = true
    /// Function to turn the space into lower fear. 
* ["You should walk into the sun"]
    "Why not? It has been an age since I felt the light of the sun upon my skin. Perhaps it's time to feel that radiating warmth again."
    "I have been so long in the cold, and I have long missed its warmth." 
    "Fare thee well, the both of you. There will come a day when your beast falters, and I only hope you can weather its changing fate better than I."
    "The most piercing lesson I've learned in my immortal half life: nothing lasts forever." 
    <i>With that, Wolfgang walks into the sun.</i>
    <i>For a brief moment, he smiles.</i>
    <i>Then he catches flame and burns white hot in the sun's rays before he is reduced to ashes that scatter in the wind.</i>
    <i>Wolfgang is slain.</i>
    ~ vampire_slain = true
    /// Function to turn the space into lower fear. 

- 
{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_5 ===
Back at the familiar alley, you find an embarrassed Wolfgang who walks up to you, tail between his legs.  
"Apologies you had to see me like that last time. You'll notice I cleaned myself up the best I could, a difficult task given mirrors are of little use to me."
"I gave it some thought, but I still don't know what I should next with my life. Have thee any thoughts? 
* (tailor)[Your cravat looks incredible. Maybe you could get into tailoring?]
    "You think... so? I swore I'd never learn how to crochet but starting around century three, you start doing all kinds of things you never thought you'd do..." 
* (teacher)[You seem well spoken. Maybe you could get into teaching?]
    "Don't be absurd! Vampires perish in sunlight, so there is no hope for me."
        ** [Have you heard of <i>night school?</i>]
            "..."
            "Ni.. Night school?" 
            "You mean to say there the vaunted halls of education are not closed to the infernal likes of me?"
            "I knew there was virtual learning, but I don't show up on cameras because of that trifle about vampires not showing up in mirrors, which I have never fully understood the mechanics for I believed myself unwelcome in school!"
            "But now, I see there is hope for me yet!
* (insurance)[Have you considered running an insurance company?]
    "This whole time I thought to sow terror and despair through acts of violence, but now I see there is a greater venue for causing widespread tragedy!" 
    "Yes, I shall join a parasitic company that feeds on fear of disaster and make it my busienss to pay out as little as possible. " 
    "The best part, it's all perfectly legal!" 
- I thank you, {pc_name}. You have given me much to think about! Visit me anon to see how I get on with my new vocation.
<i>Wolfgang turns into a bat and flits into the sky.</i>

{testing_in_ink:-> space_11|-> DONE}

=== space_11_interaction_6 ===
{space_11_interaction_5.tailor: -> space_11_interaction_6_tailor}
{space_11_interaction_5.teacher: -> space_11_interaction_6_teacher}
{space_11_interaction_5.insurance: -> space_11_interaction_6_insurance}

== space_11_interaction_6_tailor ==
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
"Salutations, child! I wonder if you would notice me in my new threads." 
<i>Wolfgang poses in a fine cravat, exceptionally tight pants, and a blazer that seems positively ablaze.</i>
"I posted some of my clothes up on poshmart, and the public positively ate them up! I'm drowning in orders from around the city. Who knew this whole time, a blood sucking vampire was a fashion icon waiting in the wings?"
"Perhaps I can't dominate the nightmares of this world, but maybe I can take over all the city's catwalks and fashion magazines." 
"If you cannot conquer in one venue, then seek new fields of battle." 
"I would be remiss if I did not thank you for your small part in my ascension to become a beloved fashionista." 
"Here, take a small token of my appreciation." 
/// TBD token of appreciation from Wolfgang
"Now I must away, the public clamors for the latest of Wolfgang, and who am I refuse them the pleasure of my magnificience?"
With that, Wolfgang flies off into the night.
{testing_in_ink:-> space_11|-> DONE}

== space_11_interaction_6_teacher ==
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
"Salutations, child! I wonder if you would notice me in my humble threads."
"I enrolled for classes at the local community college and imagine my delight: they had options for classes starting long after sundown!" 
"I signed up for philosophy 101, full stack computer programming because I hear that is a fine option if you want to ensure you can find work in computer egineering."
"Just for laughs, I also enrolled in a history of the Americas course, since I'm dying to point out all the historical inaccuracies they teach."
"Benjamin Franklin was a real dog, and George Washington was a right piece of work!"
"Anyhow, I've got to swing by the campus bookstore to buy what I can only imagine are exceptionally affordable textbooks."
"Until next time!"

{testing_in_ink:-> space_11|-> DONE}

== space_11_interaction_6_insurance ==
<i>You arrive in the alley and watch in surprise as a familiar bat swoops by overhead. They land in the street and reveal themselves as the revitalized vampire, Wolfgang.</i>
"{pc_name}, I followed your advice and wrote up a resume spelling out my callous heart, predeliction for unspeakable violence, and nocturnal hours."
I submitted my qualifications via LinkedIn quick submission and within an hour, a recruiter from Liberty Mutual offered me a senior level position!
To think, I thought my days of sucking the vitality from this wretched city were at an end all because I couldn't be some singular creature of the night. 
It turns out, abandoning my nightstalking ways has opened me up to new  and exceptionally profittable manners of antagonism far beyond what I dreamed!
I thank you and your monstrous bug for showing me the light in this darkness. 
And might I suggest: destroy the city with reckless abandon! I'll look forward to selling more insurance with every bit of damage and then turning to mist whenever pressed into payment from policy holders. 
Thanks for thy help, and I shall see you anon!
{testing_in_ink:-> space_11|-> DONE}


=== space_11_interaction_7 ===
Ah, come to visit my old haunts!
I am much improved these nights, but I am indebted to you for your help. 
In fact, I started selling insurance to the townspeople for "giant bug attacks."
I'm sure this will reduce their panic at your pet's fearsome visage.
/// Cycles randomly depending on profession choice above.

{testing_in_ink:-> space_11|-> DONE}


/// DESTROYED SPACE
=== space_11_destroyed_1 ===
{testing_in_ink:-> space_11|-> DONE}


/// vampire slain space
=== space_11_vampire_slain ===
Unique interaction that loops and cycles when vampire is slain.
{testing_in_ink:-> space_11|-> DONE}
