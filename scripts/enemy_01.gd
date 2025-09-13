extends AnimatableBody2D

@export var speed: float = 50.0
@export var direction: int = 1  # -1: چپ / 1: راست
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var hurt_sound: AudioStreamPlayer2D = $hurtSound

func _physics_process(delta) -> void:
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	position.x += speed * direction * delta


func _on_kill_zone_body_entered(body: Node2D) -> void:
	 # Replace with function body.
	hurt_sound.play()
