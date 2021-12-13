extends Control

var is_on_limit: bool = false


func _ready():
	GameManager.connect("gain_item", self, "update_inventory")
	
	update_inventory()


func _on_Interact_pressed():
	GameManager.emit_signal("interact_clicked")


func update_inventory():
	var children = $InventoryPanel/HBoxContainer.get_children()
	
	var count = 0
	for item in GameManager.player_items:
		children[count].get_node("Label").text = str(item.amount)
		
		count += 1
	
	$Gold.text = "Gold: " + str(GameManager.player_gold)


func _on_Reward_pressed():
	$RewardPanel.show()


func _on_JoystickLimit_pressed():
	GameManager.is_on_bounds = true


func _on_JoystickLimit_released():
	GameManager.is_on_bounds = false
