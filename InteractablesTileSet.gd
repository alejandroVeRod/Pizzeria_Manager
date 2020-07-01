extends TileMap

var dough_table = preload("res://scenes/DoughTable.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dough_tables_tiles = get_used_cells_by_id(1)
	for tile in dough_tables_tiles:
		var dough_table_instance = dough_table.instance()
		dough_table_instance.position = map_to_world(tile)
		add_child(dough_table_instance)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
