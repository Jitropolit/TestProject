extends Node

var canvas_modulate: CanvasModulate

func create() -> void:
	var canvas_layer := CanvasLayer.new()
	canvas_layer.set_name("GUI")
	Global.get_frist_node().add_child(canvas_layer)

func get_gui() -> Object:
	return Global.get_frist_node().get_node_or_null("GUI")

func get_element(element_name: String) -> Object:
	return get_node_or_null("%s/%s" % [get_gui().get_path(), element_name])

func create_element(element_path_name: String) -> void:
	var element = load("res://scenes/prefabs/GUI/" + element_path_name + ".tscn").instantiate()
	get_gui().add_child(element)

func create_hud() -> void:
	create_element("HUD")

func get_hud() -> Object:
	return get_element("HUD")

func create_canvas_modulate() -> void:
	canvas_modulate = CanvasModulate.new()
	canvas_modulate.set_color(Color(0, 0, 0))
	Global.get_frist_node().add_child(canvas_modulate)

	var canvas_modulate_tween := create_tween()
	canvas_modulate_tween.tween_property(canvas_modulate, "color", Color(1, 1, 1), 1.25)
