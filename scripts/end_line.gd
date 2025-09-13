extends Area2D

@onready var game_management: Node = %GameManagement



func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		#get_tree().paused = true
		game_management.show_menu()
		 # Replace with function body.
