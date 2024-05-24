extends Node2D

@onready var prong = $Prong2;
@onready var rb = $RigidBody2D;
@onready var brain = preload("res://brain.tscn");
#var initial_color : Color;

func _ready() -> void:
	#ensures drop is different even when from the same position
	rb.physics_material_override.set_bounce(randf_range(0.3, 0.7));


func _process(_delta: float) -> void:
	pass


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if(body.name == "chip"):
		if prong.modulate.r != 0:
			var brains = brain.instantiate();
			add_child(brains);
			Game.PlinkNum += 1;
			prong.modulate.r = 0;
