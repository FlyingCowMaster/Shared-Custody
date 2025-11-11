extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("OpeningCutscene")

func _process(_delta: float) -> void:
	if Input.is_anything_pressed():
		GlobalLevelManager.next_scene()
		# The cutscene is now skippable

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	GlobalLevelManager.next_scene()
