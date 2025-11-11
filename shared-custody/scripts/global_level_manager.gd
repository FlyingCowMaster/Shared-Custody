extends Node

var current_scene = null
var current_scene_path = null
var level_index: int = 0
var levels_array: Array = [
"res://scenes/title_screen.tscn", 
"res://scenes/opening_cutscene.tscn",
"res://scenes/tutorial.tscn",
"res://scenes/level1.tscn",
"res://scenes/level2.tscn",
"res://scenes/level3.tscn",
"res://scenes/level4.tscn",
"res://scenes/ending_cutscene.tscn"] 

##Checks if the stored scene index matches the current scene, sets to proper index if nesscary
func sync_scene_index():
	current_scene_path = current_scene.scene_file_path
	if levels_array[level_index] != current_scene_path:
		if levels_array.has(current_scene_path):
			level_index = levels_array.find(current_scene_path)
		else:
			push_error("{%} not in levels_array in global_level_manager.gd, switching scenes will not 
			work as intended. If you don't know what this means, ask Joey".format({"%" : current_scene_path}))


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(-1)
	sync_scene_index()

##Goes to the next scene in the array levels_array found in global_level_manager.gd
func next_scene():
	sync_scene_index()
	level_index += 1
	if level_index >= len(levels_array):
		level_index = 0
	goto_scene(levels_array[level_index])

##Changes scene to given scene, must use full path name. Defualts to current scene
func goto_scene(path="current scene"):
	get_tree().current_scene = current_scene
	if path == "current scene":
		path = get_tree().current_scene.scene_file_path
	_deferred_goto_scene.call_deferred(path)

func _deferred_goto_scene(path):
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.get_tree().current_scene = current_scene
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	#get_tree().current_scene = current_scene
