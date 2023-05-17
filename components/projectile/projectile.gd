extends Node2D
class_name Projectile

@export var speed: float = 5
var direction: Vector2
var element: Element.Type

var element_to_modulate: Dictionary = {
	Element.Type.WATER: Color.DEEP_SKY_BLUE,
	Element.Type.FIRE: Color.RED,
	Element.Type.WIND: Color.WHITE,
	Element.Type.ICE: Color.LIGHT_STEEL_BLUE,
}

func _ready() -> void:
	modulate = element_to_modulate[element]
	look_at(global_position + direction)

func _physics_process(delta: float) -> void:
	global_position += direction * speed

func _on_element_detection_element_tile_entered(element_tile: ElementTile, cell_coor: Vector2i) -> void:
	element_tile.react_cell_to_projectile(cell_coor, self)

func _on_collision_detector_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	queue_free()
