extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_area_3d_body_entered(_body: Node3D) -> void:
	pass

func _on_area_shape_entered(_area_rid: RID, area: Area3D, _area_shape_index: int, _local_shape_index: int) -> void:
	print(area.name + ' entered my tight hole.')
	print(area.get_parent_node_3d().name)
	if area.get_parent_node_3d().is_in_group('Box'):
		area.get_parent_node_3d().queue_free()
		get_parent().queue_free()
