extends Area2D


var dragging=false
signal isDragged
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func set_dragging():
	dragging=!dragging

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("input_event",self,"input_event")
	pass # Replace with function body.

func input_event(viewport,event,shape):

	if event is InputEventMouseButton:
		if event.button_index==BUTTON_LEFT and event.pressed:
			set_dragging()
			emit_signal("isDragged",dragging)
		elif event.button_index==BUTTON_LEFT and !event.pressed:
			set_dragging()
			emit_signal("isDragged",dragging)
			pass

	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		var mouse_pos=get_viewport().get_mouse_position()
		self.set_position(Vector2(mouse_pos.x,mouse_pos.y))
	pass
