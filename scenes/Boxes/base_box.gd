extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D

const SPEED = 16.0

var direction = "horizontal"

func _physics_process(delta: float) -> void:
	if direction == "horizontal":
		position.x += SPEED
	if direction == "vertical":
		position.y += SPEED
	
	


func _on_area_2d_body_entered(body: CollisionObject2D) -> void:
	if body.collision_layer == 16:
		await get_tree().create_timer(0.9).timeout
		direction = "vertical"
	elif body.collision_layer == 32:
		await get_tree().create_timer(0.9).timeout
		queue_free()
