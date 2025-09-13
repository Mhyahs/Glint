extends Control

var game_management: Node

# این تابع جدید است: GameManagement خود را به منو معرفی می‌کند
func set_game_manager(manager: Node):
	game_management = manager

func _ready():
	pass

func _on_resume_button_pressed() -> void:
	game_management.toggle_pause_menu()

func _on_restart_button_pressed() -> void:
	game_management.toggle_pause_menu()
	game_management.reset_point()
	get_tree().reload_current_scene()
	
func _on_exit_button_pressed() -> void:
	get_tree().quit()
