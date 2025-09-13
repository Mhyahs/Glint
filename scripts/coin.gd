extends Area2D
@onready var game_management: Node = %GameManagement
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body):
	game_management.add_point()
	animation_player.play("default")
