extends Area3D

func _on_area_entered(area: Area3D) -> void:
	if (area.name == "Baby"):
		print("Death")
		GlobalLevelManager.goto_scene()
