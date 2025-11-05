extends StaticBody3D

@export var isPossesedMom: bool = false
@export var isPossesedDad: bool = false

func togglePossesionMom():
	isPossesedMom = !isPossesedMom
	shared_possesion_check()

func togglePossesionDad():
	isPossesedDad = !isPossesedDad
	shared_possesion_check()

func shared_possesion_check():
	if isPossesedDad and isPossesedMom:
		print("Shared Possesion!")
		GlobalLevelManager.goto_scene()
