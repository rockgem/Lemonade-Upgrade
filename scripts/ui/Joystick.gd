extends TouchScreenButton

var drag = -1

var joystick_middle = (normal.get_size() / 2)

var thres: float = 0.5
var accel: float = 20.0
var bounds: float = 10.0

func _process(delta):
	if drag == -1:
		var pos_dif = (Vector2(0, 0) - joystick_middle) - position
		position += pos_dif


func _input(event):
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.is_pressed()):
		
		var event_from_center = (event.position - get_parent().global_position).length()
	
		if event_from_center <= bounds or event.get_index() == drag:
			set_global_position(event.position - joystick_middle)
			
#			if get_button_pos().length() > boundary:
#				set_position(get_button_pos().normalized() * boundary - radius)
			
			drag = event.get_index()
	
	if event is InputEventScreenTouch and !event.is_pressed() and event.get_index() == drag:
		drag = -1

func get_button_pos():
	return position - joystick_middle

func get_value():
	return get_button_pos().normalized()
	
	return Vector2(0 ,0)
