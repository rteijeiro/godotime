extends Control

func _on_account_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/profile.tscn")

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")
	
	# Comentario de prueba

func _on_output_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/logout.tscn")


func _on_accept_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Home.tscn")
