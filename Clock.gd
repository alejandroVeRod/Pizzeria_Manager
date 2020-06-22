extends Node2D

var minutes=0
var hours=0
var seconds=0
var time_mult=10.0
var paused=false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var labelTime=$PanelContainer/Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not paused:
		seconds += delta * time_mult
		if seconds>=60:
			seconds=0
			minutes+=1
		if minutes >=60:
			minutes=0
			hours+=1
		if hours >=24:
			hours=0
			minutes=0
			seconds=0
	labelTime.text="%02d" % hours+" : "+"%02d" % minutes
			

