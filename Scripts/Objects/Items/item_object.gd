class_name ItemObject extends Node2D

var item_resource: ItemResource

func _ready() -> void:
	set_process_input(false)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		use()

func use() -> void:
	for effect_id in item_resource.effects.keys():
		match effect_id:
			Enums.Effects.INCREASE_MAX_HP:
				Global.get_player().add_max_health(item_resource.effects[effect_id])
			Enums.Effects.INCREASE_HP:
				Global.get_player().add_health(item_resource.effects[effect_id])
			Enums.Effects.DECREASE_MAX_HP:
				Global.get_player().add_max_health(-item_resource.effects[effect_id])
			Enums.Effects.DECREASE_HP:
				Global.get_player().add_health(-item_resource.effects[effect_id])
	GUI.get_hud().update_stats()
	queue_free()

func update() -> void:
	$Sprite.set_texture(item_resource.texture)
	$Sprite.set_hframes(item_resource.hframes)
	$Sprite.set_vframes(item_resource.vframes)
	$Sprite.set_frame(item_resource.frame)
	$Sprite.set_frame_coords(item_resource.frame_coords)

func _on_area_body_entered(body: Node2D) -> void:
	set_process_input(true)
	GUI.get_hud().show_hint(Enums.InteractiveTypes.PICKUP)

func _on_area_body_exited(body: Node2D) -> void:
	set_process_input(false)
	GUI.get_hud().hide_hint()
