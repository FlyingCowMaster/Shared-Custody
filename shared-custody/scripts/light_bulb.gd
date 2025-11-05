extends StaticBody3D

@export var isPossesed = false
var light

func _ready():
	light = $WALL_LAMP_2/OmniLight3D
	light.visible = false

func togglePossesionMom():
	set_collision_layer_value(2,isPossesed)
	isPossesed = !isPossesed
	toggleLight()

func togglePossesionDad():
	set_collision_layer_value(3,isPossesed)
	isPossesed = !isPossesed
	toggleLight()
	
func toggleLight():
	if isPossesed: 
		light.visible = true
		set_collision_layer_value(5, false)
	else:
		light.visible = false
		set_collision_layer_value(5, true)
