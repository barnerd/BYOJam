== space_10 ==

{get_variable("is_current_destroyed"): -> space_10_destroyed}

{not space_10_interaction_1: -> space_10_interaction_1}
{not space_10_interaction_2: -> space_10_interaction_2}
{not space_10_interaction_3: -> space_10_interaction_3}
{not space_10_interaction_4: -> space_10_interaction_4}
{not space_10_interaction_5: -> space_10_interaction_5}
->space_10_interaction_6


==space_10_interaction_1==
#speaker: Narrator
While out on a walk you two see Dogtor Leasha waving goodbye to a family as they walk out of her office. Upon seeing you two she waves hello.
#speaker: Leasha
Well who is this little guy? {pc_name}, I don’t think I’ve met them before.

It’s my new mons— pet! Yeah, <i>pet</i>. His name is {MONSTER_NAME}. I adopted him recently from a family member who had a litter of uh… adorable little bundles of joy!
#speaker: Leasha
Well I’m glad to hear you’re getting outside and getting some exercise with them. But that’s only a part of what makes a healthy and happy life. 

You two should stop by soon, you’re due for a check up soon anyways, {pc_name}. I’ll let you both go though, and take a sucker with you.
#speaker: Narrator
Now knowing how to help {MONSTER_NAME} grow into a happy and healthy pet, his stomach expands. More visits here will guarantee that continues.
~ change_variable("hunger", amount_b) 
->DONE

==space_10_interaction_2==
#speaker: Narrator
Your parents have been hounding you to go in for a check up, and now even Leasha is barking at you. Better late than never though.
#speaker: Leasha
Now when it comes to diet what have you been feeding {MONSTER_NAME}?

+[Deep fried buffalo kale!]
While I’m happy to hear there’s <i>a veggie</i> in there, deep fried foods aren’t something to consume in vast amounts. 

You need balance! I’m prescribing some Kale with a tiny bit of olive oil and pepper instead. You’ll still get some good flavor that way.
    

+[Baby spinach.]
HOORAY! 

That’s a great, heart healthy choice. Seems like you’re already on top of a good diet. But don’t forget to balance it out. Why don’t you try to incorporate some protein as well too. 

Say, a nice grilled chicken breast?

-Please come back next week. You’re fine {pc_name}, but I’d like to see how {MONSTER_NAME} is doing. 
~ change_variable("hunger", amount_c) 
-> DONE

==space_10_interaction_3==
#speaker: Leasha
Welcome back {pc_name} and {MONSTER_NAME}, let’s take a look at you dear. Seems all in order, but I’m a bit concerned about hygiene. There seems to be a lot of goo around {MONSTER_NAME}’s mouth. 

I’m no absolute expert when it comes to the biology of… <i>adorable little bundles of joy </i>, 

but generally speaking good grooming practices usually improve self confidence and lead to longer lives. 

I’d like to see a tiny bit more care taken of {MONSTER_NAME}’s appearance next time, {pc_name}, but otherwise solid work. It seems you two get along well. 

Pop back in soon!
#speaker: Narrator
Leasha sees you both out
#speaker: Leasha
And don’t forget, a balanced diet!
	~ change_variable("hunger", amount_d)
	->DONE
	
	==space_10_interaction_4==
	#speaker: Leasha
If it isn’t my two favorite patients! Why don’t you tell me what you two have been up to?

+[Talk about some of your adventures with {MONSTER_NAME}]
Lovely! Sounds like you two were made for each other. One of the most important parts of any relationship though is play. 

Take some of these long lasting healthy treats to use as rewards for {MONSTER_NAME}. I’ve been doing some research and these seem to be a good snack for them.
	~ change_variable("hunger", amount_e) 
	->DONE
	
==space_10_interaction_5==
#speaker: Leasha
Wow you’ve grown X! It’s moments like these that make my heart flutter with pride. 

You ought to be proud too {pc_name}; taking care of yourself and another living creature is no small feat! Now, what has {MONSTER_NAME} been munching on as of late?

+[A bit of grilled meat, lots of fruits and veggies, a treat, and a few pretzel buns.]

Hot dog, you two are on fire! Ruby might have to put you two out, hahaha! Keep doing what you’re doing.
~ change_variable("hunger", amount_f) 
->DONE

+[Lots of white cheddar Cheezy Ballz!]
#speaker: Leasha
{pc_name}, while sometimes eating white cheddar Cheezy Ballz is okay and even necessary for a <i>bit</i> of variety, their whole diet cannot consist of them. 

I’d better see some more variety next time {pc_name}, or you’ll be fearing me more than your <i>DENTIST!</i>
~ change_variable("hunger", amount_e) 
->DONE

==space_10_interaction_6==
#speaker: Rosey
Leasha's office seems to be closed for the day. Either that or she really does malusdomesticaphobia, and you ought to throw away that core you've beeen holding onto.
~ change_variable("hunger", amount_e) 
->DONE

=== space_10_destroyed ===
# speaker: Narrator
The clinic that once served the whole town is gone. 
You look into {MONSTER_NAME}'s eyes. Surely he didn't mean to destroy <i>this</i> one. Him wrecking the place responsible for keeping the whole town healthy and safe, this must have been an accident. 
...Right?
~ coin_flip_for_panic_generatior()
{testing_in_ink:-> space_10|-> DONE}
