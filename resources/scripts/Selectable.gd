extends Area2D

var NumberGenerator = RandomNumberGenerator.new()

signal select

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func randomize_color():
	self.NumberGenerator.randomize()
	var new_red=self.NumberGenerator.randf_range(0.0,1.0)
	self.NumberGenerator.randomize()
	var new_blue=self.NumberGenerator.randf_range(0.0,1.0)
	self.NumberGenerator.randomize()
	var new_green=self.NumberGenerator.randf_range(0.0,1.0)
	
	var new_color=Vector3(new_red,new_green,new_blue).normalized()
	var this_material=self.get_node("Sprite")
	this_material.modulate = Color(new_color.x,new_color.y,new_color.z,1.0)
	

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed==true:
			self.randomize_color()
			emit_signal("select")
		




func _on_Control_mouse_entered():
	
	pass # Replace with function body.





func _on_Area2D_mouse_entered():

	pass # Replace with function body.
