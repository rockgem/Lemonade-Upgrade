extends Panel


func _ready():
	GameManager.connect("buy_show", self, "pre_show")


func pre_show():
	$Label.text = "Buy 1 seed for %s gold?" % str(GameManager.seed_price)
	show()

func _on_Buy_pressed():
	get_node("/root/BubbleSfx").play()
	if GameManager.player_gold >= GameManager.seed_price:
		get_node("/root/GainSfx").play()
		GameManager.player_gold -= GameManager.seed_price
		GameManager.seed_price *= 2
		GameManager.seed_data.amount += 1
		
		hide()
		
		GameManager.emit_signal("gain_item") # essentially updates the inventory display
	else:
		print("not enought money")


func _on_Cancel_pressed():
	get_node("/root/BubbleSfx").play()
	hide()
