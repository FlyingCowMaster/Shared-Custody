extends Node3D

@export var node_path: NodePath
@export var enter_method: String
@export var exit_method: String

func _ready():
	print("I'm ready")

func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body)
	if node_path:
		if get_node_or_null(node_path) != null:
			if get_node(node_path).has_method(enter_method):
				get_node(node_path).call(enter_method)
			else: printerr("Trigger node missing method")
		else: printerr("Trigger couldn't get node")
	else: printerr("Trigger node path empty")

func _on_area_3d_body_exited(body: Node3D) -> void:
	print(body)
	if node_path:
		if get_node_or_null(node_path) != null:
			if get_node(node_path).has_method(exit_method):
				get_node(node_path).call(exit_method)
			else: printerr("Trigger node missing method")
		else: printerr("Trigger couldn't get node")
	else: printerr("Trigger node path empty")
