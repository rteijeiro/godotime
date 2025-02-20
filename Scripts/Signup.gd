extends Control

@onready var email_input = $VBoxContainer.get_node("Email")
@onready var full_name_input = $VBoxContainer.get_node("User")
@onready var phone_input = $VBoxContainer.get_node("Telephone")
@onready var password_input = $VBoxContainer.get_node("Password")
@onready var register_button = $Login
@onready var error_label = $VBoxContainer.get_node("ErrorLabel")


var user_manager = UserManager.new()

func _ready():
	# Depuración para ver si encuentra el botón
	print("Nodo Register encontrado:", register_button)

	if register_button:  # Evita el error si el botón es null
		register_button.pressed.connect(_on_register_pressed)
	else:
		print("⚠️ ERROR: No se encontró el botón Register. Verifica su nombre y estructura en la escena.")

# Función para registrar al usuario
func _on_register_pressed():
	var email = email_input.text.strip_edges()
	var full_name = full_name_input.text.strip_edges()
	var phone = phone_input.text.strip_edges()
	var password = password_input.text.strip_edges()
	
	# Validar que los campos no estén vacíos
	if email.is_empty() or full_name.is_empty() or phone.is_empty() or password.is_empty():
		error_label.text = "Todos los campos son obligatorios"
		return

	# Crear usuario con horario por defecto
	var new_user = User.new(email, full_name, phone, password, "08:00 - 14:00")
	
	# Intentar guardar el usuario
	var success = user_manager.save_user(new_user)
	
	if success:
		print("Usuario registrado con éxito")
		get_tree().change_scene_to_file("res://Scenes/Login.tscn")  # Redirigir a la pantalla de login
	else:
		error_label.text = "El correo ya está registrado"
