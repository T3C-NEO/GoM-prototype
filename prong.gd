extends Node2D

@onready var prong = $Prong2;
@onready var rb = $RigidBody2D;
#var initial_color : Color;

func _ready() -> void:
	#ensures drop is different even when from the same position
	rb.physics_material_override.set_bounce(randf_range(0.3, 0.7));


func _process(_delta: float) -> void:
	pass


func _on_rigid_body_2d_body_entered(body: Node) -> void:
	if(body.name == "chip"):
		prong.modulate.r = 0;
