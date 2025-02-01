extends CharacterBody2D


const SPEED = 50.0
#const JUMP_VELOCITY = -400.0

@onready
var animation = get_node("AnimatedSprite2D")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://FrontOnMining/frontMining.tscn")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.flip_h = direction < 0
		animation.play()
	else:
		animation.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
