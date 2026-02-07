extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D
@onready var shape_cast_2d: ShapeCast2D = $ShapeCast2D
@onready var shape_cast_2d_2: ShapeCast2D = $ShapeCast2D2

@export var exit_number : int

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
	match exit_number:
		0:
			if body.collision_layer == 64:
				GlobalData.points += 1
				queue_free()
			elif body.collision_layer == 128:
				GlobalData.life -= 1
				queue_free()
			elif body.collision_layer == 256:
				GlobalData.life -= 1
				queue_free()
		1:
			if body.collision_layer == 128:
				GlobalData.points += 1
				queue_free()
			elif body.collision_layer == 64:
				GlobalData.life -= 1
				queue_free()
			elif body.collision_layer == 256:
				GlobalData.life -= 1
				queue_free()
		2:
			if body.collision_layer == 256:
				GlobalData.points += 1
				queue_free()
			elif body.collision_layer == 64:
				GlobalData.life -= 1
				queue_free()
			elif body.collision_layer == 128:
				GlobalData.life -= 1
				queue_free()
	
	if body.collision_layer == 32:
		await get_tree().create_timer(0.9).timeout
		queue_free()
