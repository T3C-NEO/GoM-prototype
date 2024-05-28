extends Sprite2D

var chores 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chores = $"../.."


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_mouse_entered() -> void:
	if Input.is_action_pressed("mouse_left"):
		visible = false
		chores.cleaned -=1
