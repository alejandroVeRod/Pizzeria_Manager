extends Polygon2D
onready var control=get_node("../Texture")
var actionName


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func showActionButton():
	$".".visible=true
	$"Button/RichTextLabel".text=self.actionName

func hideActionButton():
	$".".visible=false
	$"Button/RichTextLabel".text=""
	
func on_select():
	showActionButton()

func on_deselect():
	hideActionButton()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".visible=false

	control.connect("mouse_entered",self,"on_select")
	control.connect("mouse_exited",self,"on_deselect")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
