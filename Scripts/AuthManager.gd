extends Node

var user_manager = UserManager.new()
var current_user: User = null

# Register new user
func register(email, full_name, phone, password):
	var new_user = User.new(email, full_name, phone, password)
	var success = user_manager.save_user(new_user)
	if success:
		print("Registro exitoso")
		return true
	else:
		print("Error al registrar")
		return false

# Login
func login(email, password):
	var user = user_manager.find_user(email)
	if user and user.password == password:
		print("Inicio de sesión exitoso")
		current_user = user
		return true
	print("Error: Email o contraseña incorrectos")
	return false

# Logout
func logout():
	current_user = null
	print("Sesión cerrada")
