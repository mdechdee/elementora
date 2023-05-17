extends Node

@export var scene_map: Dictionary # string -> PackedScene
@export var level_scenes: Array[PackedScene]

func change_to_level(idx: int):
	print(idx)
	var level_idx = idx
	if level_idx >= len(level_scenes) or level_idx < 0:
		push_error("No level with index %d" % level_idx)
		change_scene("main_menu")
		return
	var current_scene = get_tree().current_scene
	var new_level = level_scenes[level_idx].instantiate() as BaseLevelScene
	new_level.level_idx = level_idx
	get_tree().root.add_child(new_level)
	current_scene.queue_free()
	get_tree().set_current_scene(new_level)
	
func change_scene(scene_name: StringName):
	if scene_name not in scene_map:
		push_error("No scene with name %s" % scene_name)
		return
	get_tree().change_scene_to_packed(scene_map[scene_name])
