extends Node

var baby: PathFollow3D
var babyCollision: Area3D

# Restart level. Can be called after a loss animation or something. I don't know.
func restartLevel():
	get_tree().reload_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	baby = $Path3D/PathFollow3D
	babyCollision = $Path3D/PathFollow3D/Baby
	baby.progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	const speed = 4.0
	baby.progress += speed * delta

func test():
	print("I did it omg")
