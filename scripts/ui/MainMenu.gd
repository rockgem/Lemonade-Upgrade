extends Control


func _ready():
	$AdMob.show_banner()


func _on_Play_pressed():
	get_node("/root/BubbleSfx").play()
	get_tree().change_scene("res://scenes/levels/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()
