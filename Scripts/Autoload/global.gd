extends Node

var previous_scene: PackedScene

func get_frist_node() -> Object:
	return get_tree().get_root().get_child(4)

func get_player() -> Object:
	return get_frist_node().get_node("Player")
