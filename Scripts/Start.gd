extends Node 




func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Signup.tscn")


func _on_login_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Login.tscn")
