extends Node2D

onready var start = $BuyerSpawner.global_position
onready var end = $BuyerReachPoint.global_position
onready var exit = $BuyerExitPoint.global_position

func _ready():
	var top_left = $TopLeft.global_position
	var bottom_right = $BottomRight.global_position
#	GameManager.emit_signal("camera_limits_set", top_left, bottom_right)
#
#	$YSort/Player/Camera2D.limit_top = top_left.x
#	$YSort/Player/Camera2D.limit_left = top_left.y
#	$YSort/Player/Camera2D.limit_bottom = bottom_right.y
#	$YSort/Player/Camera2D.limit_right = bottom_right.x



func add_buyer():
	pass


func _on_Timer_timeout():
	var path: PoolVector2Array
	var ins = load("res://actors/entities/Buyer.tscn").instance()
	ins.global_position = start
	
	if GameManager.available_stall:
		path = $Navigation2D.get_simple_path(start, end, false)
	else:
		path = $Navigation2D.get_simple_path(start, exit, false)
	
	$YSort.add_child(ins)
	
	ins.move_towards(path)
