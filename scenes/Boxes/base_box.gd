extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D
@onready var shape_cast_2d: ShapeCast2D = $ShapeCast2D
@onready var shape_cast_2d_2: ShapeCast2D = $ShapeCast2D2

const SPEED = 16.0

var direction = "horizontal"


func _physics_process(delta: float) -> void:
	if shape_cast_2d.is_colliding() and shape_cast_2d_2.is_colliding():
		direction = "vertical"
	if direction == "horizontal":
		position.x += SPEED
	elif direction == "vertical":
		position.y += SPEED
	



func _on_area_2d_body_entered(body: CollisionObject2D) -> void:
	if body.collision_layer == 32:
		await get_tree().create_timer(0.9).timeout
		queue_free()
