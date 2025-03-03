VAR visited_basement = false

== space_1_interaction_1_basement ==
This is the basement


{visited_basement == false:
    ~ visited_basement = true
    # speaker: Narrator
    You take Lotta Scoops head down to the basement that serves as the house's library
    # speaker: Lotta
    This room is positioned directly below your bedroom, {pc_name}. Maybe something happened here that led to the arrival of that egg in your room?
}

{kick_to_end_active == true: 
   
    + [Examine monster book pg 1] -> space_1_interaction_1_basement_book_1
    + [Examine monster book pg 2] -> space_1_interaction_1_basement_book_2
    + [Examine toy chest] -> space_1_interaction_1_basement_toychest
    + [Examine secret journal] -> space_1_interaction_1_basement_journal
    * [Exit]
        ~ kick_to_end_active = false
        {testing_in_ink:-> space_1|-> DONE}
- else: 
    + [Examine monster book pg 1] -> space_1_interaction_1_basement_book_1
    + [Examine monster book pg 2] -> space_1_interaction_1_basement_book_2
    + [Examine toy chest] -> space_1_interaction_1_basement_toychest
    + [Examine secret journal] -> space_1_interaction_1_basement_journal
    + [Leave to search other areas]
    -> space_1_interaction_1
}



== space_1_interaction_1_basement_book_1 ==
# speaker: Narrator
The book details a list of common monsters that have been known to appear in the world. 

<b>ENTRY 1:</b>
CREATURE: Demons. 
ORIGIN: Come from underworld to punish the wicked.
PURPOSE: They are known to create hellspawn meant to forward their sinister agendas. They are known for having sharp claws. 
WEAKNESSES: They hate the usual "vampire stuff."
SIGNS: They produce an eerie orange light. 

<b>ENTRY 2:</b>
CREATURE: Yetis. 
ORIGIN: They hail from the hail ridden tundras of the far, far North.
PURPOSE: They love to play bizarre tricks with magic from their homeland. 
WEAKNESSES: They are devoted pranksters and can never resist the opportunity to pull practical jokes. 
SIGNS: Their magic is denoted by a powerful yellow light. 
-> space_1_interaction_1_basement

== space_1_interaction_1_basement_book_2 ==
# speaker: Narrator
The book details a list of common monsters that have been known to appear in the world. 

<b>ENTRY 3:</b>
CREATURE: Tooth Fairy
ORIGIN: The realm of Fae, accessible by magic portals. 
PURPOSE: They collect the teeth of mortals and in rare instances, have been known to bestow wishes. 
WEAKNESSES: Good dental hygiene. 
SIGNS: They produce a glowing red light. 

<b>ENTRY 4:</b>
CREATURE: Aliens
ORIGIN: The far reaches of outer space. 
PURPOSE: They perform tests on dogs, often leaving them disoriented after their visitations.
They have been known to accidentally leave their progeny while visiting Earth.
WEAKNESSES: They are terrified of fish. 
SIGNS: Visitations are denoted by flashes of curious orange, red, or blue light. 
-> space_1_interaction_1_basement

== space_1_interaction_1_basement_toychest ==
# speaker: Lotta
"Look at this a toy chest that is strangely... empty?"
# speaker: Narrator
You explain that your parents took away your allowance after you threw a spoon at your brother. 
You complain about having no money to get new toys which you think is grounds for suing the government to get new parents. 
# speaker: Lotta
...Yeah, I don't think this will make it into the podcast.
-> space_1_interaction_1_basement

== space_1_interaction_1_basement_journal ==
# speaker: Lotta
Ooh, what have we here? A secret journal!" 
Let's see, it says here that it's written by your brother Ringo."
The latest page is an entry of things {pc_name} says when you've got your mouth guard in." 
It looks like the mouth guard really messed with your ability to talk normally..." 
<i>My tother ith tho thupid!</i>" 
"<i>Juth becuth Ringo can writhe, doesn't mean heath smarm!</i>" 
"<i>Where ith my toof waist?</i>" 
-> space_1_interaction_1_basement



