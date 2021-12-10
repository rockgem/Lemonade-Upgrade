extends KinematicBody2D


onready var anim_tree = $AnimationTree
onready var anim_playback = anim_tree.get("parameters/playback")

onready var joystick = $CanvasLayer/UI/Sprite/Joystick

var move_speed: float = 90
var velocity = Vector2.ZERO

func _ready():
	GameManager.connect("interact_clicked", self, "interact_clicked")
	GameManager.connect("gain_seed", self, "gain_seed")

func _physics_process(delta):
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if velocity != Vector2.ZERO:
		anim_tree.set("parameters/run/blend_position", velocity.normalized())
		anim_tree.set("parameters/idle/blend_position", velocity.normalized())
		anim_playback.travel("run")
	else:
		anim_playback.travel("idle")
	
	velocity = move_and_slide(velocity * move_speed)


func interact_clicked():
	if $PlayerDetector.get_overlapping_areas().empty():
		return
	
	var areas = $PlayerDetector.get_overlapping_areas()
	var parent = areas[0].get_parent()
	
	parent.interact(self)
	
	pass


func gain_seed(amount: int):
	pass
