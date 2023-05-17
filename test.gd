extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tile_data: TileData = $TileMap.set_cell(0, Vector2i.ZERO, -1, Vector2i(0,1), 0)
	tile_data.()
