extends HBoxContainer

func set_item_slot(name_item,quantity,sprite):
	get_node("Panel_Name/Item_name").text=name_item
	get_node("Panel_Quantity/Quantity").text=str(quantity)
	get_node("Sprite").texture=sprite

