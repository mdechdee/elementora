extends Node2D
class_name ProjectileShooter

@export var projectile_scene: PackedScene
var current_element: Element.Type = Element.Type.FIRE

func _ready() -> void:
	assert(projectile_scene != null, "Please attach a projectile scene for the projectile shooter!")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		var projectile = projectile_scene.instantiate() as Projectile
		var aim_direction = global_position.direction_to(get_global_mouse_position())
		projectile.element = current_element
		projectile.global_position = global_position
		projectile.direction = aim_direction
		get_tree().current_scene.add_child(projectile)
