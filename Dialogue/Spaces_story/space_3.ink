VAR moth_color = "blue"

== space_3 ==

This is space 3.

+ [interaction_1] -> space_3_interaction_1
+ [interaction_2] -> space_3_interaction_2
+ [interaction_3] -> space_3_interaction_3


=== space_3_interaction_1 === 
What color do you think the moth looks best in?
* [Blue] 
    ~ moth_color = "blue"
* [Red]
    ~ moth_color = "red"
- Great!

{testing_in_ink== true: -> space_3}
-> DONE


=== space_3_interaction_2 === 
Wow, I love the moth's shining {moth_color} eyes!
Test_2
{testing_in_ink== true: -> space_3}
-> DONE

=== space_3_interaction_3 ===
Test_3
{testing_in_ink== true: -> space_3}
-> DONE
