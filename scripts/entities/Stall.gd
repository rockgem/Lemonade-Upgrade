extends Sprite


func _ready():
	GameManager.connect("customer_queued", self, "customer_queue")


func customer_queue():
	GameManager.available_stall = false
	$CustomerQueueing.show()
