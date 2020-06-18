extends RichTextLabel

var dialog = ["This is a ","Hey! you clicked "]
var count


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	count=0
	var selectable_node=get_node('./../../Oven')
	selectable_node.connect("select",self,"OnSelect")
	pass # Replace with function body.

func OnSelect():
	self.count+=1
	if self.count<2 :
		set_bbcode(dialog[0]+self.name)
	else:
		set_bbcode(dialog[1]+str(self.count)+" times")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.
