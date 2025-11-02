extends Node3D

@export var isPossesed = false
var light

func _ready():
	light = $"../WALL_LAMP_2/OmniLight3D"

func togglePossesion():
	isPossesed = !isPossesed

func _process(_delta: float) -> void:
	if (isPossesed): turn_on_light()
	else: turn_off_light()

func turn_on_light():
	light.visible = true
	$".".set_collision_layer_value(5, false)
	#print("Going")

func turn_off_light():
	light.visible = false
	$".".set_collision_layer_value(5, true)
	#print("Stopping")
