extends Node

@onready var ui: Control = $CanvasLayer/UI
@onready var game_over_screen: Control = $CanvasLayer/GameOverScreen
@onready var game_over_points_label: Label = $CanvasLayer/GameOverScreen/MarginContainer/MarginContainer/Panel/CenterContainer/VBoxContainer/GameOverPointsLabel

func _ready() -> void:
	GlobalData.game_over.connect(_on_game_over)

func _on_game_over():
	game_over_points_label.text = "Number of points : " + str(GlobalData.points)
	game_over_screen.visible = true
	ui.visible = false


func _on_restart_button_pressed() -> void:
	GlobalData.life = 3
	GlobalData.is_game_over = false
	get_tree().reload_current_scene()
