extends TileMap
class_name ElementsTileMap

var element_to_atlas_coor: Dictionary = {
	Element.Type.NEUTRAL: Vector2i(0,0),
	Element.Type.WATER: Vector2i(1,0),
	Element.Type.FIRE: Vector2i(2,0),
	Element.Type.WIND: Vector2i(3,0),
	Element.Type.ICE: Vector2i(0,4),
	Element.Type.NULL: Vector2i(-1,-1),
}

func set_cell_to_element(cell_coor: Vector2i, element: Element.Type):
	var atlas_coor: Vector2i = element_to_atlas_coor[element]
	set_cell(0, cell_coor, 0, atlas_coor, 0)

func _ready() -> void:
	# Inject all cell tile_map and coordinates data
	var cell_coors = get_used_cells(0)
	for cell_coor in cell_coors:
		var tile_data := get_cell_tile_data(0, cell_coor, false)
		var element_tile = tile_data.get_custom_data("ElementTile") as ElementTile
		if element_tile:
			element_tile.elements_tile_map = self
#			element_tile.cell_coor = cell_coor
