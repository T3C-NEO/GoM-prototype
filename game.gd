extends Node

var holding_item : bool;

var CEODone : bool = false;
var DebtDone : bool = false;
var OctoDone : bool = false;

#keeps track of bossman plinko 
var sliders_active : bool; 

#for final plinko 
var final_plinko : bool = true;

var PlinkNum : int = 0;

#what floor you're on
var floor : int = 6;

#keeping track of oomoos
var works : int = 5;

#keeping track of Katorah's minigame
var money : int = 20; 
var left_active : bool;
var right_active : bool;

<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
#trying something with global pos
var ghostPos : Vector2 = Vector2(514,241);
