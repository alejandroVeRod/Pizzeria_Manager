extends Control
onready var progress_bar=$ProgressBar
onready var accept_dialog=$AcceptDialog
onready var dough_unfermented=preload("res://Dough_Unfermented.tscn")

var idle: bool
var preparing_dough : bool
var dough_on_table : bool
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func prepare_dough():
	$PopupMenu.visible=false
	$AcceptDialog.popup()
	preparing_dough=true
	idle=false
	dough_on_table=false
	yield($AcceptDialog,"confirmed")
	var options=$AcceptDialog.get_dough_options()
	progress_bar.show()
	progress_bar.start(options['time_needed'])
	pass

func cancel_preparation():
	$PopupMenu.visible=false
	idle=true
	preparing_dough=false
	dough_on_table=false
	progress_bar.cancel()
	
func dough_finished():
	idle=true
	preparing_dough=false
	dough_on_table=true
	print("finished")
	var new_dough_unfermented= load("res://Dough_Unfermented.tscn")

	var dough_instance=new_dough_unfermented.instance()
	self.add_child(dough_instance)
	dough_instance.visible=true


	

# Called when the node enters the scene tree for the first time.
func _ready():
	idle=true
	preparing_dough=false
	dough_on_table=false
	progress_bar.hide()
	accept_dialog.connect("confirmed",self,"prepare_dough")
	$PopupMenu/VBoxContainer/Panel_prepare/Button_prepare.connect("button_down",self,"prepare_dough")
	$PopupMenu/VBoxContainer/Panel_cancel/Button_cancel.connect("button_down",self,"cancel_preparation")
	$".".connect("gui_input",self,"_on_input_event")
	progress_bar.connect("on_finished",self,"dough_finished")
	pass # Replace with function body.


func _on_input_event(event):
	if event is InputEventMouseButton:
		if event.button_index==BUTTON_LEFT and event.pressed:
			$PopupMenu.popup()
			if idle==true:
				$PopupMenu/VBoxContainer/Panel_prepare.visible=true
				$PopupMenu/VBoxContainer/Panel_cancel.visible=false
			elif preparing_dough==true:
				$PopupMenu/VBoxContainer/Panel_cancel.visible=true
				$PopupMenu/VBoxContainer/Panel_prepare.visible=false
				


	pass # Replace with function body.


