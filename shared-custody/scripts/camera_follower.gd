extends Camera3D

@export var mother: Node3D
@export var father: Node3D

@export var follow_speed: float = 5.0
@export var zoom_speed: float = 3.0
@export var min_fov: float = 40.0
@export var max_fov: float = 70.0
@export var height_offset: float = 20
@export var distance_back: float = 10.0

func _process(delta: float) -> void:
	var midpoint = (mother.global_transform.origin + father.global_transform.origin) * 0.5
	var distance = mother.global_transform.origin.distance_to(father.global_transform.origin)
	var target_fov = lerp(min_fov, max_fov, clamp((distance - 50) / -30, 0.0, 1.0))
	var target_position = midpoint + Vector3(0, 20 + (distance / 2), distance_back)
	
	fov = lerp(fov, target_fov, zoom_speed * delta)
	global_transform.origin = global_transform.origin.lerp(target_position, follow_speed * delta)
