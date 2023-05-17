extends ElementTile
class_name IceTile

func react_cell_to_projectile(cell_coor: Vector2i, projectile: Projectile):
	if projectile.element == Element.Type.FIRE:
		melt(cell_coor)
	
func melt(cell_coor: Vector2i):
	elements_tile_map.set_cell_to_element(cell_coor, Element.Type.WATER)

