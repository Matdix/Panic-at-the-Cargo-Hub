extends StaticBody2D

var animated_sprite_2d: AnimatedSprite2D

func _ready() -> void:
	GlobalData.game_over.connect(_on_game_over)

func _enter_tree() -> void:
	animated_sprite_2d = $AnimatedSprite2D
	animated_sprite_2d.frame = GlobalData.conveyor.actual_frame

func _on_game_over():
	animated_sprite_2d.stop()
