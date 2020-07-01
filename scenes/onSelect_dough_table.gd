extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func highlight_table():
	get_parent().get_material

func select_dough_table(viewport,event,shape):
	if event is InputEventMouseButton:
		if event.pressed:
			print("hey you clicked on a dough table")
	
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("input_event",self,"select_dough_table")
	self.connect("mouse_entered",self,"highlight_table")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
