extends Node3D

@export var node_path: NodePath
@export var enter_method: String
@export var exit_method: String

var baby: PathFollow3D
var babyCollision: Area3D

func _ready() -> void:
	baby = $".."
	babyCollision = $"."
	baby.progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const speed = 4.0
	baby.progress += speed * delta

func _on_area_entered(area: Area3D) -> void:
	print("Baby entered: ", area.name)
	if node_path:
		if get_node_or_null(node_path) != null:
			if get_node(node_path).has_method(enter_method):
				get_node(node_path).call(enter_method)
			else: printerr("Trigger node missing method")
		else: printerr("Trigger couldn't get node")
	else: printerr("Trigger node path empty")

func _on_area_exited(area: Area3D) -> void:
	print(area)
	if node_path:
		if get_node_or_null(node_path) != null:
			if get_node(node_path).has_method(exit_method):
				get_node(node_path).call(exit_method)
			else: printerr("Trigger node missing method")
		else: printerr("Trigger couldn't get node")
	else: printerr("Trigger node path empty")
