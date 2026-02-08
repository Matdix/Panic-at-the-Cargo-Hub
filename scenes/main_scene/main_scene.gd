extends Node

@onready var ui: Control = $CanvasLayer/UI
@onready var game_over_screen: Control = $CanvasLayer/GameOverScreen
@onready var game_over_points_label: Label = $CanvasLayer/GameOverScreen/MarginContainer/MarginContainer/Panel/CenterContainer/VBoxContainer/GameOverPointsLabel

func _ready() -> void:
	GlobalData.game_over.connect(_on_game_over)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Exit"):
		SaveLoad.save_data.best_points = GlobalData.points
		SaveLoad._save()
		get_tree().quit()


func _on_game_over():
	game_over_points_label.text = "Number of points : " + str(GlobalData.points)
	game_over_screen.visible = true
	ui.visible = false
	SaveLoad.save_data.best_points = GlobalData.points
	
	SaveLoad._save()


func _on_restart_button_pressed() -> void:
	GlobalData.is_game_over = false
	get_tree().reload_current_scene()
