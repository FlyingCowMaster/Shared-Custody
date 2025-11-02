extends Node3D

@export var root_node: NodePath
@export var enter_method: String
@export var exit_method: String
@export var maxSpeed = 4.0
var speed = maxSpeed

var baby: PathFollow3D
var babyCollision: Area3D

func _ready() -> void:
	baby = $".."
	babyCollision = $"."
	baby.progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	baby.progress += speed * delta

func _on_area_entered(area: Area3D) -> void:
	print("Baby entered: ", area.name)
	if (false):
		# Kill Baby
		get_node(root_node).call("restartLevel")
	elif (area.name.begins_with("Light")):
		# Block Baby
		speed = -maxSpeed
		print("Blocked")
	else: 
		speed = maxSpeed
		print("Unblocked")

func _on_area_exited(_area: Area3D) -> void:
	pass
