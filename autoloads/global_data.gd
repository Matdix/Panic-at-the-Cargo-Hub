extends Node

signal game_over

var is_game_over := false

var conveyor : Conveyor

var actual_frame = 0

var points : int = 0
var life : int = 3


func _physics_process(delta: float) -> void:
	if life == 0:
		game_over.emit()
		is_game_over = true
	actual_frame = conveyor.actual_frame
