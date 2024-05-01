extends Control

var function_to_choice: Callable

#region HINT
func show_hint(hint_type: Enums.InteractiveTypes) -> void:
	$HintPanel.set_visible(true)
	var hint_modulate_tween := create_tween()
	hint_modulate_tween.tween_property($HintPanel, "modulate", Color(1, 1, 1), 0.15)
	match hint_type:
		Enums.InteractiveTypes.INTERACTIVE:
			$HintPanel/HintLabel.set_text("E - Взаимодейстовать")
		Enums.InteractiveTypes.PICKUP:
			$HintPanel/HintLabel.set_text("E - Поднять")
		Enums.InteractiveTypes.ENTER:
			$HintPanel/HintLabel.set_text("E - Войти")
		Enums.InteractiveTypes.USE_KEY:
			$HintPanel/HintLabel.set_text("E - Открыть дверь")

func hide_hint() -> void:
	var hint_modulate_tween := create_tween()
	hint_modulate_tween.tween_property($HintPanel, "modulate", Color(1, 1, 1, 0), 0.15)
	hint_modulate_tween.tween_callback(func(): $HintPanel.set_visible(false))
	$HintPanel/HintLabel.set_text("")
#endregion

#region NOTIFICATION
func show_notification(text: String) -> void:
	$NotificationPanel.set_visible(true)
	var notification_modulate_tween := create_tween()
	notification_modulate_tween.tween_property($NotificationPanel, "modulate", Color(1, 1, 1), 0.15)
	$NotificationPanel/OkButton.set_visible(true)
	$NotificationPanel/NotificationLabel.set_text(text)
	
func show_notification_choice(text: String, function_to_execute: Callable) -> void:
	$NotificationPanel.set_visible(true)
	var notification_modulate_tween := create_tween()
	notification_modulate_tween.tween_property($NotificationPanel, "modulate", Color(1, 1, 1), 0.15)
	function_to_choice = function_to_execute
	$NotificationPanel/YesButton.set_visible(true)
	$NotificationPanel/NoButton.set_visible(true)
	$NotificationPanel/NotificationLabel.set_text(text)

func _on_yes_button_pressed() -> void:
	function_to_choice.call()
	hide_notification()

func _on_no_button_pressed() -> void:
	hide_notification()

func _on_ok_button_pressed() -> void:
	hide_notification()
	
func hide_notification() -> void:
	var notification_modulate_tween := create_tween()
	notification_modulate_tween.tween_property($NotificationPanel, "modulate", Color(1, 1, 1, 0), 0.15)
	notification_modulate_tween.tween_callback(func(): $NotificationPanel.set_visible(false))
	notification_modulate_tween.tween_callback(func(): $NotificationPanel/OkButton.set_visible(false))
	notification_modulate_tween.tween_callback(func(): $NotificationPanel/YesButton.set_visible(false))
	notification_modulate_tween.tween_callback(func(): $NotificationPanel/NoButton.set_visible(false))
#endregion

#region STATS
func update_stats() -> void:
	$StatsPanel/StatsLabel.set_text("HP %s/%s\nКлючи: %s" % [WorldData.player.health, WorldData.player.max_health, WorldData.player.keys])
#endregion
