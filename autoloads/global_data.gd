extends Node

signal game_over
var conveyor : Conveyor

var actual_frame = 0

var points : int = 0
var life : int = 3


func _physics_process(delta: float) -> void:
	if life == 0:
		game_over.emit(points)
	actual_frame = conveyor.actual_frame
