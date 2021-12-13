extends Camera2D



func _ready():
	GameManager.connect("camera_limits_set", self, "camera_limits_set")


func camera_limits_set(top_left: Vector2, bottom_right: Vector2):
	limit_top = top_left.y
	limit_left = top_left.x
	limit_bottom = bottom_right.y
	limit_right = bottom_right.x
