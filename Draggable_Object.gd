extends Control

var grabbed=false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".connect("gui_input",self,"input_event")
	pass # Replace with function body.

func input_event(event):
	if event is InputEventMouseButton:
		if event.button_index==BUTTON_LEFT and event.pressed and !grabbed:
			pass

	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
