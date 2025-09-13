extends Area2D

@onready var timer: Timer = $Timer
@onready var game_management: Node = $/root/Game/GameManagement

func _on_body_entered(body):
	print("you died!")
	print("Game Management: ", game_management)
	game_management.reset_point()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
