extends Area3D

@export var root_node: NodePath
@export var enter_method: String
@export var exit_method: String
@export var maxSpeed = 4.0
@export var isInArea = false
var speed = maxSpeed

func _ready() -> void:
	print(get_parent())
	get_parent().progress = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (not get_overlapping_areas().is_empty()): isInArea = true
	else: isInArea = false
	print(get_overlapping_areas())
	
	if (isInArea): speed = -4
	else: speed = maxSpeed
	get_parent().progress += speed * delta
