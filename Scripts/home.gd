extends Control

@onready var name_label = $Top/MarginContainer/Name  # Ruta al Label
@onready var date_label = $Panel/HBoxContainer/Date

var user_name = ""
var user_email = ""
var user_phone = ""
var timer = true


# Método para recibir parámetros
func set_data(name: String, email: String, phone: String):
	user_name = name
	user_email = email
	user_phone = phone

# Cuando la escena esté lista, actualizar los textos
func _ready():
	if user_name:
		name_label.text = "Bienvenido,  " + user_name
	update_date()

func _on_account_pressed() -> void:
	var profile_scene = load("res://Scenes/profile.tscn").instantiate()
	profile_scene.set_data(user_name, user_email, user_phone)  # Pasamos parámetros a Home
	get_tree().root.add_child(profile_scene)  # Agregar la escena al árbol

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
	var home_scene = load("res://Scenes/home.tscn").instantiate()
	home_scene.set_data(user_name, user_email, user_phone)
	get_tree().root.add_child(home_scene)

func _on_finish_pressed() -> void:
	timer = false
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")

func _on_output_pressed() -> void:
	timer = false
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")

func _on_timer_timeout() -> void:
	if timer == true:
		$TextureProgressBar.value += 1
		$LabelProgressBar.text = str($TextureProgressBar.value)
		$Timer.start()

func _on_pause_pressed() -> void:
	if timer == true:
		timer = false
	else:
		timer = true
		$Timer.start()

func _on_start_pressed() -> void:
	$Timer.start()
