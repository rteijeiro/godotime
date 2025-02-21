extends Control

@onready var email_input = $Email
@onready var password_input = $Password
@onready var login_button = $Login

var user_manager = UserManager.new()

func _ready():
	# Debugging to check if the login button is found
	print("Login button found:", login_button)

	if login_button:  # Avoids errors if the button is null
		login_button.pressed.connect(_on_login_pressed)
	else:
		print("⚠️ ERROR: Login button not found. Check its name and scene structure.")

func _on_login_pressed() -> void:
	var email = email_input.text.strip_edges()
	var password = password_input.text.strip_edges()

	# Validate that fields are not empty
	if email.is_empty() or password.is_empty():
		print("All fields must be completed")
		return

	# Search for the user in the database
	var user_data = user_manager.find_user(email)

	if user_data == null:
		print("User does not exist")
		return

	# Verify password
	if user_data["password"] != password:
		print("Incorrect password")
		return

	# Successful login, retrieve user data
	var full_name = user_data["full_name"]
	var user_email = user_data["email"]
	var user_phone = user_data["phone"]
	# var schedule = user_data["schedule"]

	print("User authenticated:", full_name)

	# Load the Home scene and pass user data
	var home_scene = load("res://Scenes/home.tscn").instantiate()
	home_scene.set_data(full_name, user_email, user_phone)  # Passing parameters to Home
	get_tree().root.add_child(home_scene)  # Add the scene to the tree
	get_tree().current_scene.queue_free()  # Close the current scene

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start.tscn")
