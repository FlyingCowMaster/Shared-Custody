extends Node

@export var babySpeed = 4.0
@export var babyTrailSpeed = 25.0

var baby: PathFollow3D
var babyTrail: PathFollow3D
var babyCollision: Area3D

# Restart level. Can be called after a loss animation or something. I don't know.
func restartLevel():
	get_tree().reload_current_scene()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	baby = $Path3D/PathFollow3D
	babyCollision = $Path3D/PathFollow3D/Baby
	babyTrail = $Path3D/ParticlePathFollower
	
	baby.progress = 0
	babyTrail.progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	baby.progress += babySpeed * delta
	babyTrail.progress += babyTrailSpeed * delta

func test():
	print("I did it omg")
