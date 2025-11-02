extends StaticBody3D

@export var isPossesedMom = false
@export var isPossesedDad = false

func togglePossesionMom():
	isPossesedMom = !isPossesedMom

func togglePossesionDad():
	isPossesedDad = !isPossesedDad

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	if isPossesedDad and isPossesedMom:
		print("Shared Possesion!")
		GlobalLevelManager.goto_scene()
