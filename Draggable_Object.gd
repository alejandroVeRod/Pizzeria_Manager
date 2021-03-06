extends Control

var dragging=false
signal is_dragged
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_dragging():
	dragging=!dragging

# Called when the node enters the scene tree for the first time.
func _ready():
	$".".connect("gui_input",self,"input_event")
	self.connect("is_dragged",self,"set_dragging")
	pass # Replace with function body.

func input_event(event):

	if event is InputEventMouseButton:
		if event.button_index==BUTTON_LEFT and event.pressed:
			emit_signal("is_dragged")
		elif event.button_index==BUTTON_LEFT and !event.pressed:
			emit_signal("is_dragged")
			pass

	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mouse_pos=get_viewport().get_mouse_position()
		$".".set_position(Vector2(mouse_pos.x,mouse_pos.y))
	pass
