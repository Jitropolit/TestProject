class_name WorldLevel extends Node2D

@export var interior: bool

func _ready() -> void:
	GUI.create_canvas_modulate()
	GUI.create()
	GUI.create_hud()
	GUI.get_hud().update_stats()
	if not interior:
		Global.get_player().set_position(WorldData.player.last_portal_pos)
	Global.get_player().health = WorldData.player.health
	Global.get_player().max_health = WorldData.player.max_health
	Global.get_player().keys = WorldData.player.keys
