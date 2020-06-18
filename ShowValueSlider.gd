extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".connect("value_changed",self,"show_value")
	pass # Replace with function body.

func show_value(value):
	$"../../Label".text=str(value)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
