extends Control

@onready var email_input = $Email
@onready var full_name_input = $User
@onready var phone_input = $Telephone
@onready var password_input = $Password
@onready var register_button = $Login

var user_manager = UserManager.new()
var full_name: String


func _ready():
	# Debugging to check if the register button is found
	print("Register button found:", register_button)
	
	if register_button:  # Avoids errors if the button is null
		register_button.pressed.connect(_on_register_pressed)
	else:
		print("⚠️ ERROR: Register button not found. Check its name and scene structure.")

# Function to register the user
func _on_register_pressed():
	var email = email_input.text.strip_edges()
	full_name = full_name_input.text.strip_edges()
	var phone = phone_input.text.strip_edges()
	var password = password_input.text.strip_edges()
	
	# Validate that fields are not empty
	if email.is_empty() or full_name.is_empty() or phone.is_empty() or password.is_empty():
		print("All fields are mandatory")
		return
	
	# Create user with default schedule
	var new_user = User.new(email, full_name, phone, password, "08:00 - 14:00")
	
	# Attempt to save the user
	var success = user_manager.save_user(new_user)
	
	if success:
		print("User successfully registered")
		var home_scene = load("res://Scenes/home.tscn").instantiate()
		home_scene.set_data(full_name, email, phone)  # Passing parameters
		get_tree().root.add_child(home_scene)  # Add the scene to the tree
		get_tree().current_scene.queue_free()  # Optional: Close the current scene
	else:
		print("Email is already registered")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/start.tscn")
