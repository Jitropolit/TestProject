class_name KeyObject extends ItemObject

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		pickup()

func pickup() -> void:
	Global.get_player().add_key(1)
	GUI.get_hud().update_stats()
	queue_free()
