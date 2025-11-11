extends Button



func _on_pressed() -> void:
	#get_tree().change_scene_to_file("res://scenes/opening_cutscene.tscn")
	GlobalLevelManager.next_scene()
