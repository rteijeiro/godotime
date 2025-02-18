extends Node  # Asegúrate de que tu script herede de Node

@onready var label = $Label  # Usamos la anotación @onready para obtener el Label cuando esté listo

func _ready():
	pass
	# Habilitar la detección de clics en el label
	#label.mouse_filter = Control.MOUSE_FILTER_PASS
	# Conectar la señal gui_input correctamente
	#label.connect("gui_input", Callable(self, "_on_label_input"))
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Login.tscn")

func _on_label_input(event):
	# Verificamos si el evento es un clic del ratón izquierdo
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Verifica si se hizo clic en el área del Label
		if label.get_rect().has_point(event.position):
			# Cargar la escena Signup
			get_tree().change_scene("res://path_to_your_scene/Signup.tscn")
