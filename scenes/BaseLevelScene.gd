class_name BaseLevelScene
extends Node2D

# Injected from SceneChanger
var level_idx: int = -1

@onready var player = $Player as Player
@onready var tile_map = $ElementsTileMap as TileMap
@onready var exit_door = $ExitDoor as ExitDoor
@onready var win_ui = $WinUI as CanvasLayer

func _ready():
	print(level_idx)
	if level_idx == -1:
		push_warning("level_idx should be injected into BaseLevelScene instance")
	if not player:
		push_warning("Player is not detected in this scene", self)
	if not tile_map:
		push_warning("Level Tile Map is not detected in this scene", self)

	player.set_camera_limit(tile_map)
	exit_door.door_entered.connect(stage_clear)

func stage_clear():
	win_ui.show()

func _on_next_level_button_pressed() -> void:
	SceneManager.change_to_level(level_idx + 1)

func _on_main_menu_button_pressed() -> void:
	SceneManager.change_scene("main_menu")
