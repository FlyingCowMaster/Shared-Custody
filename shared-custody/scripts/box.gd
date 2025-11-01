extends StaticBody3D

@export var isPossesed = false
# How fast the player moves in meters per second.
@export var speed = 1

var target_velocity = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func togglePossesion():
	isPossesed = !isPossesed

func movement():
	if isPossesed:
		print(isPossesed)
		var direction = Vector3.ZERO

		if Input.is_action_pressed("move_right2"):
			direction.x += 1
		if Input.is_action_pressed("move_left2"):
			direction.x -= 1
		if Input.is_action_pressed("move_down2"):
			direction.z += 1
		if Input.is_action_pressed("move_up2"):
			direction.z -= 1

		if direction != Vector3.ZERO:
			direction = direction.normalized()
		# Setting the basis property will affect the rotation of the node.

		# Ground Velocity
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

		# Moving the Character
		position += target_velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if isPossesed:
		movement()
