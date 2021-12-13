extends Node



signal camera_limits_set(vec1, vec2)
signal interact_clicked
signal gain_seed(amount)
signal customer_queued
signal player_dialog_pop(message)
signal gain_item(item_resource)

var is_on_bounds = false

var free_seeds_available: bool = true
var available_stall: bool = true

var lemon_data = load("res://resources/items/Lemon.tres")
var seed_data = load("res://resources/items/Seed.tres")

var player_seeds: int = 0
var player_gold: int = 0
var player_items: Array = [seed_data, lemon_data]


func _ready():
	connect("gain_item", self, "gain_item")


func gain_item():
	pass
