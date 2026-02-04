extends TileMapLayer

@onready var first_sign_arrow: Sprite2D = $FirstSignArrow
@onready var second_sign_arrow: Sprite2D = $SecondSignArrow
@onready var third_sign_arrow: Sprite2D = $ThirdSignArrow

func _ready() -> void:
	first_sign_arrow.flip_changed.connect(_on_first_flip_changed)

func _on_first_flip_changed(state):
	if state == true:
		set_cell(Vector2i(0, 5), 0, Vector2i(0, 0), 3)
	else:
		set_cell(Vector2i(0, 5), 0, Vector2i(0, 0), 4)
