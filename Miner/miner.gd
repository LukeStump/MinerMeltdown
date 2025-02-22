extends CharacterBody2D


const SPEED = 100.0
#const JUMP_VELOCITY = -400.0

@onready var iceDetect = get_node("IceDetect")
@onready var animation = get_node("AnimatedSprite2D")

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("dialogue_click"):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogue/testdialogue.dialogue"), "start")
		return


func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("mine"):
		if iceDetect.body:
			#print("mining away")
			iceDetect.body.melt_ice_scene()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		animation.flip_h = direction < 0
		#animation.
		animation.play()
	else:
		animation.stop()
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
