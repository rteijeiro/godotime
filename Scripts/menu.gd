extends Node  # Make sure your script inherits from Node

@onready var label = $Label  # We use the @onready annotation to get the Label when it's ready

func _ready():
	pass
	# Enable click detection on the label
	#label.mouse_filter = Control.MOUSE_FILTER_PASS
	# Properly connect the gui_input signal using Callable
	#label.connect("gui_input", Callable(self, "_on_label_input"))
	
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Login.tscn")

func _on_label_input(event):
	# Check if the event is a left mouse click
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Check if the click was within the Label's area
		if label.get_visible_rect().has_point(event.position):
			# Load the Signup scene
			get_tree().change_scene_to_file("res://Scenes/Signup.tscn")
