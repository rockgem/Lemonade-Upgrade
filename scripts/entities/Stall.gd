extends Sprite


func _ready():
	GameManager.connect("customer_queued", self, "customer_queue")


func customer_queue():
	get_node("/root/BellSfx").play()
	GameManager.available_stall = false
	$CustomerQueueing.show()
