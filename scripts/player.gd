extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_management: Node = $/root/Game/GameManagement
@onready var jump_sound: AudioStreamPlayer2D = $jumpSound

const SPEED = 100.0
const JUMP_VELOCITY = -375.0
var active: bool = true

func _physics_process(delta: float) -> void:
	if not active:
		return
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")
		jump_sound.play()
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	# for fliping
	if direction:
		animated_sprite_2d.flip_h = direction < 0
	
	
	#for animation
	if  not is_on_floor() and velocity.y > 0:
		animated_sprite_2d.play("spin")
	else:
		if direction:
			animated_sprite_2d.play("run")
		else:
			animated_sprite_2d.play("idle")
	
	# for moving
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


	
