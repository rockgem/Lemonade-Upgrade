extends Control




func _ready():
	$AdMob.show_banner()


func _on_Interact_pressed():
	GameManager.emit_signal("interact_clicked")
