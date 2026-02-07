extends Control

@onready var point_label: Label = $HBoxContainer/VBoxContainer/PointsLabel
@onready var life_label: Label = $HBoxContainer/VBoxContainer/LifeLabel

func _physics_process(delta: float) -> void:
	point_label.text = " Points : " + str(GlobalData.points)
	life_label.text = " Life : " + str(GlobalData.life)
