extends Node



signal camera_limits_set(vec1, vec2)
signal interact_clicked
signal gain_seed(amount)
signal customer_queued



var free_seeds_available: bool = true
var available_stall: bool = true
