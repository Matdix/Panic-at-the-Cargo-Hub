extends CharacterBody2D

const SPEED = 2.0

func _physics_process(delta: float) -> void:
	position.x += SPEED
