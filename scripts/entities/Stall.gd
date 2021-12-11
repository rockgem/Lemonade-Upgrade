extends Sprite


func _ready():
	GameManager.connect("customer_queued", self, "customer_queue")


func customer_queue():
	get_node("/root/BellSfx").play()
	GameManager.available_stall = false
	$CustomerQueueing.show()


func interact(node):
	if !GameManager.available_stall:
		GameManager.player_gold += 5
		GameManager.emit_signal("gain_item")
		$CoinSFX.play()
		$CustomerQueueing.hide()
		GameManager.available_stall = true
