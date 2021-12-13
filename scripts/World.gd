extends Node2D

onready var start = $BuyerSpawner.global_position
onready var end = $BuyerReachPoint.global_position
onready var exit = $BuyerExitPoint.global_position
onready var buyer_pool_active: Array
onready var buyer_pool_inactive: Array

func _ready():
	var top_left = $TopLeft.global_position
	var bottom_right = $BottomRight.global_position
	GameManager.emit_signal("camera_limits_set", top_left, bottom_right)
	GameManager.connect("buyer_reach_point", self, "buyer_append_to_pool")
	
	for i in 8:
		var ins = load("res://actors/entities/Buyer.tscn").instance()
		ins.hide()
		
		buyer_pool_inactive.append(ins)
		$YSort.add_child(ins)
#
#	$YSort/Player/Camera2D.limit_top = top_left.x
#	$YSort/Player/Camera2D.limit_left = top_left.y
#	$YSort/Player/Camera2D.limit_bottom = bottom_right.y
#	$YSort/Player/Camera2D.limit_right = bottom_right.x


func buyer_append_to_pool(node):
	print(node.to_string())
	buyer_pool_inactive.append(node)
	buyer_pool_active.erase(node)


func add_buyer():
	pass


func _on_Timer_timeout():
	var path: PoolVector2Array
	buyer_pool_inactive[0].global_position = start
	
	if GameManager.available_stall:
		path = $Navigation2D.get_simple_path(start, end, false)
		GameManager.available_stall = false
		buyer_pool_inactive[0].is_for_stall = true
	else:
		path = $Navigation2D.get_simple_path(start, exit, false)
	
	buyer_pool_inactive[0].show()
	
	buyer_pool_inactive[0].move_towards(path)
	buyer_pool_active.append(buyer_pool_inactive[0])
	buyer_pool_inactive.pop_front()
	
