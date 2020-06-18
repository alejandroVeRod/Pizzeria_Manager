extends TextureRect
var material_outline=load("res://resources/materials/dough_material.material")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$".".material=null
	$"../Control".connect("mouse_entered",self,"_on_Texture_mouse_entered")
	$"../Control".connect("mouse_exited",self,"_on_Texture_mouse_exited")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Texture_mouse_entered():
	$".".material=material_outline
	pass # Replace with function body.


func _on_Texture_mouse_exited():
	$".".material=null
	pass # Replace with function body.
