extends Control

@onready var name_label = $Top/MarginContainer/Name  # Path to the Label
@onready var date_label = $Panel/HBoxContainer/Date

var user_name = ""
var user_email = ""
var user_phone = ""
var timer = true

# Method to receive parameters
func set_data(name: String, email: String, phone: String):
	user_name = name
	user_email = email
	user_phone = phone

# When the scene is ready, update the text fields
func _ready():
	if user_name:
		name_label.text = "Welcome, " + user_name
	update_date()

func _on_account_pressed() -> void:
	var profile_scene = load("res://Scenes/profile.tscn").instantiate()
	profile_scene.set_data(user_name, user_email, user_phone)  # Pass parameters to Home
	get_tree().root.add_child(profile_scene)  # Add the scene to the tree
	

# Function to get the real-time date
# Dictionary to translate month numbers to names in Spanish
var month_names = {
	1: "January", 2: "February", 3: "March", 4: "April",
	5: "May", 6: "June", 7: "July", 8: "August",
	9: "September", 10: "October", 11: "November", 12: "December"
}

func update_date():
	var date = Time.get_datetime_dict_from_system()
	var day = date["day"]
	var month = month_names[date["month"]]  # Convert number to month name
	var year = date["year"]

	var formatted_date = "%d %s %d" % [day, month, year]
	date_label.text = formatted_date  # Display the date in the label

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")

func _on_finish_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")

func _on_output_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")

func _on_timer_timeout() -> void:
	if timer == true:
		$Timer.start()
		$TextureProgressBar.value += 1
		$LabelProgressBar.text = str($TextureProgressBar.value)

func _on_pause_pressed() -> void:
	if timer == true:
		timer = false
	else:
		timer = true
		$Timer.start()
