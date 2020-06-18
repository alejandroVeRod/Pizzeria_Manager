extends Polygon2D

class Inventory:
	signal on_Item_Added(item)
	signal on_Item_Removed(item)	
	var items=[]
	func add(item:Item):
		items.append(item)
		emit_signal("on_Item_Added",item)
	func remove(item:Item):
		var pos=items.find(item)
		items.remove(pos)
		emit_signal("on_Item_Removed")
class Item:
	var sprite
	var name_item setget set_name,get_name
	var quantity 
	func set_name(new_name):
		name_item=new_name
	func get_name():
		return name_item

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal on_item
var inventory
# Called when the node enters the scene tree for the first time
func update_inventory(item):
	print("itemhola")
	var new_itemSlot=load("res://ItemSlot.tscn").instance()
	var panelItems=get_node("Items/VBoxContainer")
	new_itemSlot.set_item_slot(item.name_item,item.quantity,item.sprite)
	panelItems.add_child(new_itemSlot)
		

func _ready():
	self.inventory=Inventory.new()
	self.inventory.connect("on_Item_Added",self,"update_inventory")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Buy_button_down():
	var it0= Item.new()
	it0.sprite=load("res://resources/images/Flour.png")
	it0.name_item="Wheat Flour 00"
	it0.quantity=150
	self.inventory.add(it0)
	pass # Replace with function body.
