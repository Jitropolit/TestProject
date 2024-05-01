class_name InteractiveResource extends Resource

@export_group("Generic")
@export var interactive_type: Enums.InteractiveTypes

@export_group("Texture")
@export var texture: CompressedTexture2D
@export var hframes: int
@export var vframes: int
@export var frame: int
@export var frame_coords: Vector2i
@export var activated_frame: int
@export var activated_frame_coords: Vector2i
