extends Node2D
onready var texture=get_node("Texture")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	texture.material=null
	$Control.connect("mouse_entered",self,"_on_mouse_entered")
	$Control.connect("mouse_exited",self,"_on_mouse_exited")
	$Control.connect("gui_input",self,"_on_input_event")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_mouse_entered():
	$"ReferenceRect".visible=true
	pass
func _on_mouse_exited():

	$"ReferenceRect".visible=false
	pass
	

func _on_input_event(event):
	if event is InputEventMouseButton:
		if event.button_index==BUTTON_LEFT and event.pressed:
			$AcceptDialog.popup()


	pass # Replace with function body.


