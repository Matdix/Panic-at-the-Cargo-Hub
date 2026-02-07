extends Node

@onready var ui: Control = $CanvasLayer/UI
@onready var game_over_screen: Label = $CanvasLayer/GameOverScreen
@onready var game_over_points_label: Label = $CanvasLayer/GameOverScreen/MarginContainer/MarginContainer/Panel/CenterContainer/VBoxContainer/GameOverPointsLabel

func _ready() -> void:
	GlobalData.game_over.connect(_on_game_over)

func _on_game_over(points):
	game_over_points_label.text = "Number of points : " + str(points)
	game_over_screen.visible = true
	ui.visible = false
	get_tree().paused = true
