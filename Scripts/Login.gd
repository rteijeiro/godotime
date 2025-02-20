extends Control

@onready var email_input = $VBoxContainer.get_node("User")
@onready var password_input = $VBoxContainer.get_node("Password")
@onready var login_button = $Login
@onready var error_label = $VBoxContainer.get_node("ErrorLabel")

var user_manager = UserManager.new()

func _ready():
	# Depuración para ver si encuentra el botón
	print("Nodo Login encontrado:", login_button)

	if login_button:  # Evita el error si el botón es null
		login_button.pressed.connect(_on_login_pressed)
	else:
		print("⚠️ ERROR: No se encontró el botón Login. Verifica su nombre y estructura en la escena.")

func _on_login_pressed() -> void:
	var email = email_input.text.strip_edges()
	var password = password_input.text.strip_edges()

	# Validar que los campos no estén vacíos
	if email.is_empty() or password.is_empty():
		error_label.text = "Debe completar todos los campos."
		return

	# Buscar usuario en la base de datos
	var user_data = user_manager.find_user(email)

	if user_data == null:
		error_label.text = "El usuario no existe."
		return

	# Verificar contraseña
	if user_data["password"] != password:
		error_label.text = "Contraseña incorrecta."
		return

	# Login exitoso, obtener datos del usuario
	var full_name = user_data["full_name"]
	# var schedule = user_data["schedule"]

	print("Usuario autenticado:", full_name)

	# Cargar la escena Home y pasar los datos del usuario
	var home_scene = load("res://Scenes/Home.tscn").instantiate()
	home_scene.set_data(full_name)  # Pasamos parámetros a Home
	get_tree().root.add_child(home_scene)  # Agregar la escena al árbol
	get_tree().current_scene.queue_free()  # Cerrar la escena actual
