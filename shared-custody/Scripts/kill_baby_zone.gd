extends Area3D


func _on_area_entered(area: Area3D) -> void:
	if (area.name == "Baby"):
		print("RAAAAAAAAAAA")
		get_tree().call_deferred("reload_current_scene")
