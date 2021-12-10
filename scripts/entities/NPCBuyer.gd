extends Node



onready var parent = get_parent()

var is_moving: bool = false
var path



func _physics_process(delta):
	if path.size() > 1:
		var dir = parent.global_position.direction_to(path[1])
		
		parent.global_translate(dir)
		
		if parent.global_position <= path[1]:
			path.remove(1)
	else:
		is_moving = false
		set_physics_process(false)


func move_towards(path_arr):
	path = path_arr
	
	is_moving = true
	set_physics_process(true)
