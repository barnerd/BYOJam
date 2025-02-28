== space_10 ==

{not space_10_interaction_1: -> space_10_interaction_1}
{not space_10_interaction_2: -> space_10_interaction_2}
{not space_10_interaction_3: -> space_10_interaction_3}
{not space_10_interaction_4: -> space_10_interaction_4}
{not space_10_interaction_5: -> space_10_interaction_5}

+[choice one] -> space_10_interaction_1
+[choice two] ->space_10_interaction_2
+[choice three] ->space_10_interaction_3
+[choice four] ->space_10_interaction_4
+[choice five] ->space_10_interaction_5


==space_10_interaction_1==
#speaker: Narrator
While out on a walk you two see Dogtor Leasha waving goodbye to a family as they walk out of her office. Upon seeing you two she waves hello.
#speaker: Leasha
	Leasha: Well who is this little guy? {pc_name}, I don’t think I’ve met them before.
#speaker: Player
Player: It’s my new mons— pet! Yeah, pet. His name is {MONSTER_NAME}. I adopted him recently from a family member who had a litter of uh… adorable little bundles of joy!
#speaker: Leasha
Leasha: Well I’m glad to hear you’re getting outside and getting some exercise with them. But that’s only a part of what makes a healthy and happy life. You two should stop by soon, You’re due for a check up soon anyways, {pc_nmae}. I’ll let you two go though, and take a sucker with you.
#speaker: Narrator
Now knowing how to help {MONSTER_NAME} grow into a happy and healthy pet, his appetite expands. More visits here will guarantee that continues.
///~ change_variable("hunger", 1)
->DONE

==space_10_interaction_2==
#speaker: Narrator
Your parents have been hounding you to go in for a check up, and now even Leasha is barking at you. Better late than never though.
#speaker: Leasha
	Leasha: Now when it comes to diet what have you been feeding {MONSTER_NAME}?

+[Deep fried buffalo kale!]
    Leasha: While I’m happy to hear there’s a veggie in there, deep fried foods aren’t something to consume in vast amounts. You need balance! I’m prescribing some Kale with a tiny bit of olive oil and pepper instead. You’ll still get some good flavor that way.
    

+[Baby spinach.]
Leasha: HOORAY! That’s a great, heart healthy choice. Seems like you’re already on top of a good diet. But don’t forget to balance it out. Why don’t you try to incorporate some protein as well too. Say, a nice grilled chicken breast?

-Please come back next week. You’re fine {pc_name}, but I’d like to see how {MONSTER_NAME} is doing. 
///~ change_variable("hunger", 2)
-> DONE

==space_10_interaction_3==
#speaker: Leasha
Welcome back {pc_name} and {MONSTER_NAME}, let’s take a look at you dear. Seems all in order, but I’m a bit concerned about hygiene. There seems to be a lot of goo around {MONSTER_NAME}’s mouth. I’m no absolute expert when it comes to the biology of… little adorable bundles of joy, but generally speaking good grooming practices usually improve self confidence and lead to longer lives. I’d like to see a tiny bit more care taken of {MONSTER_NAME}’s appearance next time, {pc_name}, but otherwise solid work. It seems you two get along well. Pop back in soon! 
#speaker: Narrator
	Leasha see’s you both out
#speaker: Leasha
	And don’t forget, a balanced diet! 
	->DONE
	
	==space_10_interaction_4==
	#speaker: Leasha
	Leasha: If it isn’t my two favorite patients! Why don’t you tell me what you two have been up to?
+[Talk about some of your adventures with {MONSTER_NAME}]
	Leasha: Lovely! Sounds like you two were made for each other. One of the most important parts of any relationship though is play. Take some of these long lasting healthy treats to use as rewards for {MONSTER_NAME}. I’ve been doing some research and these seem to be a good snack for them.
	->DONE
	
==space_10_interaction_5==
#speaker: Leasha
Leasha: Wow you’ve grown X! It’s moments like these that make my heart flutter with pride. You ought to be proud too {pc_name}; taking care of yourself and another living creature is no small feat! Now, what has {MONSTER_NAME} been munching on as of late?

+[A bit of grilled meat, lots of fruits and veggies, a treat, and a few pretzel buns.]

Leasha: Hot dog, you two are on fire! Ruby might have to put you two out, hahaha! Keep doing what you’re doing.
->DONE

+[Lots of white cheddar Cheezy Ballz!]
#speaker: Leasha
Leasha: {pc_name}, while eating white cheddar Cheezy Ballz is okay sometimes and even necessary for some variety, their whole diet cannot consist of them. I’d better see some more variety next time {pc_name}, or you’ll be fearing me more than your dentist!
->DONE
