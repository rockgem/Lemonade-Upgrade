extends Control




func _ready():
	pass


func _on_Interact_pressed():
	GameManager.emit_signal("interact_clicked")
