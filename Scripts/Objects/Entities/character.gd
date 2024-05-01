class_name Character extends CharacterBody2D

var inventory: Storage

var health: int = 10
var max_health: int = 10

func add_health(value: int) -> void:
	health = clamp(health + value, 0, max_health)
	if health == 0:
		queue_free()
		return
	WorldData.player.health = health

func add_max_health(value: int) -> void:
	max_health = clamp(max_health + value, 1, 9999)
	health = clamp(health, 0, max_health)
	WorldData.player.max_health = max_health
