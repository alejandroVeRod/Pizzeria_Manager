extends Sprite
var material_outline=preload("res://resources/materials/outline.material")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".material=null
	if is_inside_tree():
		get_parent().connect("mouse_entered",self,"on_mouse_select")
		get_parent().connect("mouse_exited",self,"on_mouse_unselect")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func on_mouse_select():
	self.material=material_outline
	pass # Replace with function body.


func on_mouse_unselect():
	self.material=null
	pass # Replace with function body.


