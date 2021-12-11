extends Control




func _ready():
	GameManager.connect("gain_item", self, "update_inventory")
	
	update_inventory()
	
	$AdMob.show_banner()


func _on_Interact_pressed():
	GameManager.emit_signal("interact_clicked")


func update_inventory():
	var children = $InventoryPanel/HBoxContainer.get_children()
	
	var count = 0
	for item in GameManager.player_items:
		children[count].get_node("Label").text = str(item.amount)
		
		count += 1
	
	$Gold.text = "Gold: " + str(GameManager.player_gold)
