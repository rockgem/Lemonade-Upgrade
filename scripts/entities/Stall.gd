extends Sprite


func _ready():
	GameManager.connect("customer_queued", self, "customer_queue")


func customer_queue():
	get_node("/root/BellSfx").play()
	$CustomerQueueing.show()
	$Timer.start()


func interact(node):
	if !GameManager.available_stall:
		if GameManager.lemon_data.amount > 0:
			GameManager.player_gold += 5
			GameManager.lemon_data.amount -= 1
			GameManager.emit_signal("gain_item")
			$CoinSFX.play()
			$CustomerQueueing.hide()
			GameManager.available_stall = true
		else:
			GameManager.emit_signal("player_dialog_pop", "No lemons to make lemonade")


func _on_Timer_timeout():
	GameManager.available_stall = true
	$CustomerQueueing.hide()
	$Timer.stop()
