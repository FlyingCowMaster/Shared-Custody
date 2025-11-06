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
		$LightTrigger/CollisionShape3D.translate(Vector3(0, -50, 0))
	else:
		light.visible = false
		$LightTrigger/CollisionShape3D.translate(Vector3(0, 50, 0))
