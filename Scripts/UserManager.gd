class_name UserManager

extends Node

const FILE_PATH = "res://files/users.txt"

# Save user
func save_user(user: User):
	var file = FileAccess.open(FILE_PATH, FileAccess.READ_WRITE)
	if file == null:
		file = FileAccess.open(FILE_PATH, FileAccess.WRITE)
	
	var users = get_all_users()
	for u in users:
		if u.email == user.email:
			print("Error: Usuario ya registrado")
			return false

	file.seek_end()
	file.store_line(user.to_csv())
	file.close()
	return true

# Get all users
func get_all_users() -> Array:
	var users = []
	if not FileAccess.file_exists(FILE_PATH):
		return users
	
	var file = FileAccess.open(FILE_PATH, FileAccess.READ)
	while not file.eof_reached():
		var line = file.get_line()
		if line.strip_edges() != "":
			var user = User.from_csv(line)
			if user:
				users.append(user)
	file.close()
	return users

# Look for an user
func find_user(email: String) -> User:
	var users = get_all_users()
	for user in users:
		if user.email == email:
			return user
	return null
