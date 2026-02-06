class_name Sign extends Sprite2D

@onready var area_2d: Area2D = $Area2D

signal flip_changed(state)

func _ready():
	# On connecte dynamiquement le signal de l'enfant "Area2D" au script actuel
	# Remplacez "Area2D" par le nom exact de votre nœud enfant si nécessaire
	area_2d.input_event.connect(_on_area_2d_input_event)

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	# Vérifie si c'est un clic gauche enfoncé
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		self.flip_h = !self.flip_h
		flip_changed.emit(flip_h)
