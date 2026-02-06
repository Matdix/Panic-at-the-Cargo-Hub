extends StaticBody2D

var animated_sprite_2d: AnimatedSprite2D

func _enter_tree() -> void:
	animated_sprite_2d = $AnimatedSprite2D
	animated_sprite_2d.frame = GlobalData.conveyor.actual_frame
