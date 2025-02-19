class_name UserManager

extends Node

const FILE_PATH = "res://files/users.txt"

# Cargar todos los usuarios desde el JSON
func load_users():
	if not FileAccess.file_exists(FILE_PATH):
		return {}
	
	var file = FileAccess.open(FILE_PATH, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	
	if content.is_empty():
		return {} 
	
	var data = JSON.parse_string(content)
	return data if data is Dictionary else {} 

# Guardar usuarios en el JSON
func save_users(users: Dictionary):
	var file = FileAccess.open(FILE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(users, "\t"))
	file.close()

# Guardar un nuevo usuario
func save_user(user):
	var users = load_users()
	
	if user.email in users:
		return false
	
	users[user.email] = {
		"full_name": user.full_name,
		"phone": user.phone,
		"password": user.password,
		"hours": user.hours
	}
	
	save_users(users)
	return true

# Buscar usuario por email
func find_user(email):
	var users = load_users()
	
	if email in users:
		var data = users[email]
		return User.new(email, data["full_name"], data["phone"], data["password"], data["hours"])
	
	return null
