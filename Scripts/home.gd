extends Control

@onready var name_label = $Top/MarginContainer/Name  # Ruta al Label

var user_name = ""

# Método para recibir parámetros
func set_data(name: String):
	user_name = name

# Cuando la escena esté lista, actualizar los textos
func _ready():
	if user_name:
		name_label.text = "Bienvenido,  " + user_name

func _on_account_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/profile.tscn")

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")
