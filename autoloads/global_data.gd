extends Node

var conveyor : Conveyor

var actual_frame = 0

func _physics_process(delta: float) -> void:
	actual_frame = conveyor.actual_frame
