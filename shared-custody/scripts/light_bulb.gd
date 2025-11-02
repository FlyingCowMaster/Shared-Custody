extends Node3D

var light

func _ready():
	light = $WALL_LAMP_2/OmniLight3D

func turn_on_light():
	light.visible = true

func turn_off_light():
	light.visible = false
