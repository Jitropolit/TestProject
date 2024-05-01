class_name LevelMap extends TileMap

@export var portals: Dictionary

func _ready() -> void:
	replace_tiles_with_objects()

func replace_tiles_with_objects():
	var tile_scenes: Dictionary = load("res://Resources/World/tile_scenes.tres").tile_scenes
	
	for tile_pos in get_used_cells(1):
		var tile_id := get_cell_source_id(1, Vector2i(tile_pos.x, tile_pos.y))
		var tile_atlas_cord := get_cell_atlas_coords(1, Vector2i(tile_pos.x, tile_pos.y))

		if tile_scenes.has(tile_id) and tile_scenes[tile_id].has(tile_atlas_cord):
			var resource_object: Object = tile_scenes[tile_id][tile_atlas_cord]
			replace_tile_with_object(tile_pos, resource_object)

func replace_tile_with_object(tile_pos: Vector2i, resource_object: Object):
	var item_object
	
	if resource_object is KeyResource:
		item_object = load("res://Scenes/Prefabs/Objects/Items/item.tscn").instantiate()
		item_object.set_script(load("res://Scripts/Objects/Items/key_object.gd"))
		item_object.item_resource = resource_object
	elif resource_object is ItemResource:
		item_object = load("res://Scenes/Prefabs/Objects/Items/item.tscn").instantiate()
		item_object.item_resource = resource_object
	elif resource_object is PortalResource and portals.has(tile_pos):
		item_object = load("res://Scenes/Prefabs/Objects/Interactive/portal.tscn").instantiate()
		item_object.interactive_resource = resource_object
		if get_cell_atlas_coords(1, tile_pos) == Vector2i(9, 1):
			pass
		else:
			item_object.activated = false if get_cell_atlas_coords(1, tile_pos).x == 1 else true
		item_object.portal_level_path = portals[tile_pos]
	else: 
		return

	set_cell(1, tile_pos)
	item_object.set_global_position(map_to_local(tile_pos))
	add_child(item_object)
	item_object.update()
