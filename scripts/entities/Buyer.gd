extends Sprite


var is_moving: bool = false
var is_for_stall: bool = false
var path: PoolVector2Array


func _ready():
	set_physics_process(false)


func _physics_process(delta):
	if path.size() > 1:
		var dir = global_position.direction_to(path[1])
		
		global_translate(dir)
	else:
		if is_for_stall:
			GameManager.emit_signal("customer_queued")
		
		is_moving = false
		set_physics_process(false)
		GameManager.emit_signal("buyer_reach_point", self)
		hide()
		return
	
	if global_position >= path[1]:
		path.remove(1)


func move_towards(path_arr: PoolVector2Array):
	path = path_arr
	
	is_moving = true
	set_physics_process(true)
