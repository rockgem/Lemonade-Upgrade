extends Sprite




var is_planted: bool = false
var is_max_growth: bool = false
var growth_stage: int = 0
var tick: float
var growth_tick: float = 15.0


var lemons: int = 0

func _physics_process(delta):
	if is_planted:
		tick += delta
		
		if tick >= growth_tick:
			grow()
			tick = 0.0


func interact(node):
	if GameManager.player_seeds <= 0:
		GameManager.emit_signal("player_dialog_pop", "No seeds to plant")
		return
	
	if !is_planted:
		$"/root/DirtSfx".play()
		$SeedSprite.show()
		GameManager.player_seeds -= 1
		is_planted = true
		set_physics_process(true)
	else:
		pick_lemon()


func grow():
	growth_stage += 1
	
	if growth_stage >= 3:
		growth_stage = 3
		$Sprite.scale = Vector2(1.0, 1.0)
		produce_lemon()
		return
	
	$Sprite.scale += Vector2(0.3, 0.3)
	
	$SeedSprite.hide()
	$Sprite.show()
	$StaticBody2D/CollisionShape2D.disabled = false


func produce_lemon():
	if lemons < 3:
		lemons += 1
		$Lemons.get_child(lemons - 1).show()
	else:
		set_physics_process(false)


func pick_lemon():
	if lemons > 0:
		$Lemons.get_child(lemons - 1).hide()
		lemons -= 1
		get_node("/root/GainSfx").play()
		
		if lemons < 3:
			tick = 0.0
			set_physics_process(true)
	else:
		GameManager.emit_signal("player_dialog_pop", "This tree don't have lemons yet.")


