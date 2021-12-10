extends Sprite




var is_planted: bool = false
var is_max_growth: bool = false
var growth_stage: int = 0
var tick: float
var growth_tick: float = 30.0


func _physics_process(delta):
	if is_planted:
		tick += delta
		
		if tick >= growth_tick:
			grow()
			tick = 0.0


func interact(node):
	if !is_planted:
		$"/root/DirtSfx".play()
		$SeedSprite.show()
		is_planted = true
		set_physics_process(true)


func grow():
	growth_stage += 1
	
	if growth_stage >= 3:
		$Sprite.scale = Vector2(1.0, 1.0)
		is_max_growth = true
		set_physics_process(false)
		return
	
	$Sprite.scale += Vector2(0.3, 0.3)
	
	$SeedSprite.hide()
	$Sprite.show()
	$StaticBody2D/CollisionShape2D.disabled = false
