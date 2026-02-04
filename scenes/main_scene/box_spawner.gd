extends Node2D

@onready var marker_2d: Marker2D = $Marker2D

const BOX_1 = preload("uid://dc0umrvd5ipww")
const BOX_2 = preload("uid://cc11it6mvt67n")
const BOX_3 = preload("uid://db3uwsmv188tr")

var boxes_position : Vector2

func _ready() -> void:
	boxes_position = marker_2d.position
	spawn_boxes()


func spawn_boxes():
	match randi() % 3:
		0:
			var box = BOX_1.instantiate()
			box.position = boxes_position
			add_child(box)
		1:
			var box = BOX_2.instantiate()
			box.position = boxes_position
			add_child(box)
		2:
			var box = BOX_3.instantiate()
			box.position = boxes_position
			add_child(box)
	await get_tree().create_timer(25).timeout
	spawn_boxes()
