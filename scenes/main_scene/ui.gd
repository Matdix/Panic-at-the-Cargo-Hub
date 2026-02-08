extends Control

@onready var point_label: Label = $HBoxContainer/VBoxContainer/PointsLabel
@onready var life_label: Label = $HBoxContainer/VBoxContainer/LifeLabel
@onready var best_score_label: Label = $HBoxContainer/VBoxContainer/BestScoreLabel

func _ready() -> void:
	SaveLoad._load()
	
	best_score_label.text = " Best Points : " + str(SaveLoad.save_data.best_points)

func _physics_process(_delta: float) -> void:
	point_label.text = " Points : " + str(GlobalData.points)
	life_label.text = " Life : " + str(GlobalData.life)
