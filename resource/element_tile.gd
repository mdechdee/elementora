class_name ElementTile # implemented by FireTile, WaterTile, WindTile, IceTile
extends Resource

@export var type: Element.Type
@export var active: bool

# to be injected by the tilemap
var elements_tile_map: ElementsTileMap
# can't inject cell_coor due to resource being shared to all the cells
#var cell_coor: Vector2i

func _ready():
	assert(elements_tile_map != null, "Please inject ElementsTileMap to all element tiles")
#	assert(cell_coor != null, "Please inject cell coordinates to all element tiles")

# interface
func react_cell_to_projectile(cell_coor: Vector2i, projectile: Projectile):
	pass

static func create_element_tile(_type: Element.Type, _active: bool) -> ElementTile:
	var element_tile = ElementTile.new()
	element_tile.active = _active
	element_tile.type = _type
	return element_tile
