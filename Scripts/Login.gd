extends Control

@onready var email_input = $VBoxContainer.get_node("User")
@onready var password_input = $VBoxContainer.get_node("Password")
@onready var login_button = $Login

var user_manager = UserManager.new()
var full_name: String

func _ready():
	# Depuración para ver si encuentra el botón
	print("Nodo Login encontrado:", login_button)

	if login_button:  # Evita el error si el botón es null
		login_button.pressed.connect(_on_login_pressed)
	else:
		print("⚠️ ERROR: No se encontró el botón Login. Verifica su nombre y estructura en la escena.")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_login_pressed() -> void:
	pass # Replace with function body.
