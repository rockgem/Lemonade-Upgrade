extends KinematicBody2D
class_name NPC

enum NPC_TYPE{
	FATHER,
	NORMAL,
	SHOP
}


export(NPC_TYPE) var npc_type
export(Array, String, MULTILINE) var dialogs


var tick: float
var max_tick: float = 60.0

func _ready():
	if npc_type == NPC_TYPE.FATHER:
		set_physics_process(true)
	else:
		set_physics_process(false)


func _physics_process(delta):
	tick += delta
	
	if tick >= max_tick:
		tick = 0.0


func interact(node):
	if GameManager.free_seeds_available:
		if npc_type == NPC_TYPE.FATHER:
			GameManager.emit_signal("gain_seed", 3)
			GameManager.free_seeds_available = false
	
	
	var dir = global_position.direction_to(node.global_position)
	if dir.x < 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
	
	$Popup.text = dialogs[randi() % dialogs.size() - 1]
	$Popup.rect_pivot_offset = $Popup.rect_size / 2
	$AnimationPlayer.play("dialog_pop")
	
	$DialogTimer.start()
	$"/root/BubbleSfx".play()


func _on_DialogTimer_timeout():
	$Popup.hide()
