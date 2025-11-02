extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 13
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
@export var isPossesing = false
var target_velocity = Vector3.ZERO

var posessed: Node3D
var canPosess: bool
var possesionFunc: String

func _ready():
	canPosess = true
	print()
			
func possesionCheck():
	$Area3D.monitoring = true
	await get_tree().create_timer(.1).timeout
	$Area3D.monitoring = false

func _physics_process(delta):
	if !isPossesing:
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

		# Vertical Velocity
		if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
			target_velocity.y = target_velocity.y - (fall_acceleration * delta)

		# Moving the Character
		velocity = target_velocity
		move_and_slide()
	if Input.is_action_pressed("possesion2") and canPosess:
		canPosess = false
		if not isPossesing:
			print("possesion!")
			possesionCheck()
		else:
			isPossesing = false
			posessed.call(possesionFunc)
			$MeshInstance3D.show()
		get_tree().create_timer(0.5).timeout.connect(func(): canPosess = true)

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("Dad entered ", body.name)
	if body.has_method("togglePossesion"):
		body.call("togglePossesion")
		$MeshInstance3D.visible = false
		posessed = body
		isPossesing = true
		possesionFunc = "togglePossesion"
	
	elif body.has_method("togglePossesionDad"):
		print("found dad")
		body.call("togglePossesionDad")
		$MeshInstance3D.visible = false
		posessed = body
		isPossesing = true
		possesionFunc = "togglePossesionDad"
	
	elif body.get_parent().has_method("togglePossesion"):
		body.get_parent().call("togglePossesion")
		$MeshInstance3D.visible = false
		posessed = body
		isPossesing = true
		possesionFunc = "togglePossesion"
