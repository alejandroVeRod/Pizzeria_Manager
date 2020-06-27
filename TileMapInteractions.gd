extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton:
		var mouse_position = event.position
		if event.pressed:
			var tilemap = $"Dough Tables"
			var tile_position = tilemap.world_to_map(mouse_position)
			var cell = tilemap.get_cellv(tile_position)
			print(tilemap.get_cel)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
