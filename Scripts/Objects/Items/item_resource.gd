class_name ItemResource extends Resource

@export_group("Generic")
@export var name: String
@export var description: String
@export var usable: bool
@export var effects: Dictionary # Разработчики Godot не добавили ничего лучше, потому пользуемся цифрами вместо Enums

@export_group("Texture")
@export var texture: CompressedTexture2D
@export var hframes: int
@export var vframes: int
@export var frame: int
@export var frame_coords: Vector2i
