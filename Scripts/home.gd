extends Control

@onready var name_label = $Top/MarginContainer/Name  # Ruta al Label
@onready var date_label = $Panel/HBoxContainer/Date

var user_name = ""

# Método para recibir parámetros
func set_data(name: String):
	user_name = name

# Cuando la escena esté lista, actualizar los textos
func _ready():
	if user_name:
		name_label.text = "Bienvenido,  " + user_name
	update_date()

func _on_account_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/profile.tscn")

# Funcion para obtener la fecha a tiempo real
# Diccionario para traducir los meses al español
var month_names = {
	1: "enero", 2: "febrero", 3: "marzo", 4: "abril",
	5: "mayo", 6: "junio", 7: "julio", 8: "agosto",
	9: "septiembre", 10: "octubre", 11: "noviembre", 12: "diciembre"
}

func update_date():
	var date = Time.get_datetime_dict_from_system()
	var day = date["day"]
	var month = month_names[date["month"]]  # Convertimos el número a nombre de mes
	var year = date["year"]

	var formatted_date = "%d %s %d" % [day, month, year]
	date_label.text = formatted_date  # Mostramos la fecha en el botón

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")


func _on_finish_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")


func _on_output_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")

func _on_timer_timeout() -> void:
	$ProgressBar.value += 1
	$Progress.text = str($ProgressBar.value)
	$Timer.start()
