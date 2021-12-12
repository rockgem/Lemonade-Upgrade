extends Panel


var amount: int

func _ready():
	get_parent().get_node("AdMob").load_rewarded_video()


func _on_RewardPanel_visibility_changed():
	if visible:
		initialize()


func initialize():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	amount = rng.randi_range(1, 10)
	
	$TextureRect/Amount.text = str(amount)


func _on_Watch_pressed():
	get_node("/root/BubbleSfx").play()
	get_parent().get_node("AdMob").show_rewarded_video()


func _on_AdMob_rewarded(currency, ammount):
	get_node("/root/GainSfx").play()
	GameManager.lemon_data.amount += amount
	GameManager.emit_signal("gain_item")


func _on_AdMob_rewarded_video_failed_to_load(error_code):
	print("failed to load rewarded")


func _on_Close_pressed():
	get_node("/root/BubbleSfx").play()
	get_parent().get_node("AdMob").load_rewarded_video()
	hide()
