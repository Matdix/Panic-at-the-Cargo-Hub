extends Node2D

@onready var marker_2d: Marker2D = $Marker2D

const BOX_1 = preload("uid://dc0umrvd5ipww")
const BOX_2 = preload("uid://cc11it6mvt67n")
const BOX_3 = preload("uid://db3uwsmv188tr")


var box_scenes = [BOX_1, BOX_2, BOX_3]
var boxes_position : Vector2

var time_to_wait : float = 7.5

func _ready() -> void:
	boxes_position = marker_2d.position
	spawn_boxes()
	update_time()


func update_time():
	if time_to_wait != 0.5:
			time_to_wait -= 0.5
	await get_tree().create_timer(20).timeout
	update_time()

func spawn_boxes():
	if !GlobalData.is_game_over:
		var random_scene : PackedScene = box_scenes.pick_random()
		var box : CharacterBody2D = random_scene.instantiate()
		box.position = boxes_position
		add_child(box)
		await get_tree().create_timer(time_to_wait).timeout
		spawn_boxes()
