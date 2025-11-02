extends PathFollow3D

@export var speed = 4

func _process(delta: float) -> void:
	progress += speed * delta
