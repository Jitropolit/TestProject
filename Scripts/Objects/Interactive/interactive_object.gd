class_name InteractiveObject extends Node2D

var interactive_resource: InteractiveResource
var activated: bool

func _ready() -> void:
	set_process_input(false)
	update()

func update() -> void:
	$Sprite.set_texture(interactive_resource.texture)
	$Sprite.set_hframes(interactive_resource.hframes)
	$Sprite.set_vframes(interactive_resource.vframes)
	
	if activated:
		$Sprite.set_frame(interactive_resource.activated_frame)
		$Sprite.set_frame_coords(interactive_resource.activated_frame_coords)
	else:
		$Sprite.set_frame(interactive_resource.frame)
		$Sprite.set_frame_coords(interactive_resource.frame_coords)

func _on_area_body_entered(body: Node2D) -> void:
	GUI.get_element("HUD").show_hint(Enums.HintTypes.ENTER)

func _on_area_body_exited(body: Node2D) -> void:
	GUI.get_element("HUD").hide_hint()

func activate(activate: bool) -> void:
	activated = activate
	update()
