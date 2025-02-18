extends Control

@onready var texture_rect = $VBoxContainer/User/Line

func _ready():
	texture_rect.rect_min_size = Vector2(50, 20)  # Establecer un tamaño de 200x150 píxeles
