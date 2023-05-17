class_name ElementDetection
extends Area2D

signal element_tile_entered(element_tile: ElementTile, cell_coor: Vector2i)

func _on_body_shape_entered(body_rid: RID, body: Node2D, _body_index: int, _area_index: int):
	if body is TileMap:
		var cell_coor: Vector2i = body.get_coords_for_body_rid(body_rid)
		var tile_data = body.get_cell_tile_data(0, cell_coor, false)
		var element_tile: ElementTile = tile_data.get_custom_data("ElementTile")
		if element_tile:
			element_tile_entered.emit(element_tile, cell_coor)
