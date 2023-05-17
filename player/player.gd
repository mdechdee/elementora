class_name Player
extends CharacterBody2D

@export var speed: float = 60
@export var jump_speed: float = 150
@export var fallback_player_element: Element.Type = Element.Type.ICE

# Get the gravity from the project settings to be synced with RigidBody nodes.
@onready var state_manager: CharacterStateManager = $CharacterStateManager
@onready var animations: AnimatedSprite2D = $AnimatedSprite2D
@onready var camera: Camera2D = $Camera2D
@onready var element_switcher = %ElementSwitcher as ElementSwitcher
@onready var projectile_shooter = $ProjectileShooter as ProjectileShooter

func _ready() -> void:
	print("player element is", Element.STRING_MAP[PlayerData.selected_element_type])
	state_manager.init(self)
	if PlayerData.selected_element_type == Element.Type.NULL and fallback_player_element:
		PlayerData.selected_element_type = fallback_player_element
		print("player element is", Element.STRING_MAP[PlayerData.selected_element_type])
	element_switcher.element_changed.connect(func(element: Element.Type): projectile_shooter.current_element = element)

func stop_moving() -> void:
	velocity = Vector2.ZERO

func move() -> void:
	velocity.x = InputHelper.get_axis() * speed

func set_camera_limit(tile_map: TileMap):
	var map_rect = tile_map.get_used_rect()
	var tile_size = tile_map.cell_quadrant_size
	var size_in_pixel = map_rect.size * tile_size
	camera.limit_top = 0
	camera.limit_left = 0
	camera.limit_right = size_in_pixel.x
	camera.limit_bottom = size_in_pixel.y

func _unhandled_input(event: InputEvent):
	state_manager.input(event)

func _physics_process(delta):
	EnvironmentEffect.process(self, delta)
	state_manager.physics_process(delta)
	var label: Label = $DebugLabel
	label.text = state_manager.curent_state.state_string_name
	move_and_slide()

func _on_visible_on_screen_enabler_2d_screen_exited():
	GameEffect.game_over()
