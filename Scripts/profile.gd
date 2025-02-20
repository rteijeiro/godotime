extends Control

@onready var name_label = $User_panel/MarginContainer/VBoxContainer/Name
@onready var email_label = $User_panel/MarginContainer/VBoxContainer/Email
@onready var phone_label = $User_panel/MarginContainer/VBoxContainer/Number

var user_name = ""
var user_email = ""
var user_phone = ""

func set_data(name: String, email: String, phone: String):
	user_name = name
	user_email = email
	user_phone = phone
	
func _ready():
	name_label.text = user_name
	email_label.text = user_email
	phone_label.text = user_phone

func _on_account_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/profile.tscn")

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")
	
	# Comentario de prueba

func _on_output_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")


func _on_accept_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")
