extends AcceptDialog

enum PIZZA_STYLE {NEAPOLITAN,AMERICAN,SICILIAN}
enum PIZZA_SIZE {SMALL=0,MEDIUM=1,LARGE=2}


onready var pizza_style_selected=$MarginContainer/VBoxContainer/HPizzaStyleContainer/OptionButton
onready var pizza_size_selected=$MarginContainer/VBoxContainer/HPizzaSizeContainer/OptionButton
onready var pizza_number_selected=$MarginContainer/VBoxContainer/HNumberPizzaContainer/LineEdit
onready var pizza_hydration_selected=$MarginContainer/VBoxContainer/HWaterContainer/PanelPercentage/HSlider


onready var flour_needed=$MarginContainer/VBoxContainer/HFlourContainer/PanelQuantity/LabelQuantity
onready var salt_needed=$MarginContainer/VBoxContainer/HSaltContainer/PanelQuantity/LabelQuantity
onready var yeast_needed=$MarginContainer/VBoxContainer/HYeastContainer/PanelQuantity/LabelQuantity
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var  style_selected
var  size_selected
var  number_selected
var hydration_selected
 


func update_style(id):
	style_selected=id
	update_ingredients()
	pass
func update_size(id):
	size_selected=id
	update_ingredients()
	pass
func update_number(text):
	number_selected=int(text)
	update_ingredients()
	pass
func update_hydration(value):

	hydration_selected=value
	update_ingredients()
	pass
	
func set_flour_needed(quantity):
	flour_needed.text=str(quantity)
func set_salt_needed(quantity):
	salt_needed.text=str(quantity)
func set_yeast_needed(quantity):
	yeast_needed.text=str(quantity)

func update_ingredients():
	if style_selected!=null and size_selected!=null and number_selected!=null and hydration_selected!=null:
		if(style_selected == PIZZA_STYLE.NEAPOLITAN):
			if(size_selected == PIZZA_SIZE.SMALL):
				set_flour_needed(160*number_selected)
			elif(size_selected == PIZZA_SIZE.MEDIUM):
				set_flour_needed(230*number_selected)
			elif(size_selected == PIZZA_SIZE.LARGE):
				set_flour_needed(300*number_selected)			
			set_salt_needed(float(float(flour_needed.text)*0.03))
		elif(style_selected == PIZZA_STYLE.AMERICAN):
			if(size_selected == PIZZA_SIZE.SMALL):
				set_flour_needed(175*number_selected)
			elif(size_selected == PIZZA_SIZE.MEDIUM):
				set_flour_needed(240*number_selected)
			elif(size_selected == PIZZA_SIZE.LARGE):
				set_flour_needed(315*number_selected)
			set_salt_needed(float(float(flour_needed.text)*0.015))
		elif(style_selected == PIZZA_STYLE.SICILIAN):
			if(size_selected == PIZZA_SIZE.SMALL):
				set_flour_needed(275*number_selected)
			elif(size_selected == PIZZA_SIZE.MEDIUM):
				set_flour_needed(340*number_selected)
			elif(size_selected == PIZZA_SIZE.LARGE):
				set_flour_needed(415*number_selected)
			set_salt_needed(float(flour_needed.text)*0.02)
		set_yeast_needed(float(float(number_selected)*0.2*float(size_selected)))


# Called when the node enters the scene tree for the first time.
func _ready():
	pizza_style_selected.connect("item_selected",self,"update_style")
	pizza_size_selected.connect("item_selected",self,"update_size")
	pizza_number_selected.connect("text_changed",self,"update_number")
	pizza_hydration_selected.connect("value_changed",self,"update_hydration")
	set_flour_needed(200)
	number_selected=1
	style_selected=0
	size_selected=0
	hydration_selected=50
	update_ingredients()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
