class_name PortalObject extends InteractiveObject

var portal_level_path: String

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact"):
		if activated:
			if WorldData.player.keys > 0:
				GUI.get_element("HUD").show_notification_choice("Потратить ключ, чтобы открыть дверь?", activate_portal)
			else:
				GUI.get_element("HUD").show_notification("Нужен ключ")
		else:
			if not Global.get_frist_node().interior:
				WorldData.player.last_portal_pos = get_position()
				WorldData.player.last_portal_pos.y += 16
			$EnterArea.set_monitoring(false)
			$OutArea.set_monitoring(false)
			var canvas_modulate_tween := create_tween()
			canvas_modulate_tween.tween_property(GUI.canvas_modulate, "color", Color(0, 0, 0), 0.25)
			canvas_modulate_tween.tween_callback(func(): get_tree().change_scene_to_file(portal_level_path))
	
func activate_portal() -> void:
	Global.get_player().add_key(-1)
	GUI.get_hud().update_stats()
	activate(false)

func update() -> void:
	$Sprite.set_texture(interactive_resource.texture)
	$Sprite.set_hframes(interactive_resource.hframes)
	$Sprite.set_vframes(interactive_resource.vframes)
	
	if activated:
		$Body/Collision.set_disabled(false)
		$OutArea/Collision.set_disabled(false)
		$Sprite.set_frame(interactive_resource.activated_frame)
		$Sprite.set_frame_coords(interactive_resource.activated_frame_coords)
	else:
		$Body/Collision.set_disabled(true)
		$OutArea/Collision.set_disabled(true)
		$Sprite.set_frame(interactive_resource.frame)
		$Sprite.set_frame_coords(interactive_resource.frame_coords)

func _on_enter_area_body_entered(body: Node2D) -> void:
	set_process_input(true)
	GUI.get_hud().show_hint(Enums.InteractiveTypes.ENTER)

func _on_enter_area_body_exited(body: Node2D) -> void:
	set_process_input(false)
	GUI.get_hud().hide_hint()

func _on_out_area_body_entered(body: Node2D) -> void:
	set_process_input(true)
	GUI.get_hud().show_hint(Enums.InteractiveTypes.USE_KEY)

func _on_out_area_body_exited(body: Node2D) -> void:
	set_process_input(false)
	GUI.get_hud().hide_hint()
