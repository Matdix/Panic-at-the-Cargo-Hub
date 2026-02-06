class_name Conveyor extends TileMapLayer

@onready var first_sign_arrow: Sign = $FirstSignArrow
@onready var second_sign_arrow: Sign = $SecondSignArrow
@onready var third_sign_arrow: Sign = $ThirdSignArrow

var actual_frame : int = 0

func _ready() -> void:
	first_sign_arrow.flip_changed.connect(_on_first_flip_changed)
	second_sign_arrow.flip_changed.connect(_on_second_flip_changed)
	third_sign_arrow.flip_changed.connect(_on_third_flip_changed)
	GlobalData.conveyor = self

func update_frame():
	await get_tree().create_timer(0.05).timeout
	actual_frame += 1
	if actual_frame == 5:
		actual_frame = 0
	update_frame()

func _on_first_flip_changed(state):
	if state == true:
		set_cell(Vector2i(-10, -5), 0, Vector2i(0, 0), 6)
		
	else:
		set_cell(Vector2i(-10, -5), 0, Vector2i(0, 0), 2)

func _on_second_flip_changed(state):
	if state == true:
		set_cell(Vector2i(0, -5), 0, Vector2i(0, 0), 6)
		
	else:
		set_cell(Vector2i(0, -5), 0, Vector2i(0, 0), 2)

func _on_third_flip_changed(state):
	if state == true:
		set_cell(Vector2i(10, -5), 0, Vector2i(0, 0), 6)
		
	else:
		set_cell(Vector2i(10, -5), 0, Vector2i(0, 0), 2)
