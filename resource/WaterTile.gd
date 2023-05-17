extends ElementTile
class_name WaterTile

func react_cell_to_projectile(cell_coor: Vector2i, projectile: Projectile):
	if projectile.element == Element.Type.ICE:
		freeze(cell_coor)

func freeze(cell_coor: Vector2i):
	elements_tile_map.set_cell_to_element(cell_coor, Element.Type.ICE)
